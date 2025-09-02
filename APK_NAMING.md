# 📱 راهنمای نام‌گذاری APK - APK Naming Guide

## 🎯 فرمت نام APK:
```
bb-app-seify-{version}.apk
```

## 📋 مثال‌های نام‌گذاری:

### 🔧 نسخه‌های توسعه:
- `bb-app-seify-v1.6.3.1.apk` (شهریور 3، نسخه 1)
- `bb-app-seify-v1.6.3.2.apk` (شهریور 3، نسخه 2)
- `bb-app-seify-v1.6.4.1.apk` (شهریور 4، نسخه 1)

### 🚀 نسخه‌های انتشار:
- `bb-app-seify-v1.6.3.apk` (شهریور 3)
- `bb-app-seify-v1.6.4.apk` (شهریور 4)
- `bb-app-seify-v1.7.1.apk` (مهر 1)

## 📝 دستورات ساخت APK:

### 🔧 نسخه توسعه:
```bash
flutter build apk --release
# سپس نام فایل را تغییر دهید:
# build/app/outputs/flutter-apk/app-release.apk → bb-app-seify-v1.6.3.1.apk
```

### 🚀 نسخه انتشار:
```bash
flutter build apk --release
# سپس نام فایل را تغییر دهید:
# build/app/outputs/flutter-apk/app-release.apk → bb-app-seify-v1.6.3.apk
```

## 🗂️ ساختار پوشه‌ها:
```
@ apk versions/
├── bb-app-seify-v1.6.3.1.apk
├── bb-app-seify-v1.6.3.2.apk
├── bb-app-seify-v1.6.3.apk (انتشار)
└── bb-app-seify-v1.6.4.1.apk
```

## ⚠️ نکات مهم:
1. همیشه نسخه توسعه را با 4 عدد بنویسید
2. هنگام انتشار، عدد آخر را حذف کنید
3. نام فایل باید دقیقاً مطابق فرمت باشد
4. نسخه‌های قدیمی را نگه دارید برای رجوع

## 🔄 فرآیند انتشار:
1. توسعه: `v1.6.3.1` → `bb-app-seify-v1.6.3.1.apk`
2. تست: `v1.6.3.2` → `bb-app-seify-v1.6.3.2.apk`
3. انتشار: `v1.6.3` → `bb-app-seify-v1.6.3.apk`
