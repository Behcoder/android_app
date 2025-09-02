# راهنمای آپلود فایل‌ها به هاست

## 📁 فایل‌های مورد نیاز برای آپلود:

### 1. فایل‌های API (PHP)
**مسیر مبدا:** `build/web/api/`
**مسیر مقصد:** `public_html/api/`

- `gallery-manager.php` → `public_html/api/gallery-manager.php`
- `products-manager.php` → `public_html/api/products-manager.php`

### 2. فایل‌های اصلی Flutter Web
**مسیر مبدا:** `build/web/`
**مسیر مقصد:** `public_html/`

- `main.dart.js` → `public_html/main.dart.js`
- `flutter.js` → `public_html/flutter.js`

### 3. فایل‌های کد Flutter (در پروژه شما)
**مسیر مبدا:** `lib/`
**مسیر مقصد:** در پروژه Flutter شما

- `lib/services/api_service.dart` → در پروژه Flutter شما
- `lib/main.dart` → در پروژه Flutter شما

## ⚠️ نکات مهم:

### 1. تنظیم Consumer Key و Secret
در فایل `products-manager.php` خطوط زیر را پیدا و اصلاح کنید:

```php
$consumerKey = 'ck_1234567890abcdef'; // کلید واقعی WooCommerce شما
$consumerSecret = 'cs_1234567890abcdef'; // رمز واقعی WooCommerce شما
```

### 2. مجوزهای فایل
پس از آپلود، مجوزهای فایل‌ها را تنظیم کنید:
- فایل‌های PHP: `644`
- پوشه‌ها: `755`

### 3. تست API
پس از آپلود، این آدرس‌ها را تست کنید:

- **گالری:** `https://app.seify.ir/api/gallery-manager.php?action=list&category=general`
- **محصولات:** `https://app.seify.ir/api/products-manager.php?action=list`
- **دسته‌بندی‌ها:** `https://app.seify.ir/api/products-manager.php?action=categories`

## 🔧 عیب‌یابی:

### اگر API کار نکرد:
1. مجوزهای فایل را بررسی کنید
2. Consumer Key و Secret را بررسی کنید
3. لاگ فایل‌ها را در `cache/` بررسی کنید

### اگر تصاویر نمایش داده نشد:
1. SSL سرور را بررسی کنید
2. CORS headers را بررسی کنید
3. مسیر تصاویر را بررسی کنید

## 📞 پشتیبانی:
در صورت بروز مشکل، لاگ فایل‌ها را بررسی کنید:
- `cache/products.log`
- `cache/gallery.log`
