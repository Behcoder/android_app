# Advanced Auto Linter Script
# این اسکریپت به طور مداوم خطاها را بررسی و رفع می‌کند

param(
    [switch]$Watch,  # برای بررسی مداوم
    [switch]$Fix,    # برای رفع خودکار
    [int]$Interval = 5  # فاصله زمانی بررسی (ثانیه)
)

function Show-Header {
    Clear-Host
    Write-Host "🚀 Auto Linter - Flutter Project" -ForegroundColor Magenta
    Write-Host "=================================" -ForegroundColor Magenta
    Write-Host "📁 Project: beb_app-dev-Y04M06D11" -ForegroundColor Cyan
    Write-Host "⏰ Time: $(Get-Date -Format 'HH:mm:ss')" -ForegroundColor Cyan
    Write-Host ""
}

function Test-LinterIssues {
    Write-Host "🔍 بررسی خطاهای Linter..." -ForegroundColor Yellow
    
    $result = flutter analyze 2>&1
    $hasIssues = $result -notmatch "No issues found"
    
    if ($hasIssues) {
        Write-Host "❌ خطاهایی یافت شد:" -ForegroundColor Red
        Write-Host $result -ForegroundColor Red
        
        if ($Fix) {
            Write-Host "`n🔧 اعمال اصلاحات خودکار..." -ForegroundColor Yellow
            dart fix --apply
            Write-Host "✅ اصلاحات اعمال شد!" -ForegroundColor Green
        }
        
        return $true
    } else {
        Write-Host "✅ هیچ خطایی یافت نشد!" -ForegroundColor Green
        return $false
    }
}

# اجرای اصلی
Show-Header

if ($Watch) {
    Write-Host "👀 حالت Watch فعال - هر $Interval ثانیه بررسی می‌شود" -ForegroundColor Cyan
    Write-Host "برای توقف Ctrl+C بزنید" -ForegroundColor Yellow
    Write-Host ""
    
    while ($true) {
        $hasIssues = Test-LinterIssues
        if ($hasIssues -and $Fix) {
            Write-Host "`n🔄 بررسی مجدد..." -ForegroundColor Cyan
            Start-Sleep 2
            Test-LinterIssues
        }
        
        Write-Host "`n⏳ انتظار $Interval ثانیه..." -ForegroundColor Gray
        Start-Sleep $Interval
        Show-Header
    }
} else {
    Test-LinterIssues
}

Write-Host "`n🎉 عملیات کامل شد!" -ForegroundColor Green
