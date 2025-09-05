# 🔧 راهنمای خودکار بررسی و رفع خطاهای Linter

## 🚀 راه‌های مختلف بررسی خطاها:

### 1. **بررسی دستی:**
```bash
flutter analyze
```

### 2. **رفع خودکار خطاها:**
```bash
dart fix --apply
```

### 3. **اسکریپت ساده:**
```bash
.\check_and_fix.ps1
```

### 4. **اسکریپت پیشرفته:**
```bash
# بررسی یکباره با رفع خودکار
.\auto_linter.ps1 -Fix

# بررسی مداوم هر 5 ثانیه
.\auto_linter.ps1 -Watch -Fix

# بررسی مداوم هر 10 ثانیه
.\auto_linter.ps1 -Watch -Fix -Interval 10
```

## 📋 انواع خطاهای رایج:

- ✅ **unused_import** - Import های غیرضروری
- ✅ **deprecated_member_use** - استفاده از کدهای منسوخ شده
- ✅ **prefer_interpolation_to_compose_strings** - ترجیح string interpolation
- ✅ **avoid_print** - استفاده از debugPrint به جای print

## 🎯 توصیه‌ها:

1. **قبل از commit** همیشه `flutter analyze` اجرا کنید
2. **حین توسعه** از حالت Watch استفاده کنید
3. **برای CI/CD** از `dart fix --apply` استفاده کنید

## 🔄 خودکارسازی در VS Code:

در فایل `.vscode/settings.json` اضافه کنید:
```json
{
  "dart.flutterAnalyzeOnSave": true,
  "dart.autoFixOnSave": true
}
```
