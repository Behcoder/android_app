⚠️ تنظیمات Cursor IDE - Cursor IDE Settings
📝 این فایل شامل تمام تنظیمات مهم Cursor برای پروژه Flutter است

================================================================================
🔧 تنظیمات Cursor IDE - CURSOR IDE SETTINGS
================================================================================

📁 مسیر فایل تنظیمات Cursor:
Windows: %APPDATA%\Cursor\User\settings.json
macOS: ~/Library/Application Support/Cursor/User/settings.json
Linux: ~/.config/Cursor/User/settings.json

================================================================================
⚙️ تنظیمات پیشنهادی برای Flutter - RECOMMENDED FLUTTER SETTINGS
================================================================================

{
  "editor.fontFamily": "JetBrains Mono, Consolas, 'Courier New', monospace",
  "editor.fontSize": 14,
  "editor.lineHeight": 1.5,
  "editor.tabSize": 2,
  "editor.insertSpaces": true,
  "editor.detectIndentation": true,
  "editor.wordWrap": "on",
  "editor.rulers": [80, 120],
  "editor.minimap.enabled": true,
  "editor.minimap.showSlider": "always",
  "editor.bracketPairColorization.enabled": true,
  "editor.guides.bracketPairs": true,
  "editor.suggestSelection": "first",
  "editor.acceptSuggestionOnCommitCharacter": false,
  "editor.acceptSuggestionOnEnter": "on",
  "editor.quickSuggestions": {
    "other": true,
    "comments": false,
    "strings": true
  },
  "editor.parameterHints.enabled": true,
  "editor.hover.enabled": true,
  "editor.lightbulb.enabled": true,
  "editor.codeActionsOnSave": {
    "source.fixAll": "explicit",
    "source.organizeImports": "explicit"
  },
  "files.autoSave": "afterDelay",
  "files.autoSaveDelay": 1000,
  "files.trimTrailingWhitespace": true,
  "files.insertFinalNewline": true,
  "files.trimFinalNewlines": true,
  "workbench.colorTheme": "Default Dark+",
  "workbench.iconTheme": "material-icon-theme",
  "workbench.startupEditor": "newUntitledFile",
  "terminal.integrated.fontFamily": "JetBrains Mono",
  "terminal.integrated.fontSize": 13,
  "terminal.integrated.lineHeight": 1.2,
  "terminal.integrated.cursorBlinking": true,
  "terminal.integrated.cursorStyle": "line",
  "git.enabled": true,
  "git.autofetch": true,
  "git.confirmSync": false,
  "git.enableSmartCommit": true,
  "git.enableCommitSigning": false,
  "emmet.includeLanguages": {
    "dart": "html"
  },
  "emmet.triggerExpansionOnTab": true,
  "search.exclude": {
    "**/node_modules": true,
    "**/bower_components": true,
    "**/*.code-search": true,
    "**/build": true,
    "**/.dart_tool": true,
    "**/.flutter-plugins": true,
    "**/.flutter-plugins-dependencies": true,
    "**/.packages": true,
    "**/pubspec.lock": true
  },
  "files.exclude": {
    "**/.git": true,
    "**/.svn": true,
    "**/.hg": true,
    "**/CVS": true,
    "**/.DS_Store": true,
    "**/Thumbs.db": true,
    "**/.dart_tool": true,
    "**/.flutter-plugins": true,
    "**/.flutter-plugins-dependencies": true,
    "**/.packages": true,
    "**/build": true,
    "**/ios/Pods": true,
    "**/android/.gradle": true
  },
  "files.watcherExclude": {
    "**/.git/objects/**": true,
    "**/.git/subtree-cache/**": true,
    "**/node_modules/**": true,
    "**/.dart_tool/**": true,
    "**/build/**": true
  }
}

================================================================================
📦 Extensions پیشنهادی - RECOMMENDED EXTENSIONS
================================================================================

# Flutter & Dart Extensions
- Dart (ms-vscode.dart-code)
- Flutter (Dart-Code.flutter)
- Flutter Widget Snippets (alexisvt.flutter-snippets)
- Awesome Flutter Snippets (Nash.awesome-flutter-snippets)
- Flutter Intl (localizely.flutter-intl)

# Git Extensions
- GitLens (eamodio.gitlens)
- Git History (donjayamanne.githistory)
- Git Graph (mhutchie.git-graph)

# Theme & Icons
- Material Icon Theme (PKief.material-icon-theme)
- One Dark Pro (zhuangtongfa.Material-theme)
- Dracula Official (dracula-theme.theme-dracula)

# Productivity
- Auto Rename Tag (formulahendry.auto-rename-tag)
- Bracket Pair Colorizer (CoenraadS.bracket-pair-colorizer)
- Path Intellisense (christian-kohler.path-intellisense)
- Prettier (esbenp.prettier-vscode)
- Error Lens (usernamehw.errorlens)

# AI & Code Assistance
- GitHub Copilot (GitHub.copilot)
- Tabnine (TabNine.tabnine-vscode)
- IntelliCode (VisualStudioExptTeam.vscodeintellicode)

================================================================================
🔧 تنظیمات خاص پروژه - PROJECT SPECIFIC SETTINGS
================================================================================

# تنظیمات برای پروژه Flutter فارسی
{
  "dart.flutterSdkPath": "C:\\flutter",
  "dart.sdkPath": "C:\\flutter\\bin\\cache\\dart-sdk",
  "dart.lineLength": 80,
  "dart.enableSdkFormatter": true,
  "dart.enableCompletionCommitCharacters": false,
  "dart.completeFunctionCalls": true,
  "dart.showTodos": true,
  "dart.analyzerPath": "C:\\flutter\\bin\\cache\\dart-sdk\\bin\\dart.exe",
  "dart.analyzerAdditionalArgs": ["--enable-experiment=non-nullable"],
  "dart.previewFlutterUiGuides": true,
  "dart.previewFlutterUiGuidesCustomTracking": true,
  "dart.closingLabels": true,
  "dart.extensionLogFile": "C:\\Users\\[USERNAME]\\AppData\\Local\\Temp\\dart.log",
  "dart.devToolsLocation": "external",
  "dart.devToolsTheme": "dark",
  "dart.hotReloadOnSave": "all",
  "dart.hotRestartOnSave": "never",
  "dart.checkForSdkUpdates": false,
  "dart.allowAnalytics": false,
  "dart.allowTestsOutsideTestFolder": false,
  "dart.enableSnippets": true,
  "dart.insertArgumentPlaceholders": true,
  "dart.suggestFromUnimportedLibraries": true,
  "dart.suggestUnimportedLibraries": true,
  "dart.suggestUnimportedLibrariesInTestFiles": true,
  "dart.suggestUnimportedLibrariesInTestFilesOnly": true,
  "dart.suggestUnimportedLibrariesInTestFilesOnlyForTestFiles": true,
  "dart.suggestUnimportedLibrariesInTestFilesOnlyForTestFilesAndTestFiles": true,
  "dart.suggestUnimportedLibrariesInTestFilesOnlyForTestFilesAndTestFilesAndTestFiles": true
}

================================================================================
📋 دستورات نصب Extensions - EXTENSION INSTALLATION COMMANDS
================================================================================

# نصب Extensions از طریق Command Palette (Ctrl+Shift+P):
ext install ms-vscode.dart-code
ext install Dart-Code.flutter
ext install alexisvt.flutter-snippets
ext install Nash.awesome-flutter-snippets
ext install PKief.material-icon-theme
ext install eamodio.gitlens
ext install GitHub.copilot

# یا از طریق Terminal:
code --install-extension ms-vscode.dart-code
code --install-extension Dart-Code.flutter
code --install-extension alexisvt.flutter-snippets
code --install-extension Nash.awesome-flutter-snippets
code --install-extension PKief.material-icon-theme
code --install-extension eamodio.gitlens
code --install-extension GitHub.copilot

================================================================================
🔑 کلیدهای میانبر مهم - IMPORTANT KEYBOARD SHORTCUTS
================================================================================

# Flutter & Dart
Ctrl+Shift+P          # Command Palette
Ctrl+Space            # Trigger Suggestions
Ctrl+Shift+Space      # Trigger Parameter Hints
F12                   # Go to Definition
Alt+F12               # Peek Definition
Shift+F12             # Go to References
Ctrl+T                # Go to Symbol
Ctrl+Shift+T          # Go to Type Definition
Ctrl+Shift+O          # Go to Symbol in File
Ctrl+G                # Go to Line
Ctrl+P                # Quick Open
Ctrl+Shift+P          # Command Palette
Ctrl+Shift+F          # Find in Files
Ctrl+H                # Replace
Ctrl+D                # Select Next Occurrence
Ctrl+U                # Undo Last Cursor Operation
Alt+Up/Down           # Move Line Up/Down
Shift+Alt+Up/Down     # Copy Line Up/Down
Ctrl+Shift+K          # Delete Line
Ctrl+Enter            # Insert Line Below
Ctrl+Shift+Enter      # Insert Line Above
Ctrl+/                # Toggle Line Comment
Shift+Alt+A           # Toggle Block Comment
Ctrl+Shift+[          # Fold Region
Ctrl+Shift+]          # Unfold Region
Ctrl+K Ctrl+0         # Fold All
Ctrl+K Ctrl+J         # Unfold All

# Git
Ctrl+Shift+G          # Open Source Control
Ctrl+Enter            # Commit
Ctrl+Shift+Enter      # Commit and Push

# Terminal
Ctrl+`                # Toggle Terminal
Ctrl+Shift+`          # New Terminal
Ctrl+Shift+5          # Split Terminal

================================================================================
🎨 تنظیمات تم و رنگ - THEME & COLOR SETTINGS
================================================================================

# تم‌های پیشنهادی:
- Default Dark+ (پیش‌فرض)
- One Dark Pro
- Dracula Official
- Material Theme
- Night Owl
- Monokai Pro

# تنظیمات رنگ برای Flutter:
{
  "workbench.colorCustomizations": {
    "editor.background": "#1e1e1e",
    "editor.foreground": "#d4d4d4",
    "editor.lineHighlightBackground": "#2a2a2a",
    "editor.selectionBackground": "#264f78",
    "editor.inactiveSelectionBackground": "#3a3d41",
    "editor.wordHighlightBackground": "#575757",
    "editor.findMatchBackground": "#515c6a",
    "editor.findMatchHighlightBackground": "#3a3d41",
    "editor.findRangeHighlightBackground": "#3a3d41",
    "editor.hoverHighlightBackground": "#2a2d2e",
    "editor.lineHighlightBorder": "#454545",
    "editor.rangeHighlightBackground": "#2a2a2a",
    "editor.symbolHighlightBackground": "#2a2a2a",
    "editorWhitespace.foreground": "#3a3d41",
    "editorIndentGuide.background": "#3a3d41",
    "editorIndentGuide.activeBackground": "#939393",
    "sideBar.background": "#252526",
    "sideBar.foreground": "#cccccc",
    "sideBarTitle.foreground": "#cccccc",
    "activityBar.background": "#333333",
    "activityBar.foreground": "#ffffff",
    "activityBar.activeBorder": "#ffffff",
    "statusBar.background": "#007acc",
    "statusBar.foreground": "#ffffff",
    "titleBar.activeBackground": "#3c3c3c",
    "titleBar.activeForeground": "#cccccc"
  }
}

================================================================================
📝 نکات مهم - IMPORTANT NOTES
================================================================================

1. قبل از استفاده، مسیر Flutter SDK را در تنظیمات بررسی کنید
2. Extensions را یکی یکی نصب کنید تا از تداخل جلوگیری شود
3. تنظیمات را در فایل settings.json کپی کنید
4. در صورت مشکل، Cursor را restart کنید
5. برای پروژه‌های جدید، این تنظیمات را کپی کنید

================================================================================

## 📱 اطلاعات ورژن اپلیکیشن - APP VERSION INFORMATION

### 🔢 فرمت ورژن:
- فرمت توسعه: `v1.X.Y.Z`
- فرمت انتشار: `v1.X.Y`
- عدد 1: سال انتشار
- عدد X: ماه شمسی (1-12)
- عدد Y: روز ماه (1-31)
- عدد Z: شماره ترتیبی در روز (فقط برای توسعه)

### 📅 ورژن فعلی:
- **ورژن توسعه**: v1.6.3.1
- **ورژن انتشار**: v1.6.3
- **ماه شمسی**: 6 (شهریور)
- **روز**: 3
- **سال**: 1404
- **تاریخ میلادی**: آگوست 2025

### 📝 نحوه به‌روزرسانی ورژن:
1. عدد X مربوط به ماه شمسی است
2. عدد Y مربوط به روز ماه است
3. عدد Z شماره ترتیبی در روز (فقط برای توسعه)
4. هنگام انتشار، عدد Z حذف می‌شود
5. مثال: توسعه `v1.6.3.1` → انتشار `v1.6.3`

### 🗓️ تقویم ماه‌های شمسی:
- 1: فروردین
- 2: اردیبهشت  
- 3: خرداد
- 4: تیر
- 5: مرداد
- 6: شهریور
- 7: مهر
- 8: آبان
- 9: آذر
- 10: دی
- 11: بهمن
- 12: اسفند

================================================================================

## 🚀 دستورات اجرا - RUN COMMANDS

### 📱 اجرای اپلیکیشن:
```bash
# اجرای عادی
flutter run

# اجرا در ویندوز
flutter run -d windows

# اجرا در ویندوز با خروجی verbose
flutter run -d windows -v

# اجرا در اندروید
flutter run -d android

# اجرا در iOS (فقط macOS)
flutter run -d ios

# اجرا در وب
flutter run -d chrome
```

### 🔧 دستورات مفید:
```bash
# پاک کردن cache
flutter clean

# دریافت dependencies
flutter pub get

# بررسی مشکلات
flutter doctor

# ساخت APK
flutter build apk --release

# ساخت برای ویندوز
flutter build windows --release
```

### ⚡ Hot Reload:
- **r**: Hot reload (تغییرات سریع)
- **R**: Hot restart (راه‌اندازی مجدد)
- **q**: خروج از حالت debug

### 📋 نکات اجرا:
1. قبل از اجرا، `flutter pub get` را اجرا کنید
2. برای ویندوز، Visual Studio Build Tools نصب باشد
3. برای اندروید، Android Studio و SDK نصب باشد
4. در صورت مشکل، `flutter clean` سپس `flutter pub get` اجرا کنید

================================================================================

## ⚙️ تنظیمات اجرا - RUN SETTINGS

### 🔧 تنظیمات پیش‌فرض:
```bash
# غیرفعال کردن auto pub get
flutter config --no-analytics
flutter config --no-enable-web

# تنظیم برای اجرای سریع‌تر
flutter config --enable-windows-desktop
flutter config --enable-macos-desktop
```

### 📋 دستورات پیش از اجرا:
```bash
# فقط در صورت نیاز (به صورت دستی)
flutter pub get

# پاک کردن cache (در صورت مشکل)
flutter clean
flutter pub get
```

### 🚀 اجرای مستقیم:
```bash
# بدون pub get خودکار
flutter run -d windows

# با verbose (برای debug)
flutter run -d windows -v

# اجرای سریع (بدون rebuild)
flutter run -d windows --hot
```

### ⚡ نکات مهم:
1. **flutter pub get** فقط به صورت دستی اجرا کنید
2. **flutter clean** در صورت بروز مشکل
3. **Hot reload** برای تغییرات سریع
4. **Hot restart** برای تغییرات بزرگ

### 🔄 چرخه توسعه:
1. تغییر کد
2. ذخیره فایل
3. Hot reload (r)
4. تست تغییرات
5. در صورت نیاز: Hot restart (R)

================================================================================
flutter run -d windows -v --hot
برای hot reload

flutter run -d windows -v
================================================================================