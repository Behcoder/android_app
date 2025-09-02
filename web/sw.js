const CACHE_VERSION = 'seify-pwa-v1.0.2';
const APP_SHELL_CACHE = `app-shell-${CACHE_VERSION}`;
const RUNTIME_CACHE = `runtime-${CACHE_VERSION}`;

// Core files to cache for offline (app shell)
const APP_SHELL_FILES = [
	'/',
	'/index.html',
	'/manifest.json',
	'/favicon.png',
	'/flutter.js'
];

self.addEventListener('install', (event) => {
	event.waitUntil(
		caches.open(APP_SHELL_CACHE).then((cache) => cache.addAll(APP_SHELL_FILES))
	);
	self.skipWaiting();
});

self.addEventListener('activate', (event) => {
	event.waitUntil(
		caches.keys().then((keys) =>
			Promise.all(
				keys
					.filter((key) => ![APP_SHELL_CACHE, RUNTIME_CACHE].includes(key))
					.map((key) => caches.delete(key))
			)
		)
	);
	self.clients.claim();
});

// Strategy:
// - HTML (navigation requests): network-first
// - Images: network-first (same-origin), DIRECT NETWORK for cross-origin
// - Other static assets: cache-first
// - Default: stale-while-revalidate
self.addEventListener('fetch', (event) => {
	const { request } = event;
	const url = new URL(request.url);

	if (request.method !== 'GET') return;

	// Navigation -> network-first
	if (request.mode === 'navigate' || (request.headers.get('accept') || '').includes('text/html')) {
		event.respondWith(networkFirst(request));
		return;
	}

	// Images
	if (/\.(?:png|jpg|jpeg|webp|gif|svg)$/.test(url.pathname)) {
		// Cross-origin images: bypass caches and fetch directly to avoid CORS/cache interference
		if (url.origin !== location.origin) {
			event.respondWith(fetch(request));
			return;
		}
		// Same-origin images: network-first to avoid staleness
		event.respondWith(networkFirst(request));
		return;
	}

	// Other static assets
	if (/\.(?:js|mjs|css|ico|woff2?|ttf|otf|wasm)$/.test(url.pathname)) {
		event.respondWith(cacheFirst(request));
		return;
	}

	// Default
	event.respondWith(staleWhileRevalidate(request));
});

async function networkFirst(request) {
	const cache = await caches.open(APP_SHELL_CACHE);
	try {
		const response = await fetch(request, { cache: 'no-store' });
		cache.put(request, response.clone());
		return response;
	} catch (err) {
		const cached = await cache.match(request);
		if (cached) return cached;
		return caches.match('/index.html');
	}
}

async function cacheFirst(request) {
	const cache = await caches.open(RUNTIME_CACHE);
	const cached = await cache.match(request);
	if (cached) return cached;
	const response = await fetch(request);
	cache.put(request, response.clone());
	return response;
}

async function staleWhileRevalidate(request) {
	const cache = await caches.open(RUNTIME_CACHE);
	const cachedPromise = cache.match(request);
	const networkPromise = fetch(request)
		.then((response) => {
			cache.put(request, response.clone());
			return response;
		})
		.catch(() => undefined);
	const cached = await cachedPromise;
	return cached || networkPromise || fetch(request);
}

self.addEventListener('message', (event) => {
	if (event.data && event.data.type === 'SKIP_WAITING') {
		self.skipWaiting();
	}
});
