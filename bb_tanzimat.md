# ⚙️ تنظیمات پروژه سیفی مارکت - Seify Market Project Settings

## 📱 اطلاعات ورژن اپلیکیشن - APP VERSION INFORMATION

### 🎯 فرمت ورژن‌بندی:
- **توسعه (Development)**: `v1.X.Y.Z`
  - X = ماه شمسی (1-12)
  - Y = روز ماه (1-31) 
  - Z = شماره نسخه روزانه (1, 2, 3...)
- **انتشار (Release)**: `v1.X.Y` (بدون Z)

### 📅 ورژن فعلی:
- **توسعه**: `v1.6.3.1` (شهریور 3، نسخه 1)
- **انتشار**: `v1.6.3` (شهریور 3)
- **تاریخ**: سوم شهریور 1403

### 🔄 نحوه بروزرسانی ورژن:
1. **در `lib/constants/app_config.dart`**:
   ```dart
   static const String appVersion = 'v1.6.3.1'; // برای توسعه
   static const String appVersion = 'v1.6.3';   // برای انتشار
   ```

2. **در `pubspec.yaml`**:
   ```yaml
   version: 1.5.58+1  # بر اساس ورژن جدید تغییر دهید
   ```

## 🚀 دستورات اجرا - RUN COMMANDS

### 💻 اجرای اپ:
```bash
# ویندوز (با verbose)
flutter run -d windows -v

# ویندوز (با hot reload)
flutter run -d windows --hot

# اندروید
flutter run -d android

# وب (PWA)
flutter run -d web-server --web-port 8080
```

### 📦 دستورات مفید:
```bash
# نصب پکیج‌ها
flutter pub get

# پاک کردن cache
flutter clean

# ساخت APK
flutter build apk --release

# ساخت وب
flutter build web --release

# بررسی وابستگی‌ها
flutter pub deps
```

## ⚙️ تنظیمات اجرا - RUN SETTINGS

### 🚫 غیرفعال کردن auto pub get:
```bash
flutter config --no-enable-web
flutter config --enable-web
flutter config --no-enable-macos-desktop
flutter config --enable-macos-desktop
```

### 📝 یادداشت‌های مهم:
- **هر بار قبل از `flutter run`**: `flutter pub get` را دستی اجرا کنید
- **چرخه توسعه**: تغییر کد → `flutter pub get` → `flutter run`
- **خطاهای const**: از `const` در `Scaffold` و `BoxDecoration` با `Colors.shade` استفاده نکنید

## 🎨 تنظیمات Cursor IDE

### 📋 Extensions پیشنهادی:
- Flutter
- Dart
- Flutter Widget Snippets
- Bracket Pair Colorizer
- GitLens
- Error Lens
- Auto Rename Tag

### ⌨️ کلیدهای میانبر مهم:
- `Ctrl + Shift + P`: Command Palette
- `Ctrl + .`: Quick Fix
- `F12`: Go to Definition
- `Shift + F12`: Find All References
- `Ctrl + Shift + F`: Find in Files
- `Ctrl + D`: Select Next Occurrence

### 🎨 تنظیمات تم:
- **Theme**: Dark+ (default dark)
- **Font**: Consolas, 'Courier New', monospace
- **Font Size**: 14
- **Tab Size**: 2 spaces

## 🔧 تنظیمات پروژه

### 📁 ساختار فایل‌ها:
```
lib/
├── constants/
│   ├── app_config.dart      # تنظیمات کلی اپ
│   └── app_texts.dart       # متون ثابت
├── pages/                   # صفحات اپ
├── services/                # سرویس‌ها (API, Connectivity)
├── widgets/                 # ویجت‌های قابل استفاده مجدد
└── main.dart               # فایل اصلی
```

### 🎯 تنظیمات مهم در `app_config.dart`:
```dart
// دسته‌بندی‌های مخفی
static const List<String> hiddenCategories = [
  'فروش ویژه',
  'محصولات ویژه اپ',
  'featured-app-products',
  'special-sale',
];

// فیلتر محصولات (قیمت ≥ 2 ریال یا "تماس بگیرید")
static bool isValidProductPrice(dynamic product) {
  // منطق فیلتر کردن
}
```

### 🔐 API Keys:
- فایل: `assets/config.env`
- **نکته**: این فایل در `.gitignore` است و آپلود نمی‌شود
- محتوا:
  ```env
  WOOCOMMERCE_CONSUMER_KEY=your_key_here
  WOOCOMMERCE_CONSUMER_SECRET=your_secret_here
  WOOCOMMERCE_BASE_URL=https://your-domain.com/wp-json/wc/v3
  ```

## 📱 تنظیمات PWA

### 🌐 ساخت PWA:
```bash
flutter build web --release
```

### 📋 فایل‌های مهم PWA:
- `web/index.html` - صفحه اصلی
- `web/manifest.json` - تنظیمات PWA
- `build/web/` - خروجی نهایی

### 🍎 تنظیمات iOS:
- Meta tags در `index.html`:
  ```html
  <meta name="apple-mobile-web-app-capable" content="yes">
  <meta name="apple-mobile-web-app-status-bar-style" content="default">
  <meta name="apple-mobile-web-app-title" content="سیفی مارکت">
  ```

### 📦 استقرار:
- **مکان**: `public_html/` در هاست
- **الزامات**: HTTPS، MIME types صحیح
- **فایل‌ها**: تمام محتویات `build/web/` را کپی کنید

## 🚨 مشکلات رایج و راه‌حل

### ❌ خطاهای const:
```dart
// ❌ اشتباه
const Scaffold(...)
const BoxDecoration(color: Colors.blue.shade100)

// ✅ درست
Scaffold(...)
BoxDecoration(color: const Color(0xFFE3F2FD))
```

### 🔄 خطاهای build:
```bash
# اگر build fail شد:
flutter clean
flutter pub get
flutter build apk --release
```

### 📱 مشکلات PWA:
- **manifest.json موجود نیست**: `flutter build web --release` را دوباره اجرا کنید
- **Add to Home Screen کار نمی‌کند**: HTTPS و manifest.json را بررسی کنید

## 📝 یادداشت‌های توسعه‌دهنده

### 🎯 نکات مهم:
1. **همیشه قبل از شروع**: `flutter pub get` اجرا کنید
2. **ورژن‌بندی**: از فرمت `v1.X.Y.Z` استفاده کنید
3. **فیلتر محصولات**: در `app_config.dart` تنظیم شده
4. **دسته‌بندی‌های مخفی**: "فروش ویژه" و "محصولات ویژه اپ"
5. **PWA**: برای iOS و Android قابل استفاده است

### 🔄 چرخه توسعه:
1. تغییر کد
2. `flutter pub get`
3. `flutter run -d windows -v`
4. تست و رفع خطا
5. `flutter build apk --release` (در صورت نیاز)

### 📞 در صورت مشکل:
- ابتدا `flutter clean` و `flutter pub get` را امتحان کنید
- خطاهای const را با حذف `const` از constructor های غیر-const حل کنید
- برای PWA، HTTPS و manifest.json را بررسی کنید

## 🛡️ قوانین حفاظت از فایل‌های مهم - PROTECTION RULES

### 🚫 فایل‌ها و پوشه‌هایی که **هرگز نباید حذف شوند**:

#### 📁 پوشه‌های محافظت شده:
- `zz_beb_komod/` - **پوشه مهم - هرگز حذف نشود**

#### 📄 فایل‌های محافظت شده:
- `bb_tanzimat.md` - **فایل تنظیمات اصلی - هرگز حذف نشود**
- `bb_jarian_kar.md` - **فایل تاریخچه کارها - هرگز حذف نشود**
- `bb_temp_chat.txt` - **فایل موقت یادداشت‌ها - هرگز حذف نشود**
- تمام فایل‌هایی که با پیشوند `bb_` شروع می‌شوند

#### ⚠️ قوانین مهم:
1. **قبل از حذف هر فایل**: بررسی کنید که با `bb_` شروع نشود
2. **پوشه `zz_beb_komod`**: تحت هیچ شرایطی حذف نشود
3. **فایل‌های تنظیمات**: `bb_tanzimat.md` و `bb_jarian_kar.md` محافظت شده‌اند
4. **فایل‌های APK**: فقط فایل‌های قدیمی را حذف کنید، جدیدترین‌ها را نگه دارید

#### 🔄 فرآیند پاکسازی:
- ✅ **مجاز**: حذف فایل‌های build، cache، مستندات اضافی
- ❌ **ممنوع**: حذف فایل‌های `bb_*` و پوشه `zz_beb_komod`
- ⚠️ **احتیاط**: قبل از حذف هر فایل، از اهمیت آن مطمئن شوید

---
**آخرین بروزرسانی**: سوم شهریور 1403
**ورژن**: v1.6.3.1 (توسعه)
