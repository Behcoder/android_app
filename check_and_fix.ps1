# PowerShell Script for Automatic Linter Check and Fix
# این اسکریپت به طور خودکار خطاهای linter را بررسی و رفع می‌کند

Write-Host "🔍 بررسی خطاهای Linter..." -ForegroundColor Cyan

# بررسی خطاها
Write-Host "`n📊 اجرای Flutter Analyze..." -ForegroundColor Yellow
flutter analyze

# اعمال اصلاحات خودکار
Write-Host "`n🔧 اعمال اصلاحات خودکار..." -ForegroundColor Yellow
dart fix --apply

# بررسی نهایی
Write-Host "`n✅ بررسی نهایی..." -ForegroundColor Green
flutter analyze

Write-Host "`n🎉 بررسی و اصلاح کامل شد!" -ForegroundColor Green
