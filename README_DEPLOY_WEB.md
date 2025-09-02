# استقرار نسخه وب PWA سیفی مارکت

## ساخت
```bash
flutter build web --release
```
خروجی: `build/web`

## الزامات عمومی
- استفاده از HTTPS (الزامی برای PWA و iOS)
- MIME Types صحیح:
  - `.json` → `application/json`
  - `.js` → `application/javascript`
  - `.css` → `text/css`
  - `.wasm` → `application/wasm` (در صورت وجود)
- کش پیشنهاد شده:
  - `index.html`, `manifest.json`, `flutter_service_worker.js`: `Cache-Control: no-cache`
  - فایل‌های hashدار (Main JS و assets): `Cache-Control: public, max-age=31536000, immutable`

## Nginx نمونه کانفیگ
```nginx
server {
  listen 80;
  server_name example.com;
  return 301 https://$host$request_uri;
}

server {
  listen 443 ssl http2;
  server_name example.com;

  root /var/www/seify/build/web;
  index index.html;

  # Gzip (اختیاری)
  gzip on;
  gzip_types text/plain text/css application/javascript application/json application/wasm image/svg+xml;

  location /manifest.json {
    add_header Cache-Control "no-cache";
  }
  location = /index.html {
    add_header Cache-Control "no-cache";
  }
  location = /flutter_service_worker.js {
    add_header Cache-Control "no-cache";
  }

  location / {
    try_files $uri $uri/ /index.html;
  }

  # MIME Types
  types {
    application/wasm wasm;
  }
}
```

## Apache (.htaccess)
```apache
<IfModule mod_rewrite.c>
  RewriteEngine On
  RewriteBase /
  RewriteRule ^index\.html$ - [L]
  RewriteCond %{REQUEST_FILENAME} !-f
  RewriteCond %{REQUEST_FILENAME} !-d
  RewriteRule . /index.html [L]
</IfModule>

<Files "manifest.json">
  Header set Cache-Control "no-cache"
</Files>
<Files "flutter_service_worker.js">
  Header set Cache-Control "no-cache"
</Files>
```

## Netlify
- Publish directory: `build/web`
- `_redirects` در ریشه `build/web`:
```
/*    /index.html   200
```
- Headers (`_headers`) اختیاری:
```
/manifest.json
  Cache-Control: no-cache
/flutter_service_worker.js
  Cache-Control: no-cache
```

## نصب روی iOS (Safari)
1. آدرس سایت HTTPS را باز کنید
2. Share → Add to Home Screen
3. اپ به صورت تمام‌صفحه اجرا می‌شود (standalone)

## نکات
- آیکن iOS از `apple-touch-icon` در `web/index.html` استفاده می‌شود (180×180 توصیه می‌شود)
- در صورت تغییر دامنه، `start_url` و `scope` در `manifest.json` صحیح باشند
- برای Push (iOS 16.4+): نیاز به ثبت Service Worker و سرور Push دارید
