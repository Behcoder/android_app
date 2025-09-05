import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class GalleryPage extends StatefulWidget {
  const GalleryPage({super.key});

  @override
  State<GalleryPage> createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage>
    with TickerProviderStateMixin {
  TabController? _tabController;
  Map<String, List<Map<String, dynamic>>> galleryImages = {};
  bool isLoading = true;
  String? errorMessage;

  // تبدیل URL نسبی یا ناقص به URL کامل قابل استفاده در شبکه
  String _getFullImageUrl(String? imageUrl) {
    if (imageUrl == null || imageUrl.isEmpty) return '';

    if (imageUrl.startsWith('http://') || imageUrl.startsWith('https://')) {
      return imageUrl;
    }

    if (imageUrl.startsWith('/api/img-proxy.php')) {
      return 'https://app.seify.ir$imageUrl';
    }

    if (imageUrl.startsWith('api/img-proxy.php')) {
      return 'https://app.seify.ir/$imageUrl';
    }

    if (imageUrl.startsWith('/')) {
      return 'https://app.seify.ir$imageUrl';
    }

    if (imageUrl.startsWith('api/')) {
      return 'https://app.seify.ir/$imageUrl';
    }

    return imageUrl;
  }

  @override
  void initState() {
    super.initState();
    _loadGalleryImages();
  }

  Future<void> _loadGalleryImages() async {
    setState(() {
      isLoading = true;
      errorMessage = null;
    });

    try {
      // دریافت تصاویر از API جدید
      final generalResponse = await http.get(
        Uri.parse(
            'https://app.seify.ir/api/gallery-manager.php?action=list&category=general'),
      );

      final productsResponse = await http.get(
        Uri.parse(
            'https://app.seify.ir/api/gallery-manager.php?action=list&category=products'),
      );

      if (generalResponse.statusCode == 200 &&
          productsResponse.statusCode == 200) {
        final generalData = json.decode(generalResponse.body);
        final productsData = json.decode(productsResponse.body);

        final generalImages = generalData['success'] == true
            ? (generalData['images'] as List).cast<Map<String, dynamic>>()
            : <Map<String, dynamic>>[];

        final productImages = productsData['success'] == true
            ? (productsData['images'] as List).cast<Map<String, dynamic>>()
            : <Map<String, dynamic>>[];

        setState(() {
          galleryImages = {
            if (productImages.isNotEmpty) 'محصولات': productImages,
            if (generalImages.isNotEmpty) 'عمومی': generalImages,
          };
          _initializeTabController();
          isLoading = false;
        });
      } else {
        throw Exception('خطا در دریافت تصاویر: ${generalResponse.statusCode}');
      }
    } catch (e) {
      debugPrint('Error loading gallery: $e');
      setState(() {
        errorMessage = 'خطا در بارگذاری گالری: $e';
        isLoading = false;
      });
    }
  }

  void _initializeTabController() {
    _tabController?.dispose();
    _tabController =
        TabController(length: galleryImages.keys.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('گالری تصاویر'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _loadGalleryImages,
          ),
        ],
        bottom: _tabController != null && galleryImages.isNotEmpty
            ? TabBar(
                controller: _tabController,
                tabs: galleryImages.keys.map((cat) => Tab(text: cat)).toList(),
                indicatorColor: Colors.white,
                labelColor: Colors.white,
                unselectedLabelColor: Colors.white70,
              )
            : null,
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : errorMessage != null
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        errorMessage!,
                        style: const TextStyle(fontSize: 16, color: Colors.red),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: _loadGalleryImages,
                        child: const Text('تلاش مجدد'),
                      ),
                    ],
                  ),
                )
              : _tabController != null && galleryImages.isNotEmpty
                  ? TabBarView(
                      controller: _tabController,
                      children: galleryImages.entries.map((entry) {
                        return Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: entry.value.isEmpty
                              ? const Center(
                                  child: Text(
                                    'هیچ تصویری یافت نشد',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                )
                              : GridView.builder(
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 12,
                                    mainAxisSpacing: 12,
                                    childAspectRatio: 1,
                                  ),
                                  itemCount: entry.value.length,
                                  itemBuilder: (context, index) {
                                    final imageData = entry.value[index];
                                    final imageUrl =
                                        'https://app.seify.ir${imageData['url']}';
                                    final imageName =
                                        imageData['name'] ?? 'تصویر';

                                    return GestureDetector(
                                      onTap: () => _showFullScreenImage(
                                          context, imageUrl, imageName),
                                      child: Hero(
                                        tag: imageUrl,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey
                                                    .withValues(alpha: 0.3),
                                                blurRadius: 8,
                                                offset: const Offset(0, 2),
                                              ),
                                            ],
                                          ),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            child: Image.network(
                                              _getFullImageUrl(imageUrl),
                                              fit: BoxFit.cover,
                                              loadingBuilder: (context, child,
                                                  loadingProgress) {
                                                if (loadingProgress == null) {
                                                  return child;
                                                }
                                                return Center(
                                                  child:
                                                      CircularProgressIndicator(
                                                    value: loadingProgress
                                                                .expectedTotalBytes !=
                                                            null
                                                        ? loadingProgress
                                                                .cumulativeBytesLoaded /
                                                            loadingProgress
                                                                .expectedTotalBytes!
                                                        : null,
                                                  ),
                                                );
                                              },
                                              errorBuilder:
                                                  (context, error, stackTrace) {
                                                debugPrint(
                                                    'Error loading image: $imageUrl - $error');
                                                return Container(
                                                  color: Colors.grey[200],
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      const Icon(
                                                        Icons.broken_image,
                                                        size: 40,
                                                        color: Colors.grey,
                                                      ),
                                                      const SizedBox(height: 8),
                                                      Text(
                                                        'خطا در بارگذاری',
                                                        style: TextStyle(
                                                          color:
                                                              Colors.grey[600],
                                                          fontSize: 12,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                        );
                      }).toList(),
                    )
                  : const Center(
                      child: Text(
                        'خطا در بارگذاری گالری',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
    );
  }

  void _showFullScreenImage(
      BuildContext context, String imageUrl, String imageName) {
    showDialog(
      context: context,
      builder: (context) => GestureDetector(
        onTap: () => Navigator.of(context).pop(),
        child: Container(
          color: Colors.black,
          alignment: Alignment.center,
          child: Hero(
            tag: imageUrl,
            child: InteractiveViewer(
              child: Image.network(
                _getFullImageUrl(imageUrl),
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes!
                          : null,
                      color: Colors.white,
                    ),
                  );
                },
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey[900],
                    child: const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.broken_image,
                            size: 80,
                            color: Colors.white,
                          ),
                          SizedBox(height: 16),
                          Text(
                            'خطا در بارگذاری تصویر',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
