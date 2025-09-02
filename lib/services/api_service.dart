import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiService {
  static String get consumerKey => dotenv.env['WOOCOMMERCE_CONSUMER_KEY'] ?? '';
  static String get consumerSecret =>
      dotenv.env['WOOCOMMERCE_CONSUMER_SECRET'] ?? '';
  static String get baseUrl => dotenv.env['WOOCOMMERCE_BASE_URL'] ?? '';

  // ساخت URL برای دسته‌بندی‌ها - استفاده از API محلی
  static String getCategoriesUrl() {
    return 'https://app.seify.ir/api/products-manager.php?action=categories';
  }

  // ساخت URL برای محصولات - استفاده از API محلی
  static String getProductsUrl({String? categoryId, int page = 1}) {
    String url = 'https://app.seify.ir/api/products-manager.php?action=list&page=$page&per_page=100';
    if (categoryId != null) {
      url += '&category=$categoryId';
    }
    return url;
  }

  // ساخت URL برای محصولات ویژه - استفاده از API محلی
  static String getFeaturedProductsUrl(String categoryId) {
    return 'https://app.seify.ir/api/products-manager.php?action=list&category=$categoryId&per_page=100';
  }

  // ساخت URL برای محصولات جدید - استفاده از API محلی
  static String getNewProductsUrl() {
    return 'https://app.seify.ir/api/products-manager.php?action=list&per_page=100';
  }

  // ساخت URL برای زیردسته‌ها - استفاده از API محلی
  static String getSubCategoriesUrl(int parentId) {
    return 'https://app.seify.ir/api/products-manager.php?action=categories';
  }

  // ساخت URL برای نظرات محصول - استفاده از API محلی
  static String getProductReviewsUrl(int productId) {
    return 'https://app.seify.ir/api/products-manager.php?action=reviews&product_id=$productId';
  }

  // ساخت URL برای ارسال نظر - استفاده از API محلی
  static String getSubmitReviewUrl() {
    return 'https://app.seify.ir/api/products-manager.php?action=submit_review';
  }

  // ساخت URL برای بررسی دسته‌بندی‌های خالی - استفاده از API محلی
  static String getCategoryCheckUrl(String categoryId) {
    return 'https://app.seify.ir/api/products-manager.php?action=list&category=$categoryId&per_page=1';
  }
}
