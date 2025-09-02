// ==========================================
// [app_config.dart]
// ==========================================
// توضیحات: تنظیمات کلی اپلیکیشن
// ==========================================

class AppConfig {
  // دسته‌بندی‌هایی که نباید نمایش داده شوند
  static const List<String> hiddenCategories = [
    'فروش ویژه',
    'محصولات ویژه اپ',
    'featured-app-products',
    'special-sale',
  ];

  // تابع فیلتر کردن دسته‌بندی‌های مخفی
  static List filterHiddenCategories(List categories) {
    return categories.where((category) {
      final categoryName = category['name']?.toString().toLowerCase() ?? '';
      final categorySlug = category['slug']?.toString().toLowerCase() ?? '';

      return !hiddenCategories.any((hidden) =>
          categoryName.contains(hidden.toLowerCase()) ||
          categorySlug.contains(hidden.toLowerCase()));
    }).toList();
  }

  // ورژن فعلی اپلیکیشن
  static const String appVersion = 'v1.6.3.1';

  // نام اپلیکیشن
  static const String appName = 'سیفی مارکت';

  // تابع فیلتر کردن محصولات بر اساس قیمت
  static bool isValidProductPrice(dynamic product) {
    final price = product['price'];

    // اگر قیمت "تماس بگیرید" باشد
    if (price == 'تماس بگیرید' || price == 'call') {
      return true;
    }

    // اگر قیمت عدد باشد و بیشتر از 2 ریال
    if (price != null && price != '') {
      try {
        final priceValue = double.tryParse(price.toString());
        if (priceValue != null && priceValue >= 2) {
          return true;
        }
      } catch (e) {
        // در صورت خطا در تبدیل، محصول را نمایش نده
        return false;
      }
    }

    return false;
  }

  // تابع فیلتر کردن لیست محصولات
  static List filterProductsByPrice(List products) {
    return products.where((product) => isValidProductPrice(product)).toList();
  }
}
