import 'package:flutter/material.dart';

class GalleryPage extends StatefulWidget {
  const GalleryPage({Key? key}) : super(key: key);

  @override
  State<GalleryPage> createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final Map<String, List<String>> galleryImages = {
    'محصولات': [
      // فعلاً خالی، بعداً تصاویر محصولات اضافه شود
    ],
    'عمومی': [
      'assets/img/gallery/general/DSC_1052.jpg',
      'assets/img/gallery/general/DSC_1043.jpg',
      'assets/img/gallery/general/DSC_1046.jpg',
      'assets/img/gallery/general/DSC_1040.jpg',
      'assets/img/gallery/general/DSC_1068.jpg',
      'assets/img/gallery/general/DSC_1037.jpg',
      'assets/img/gallery/general/DSC_1054.jpg',
    ],
  };

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: galleryImages.keys.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('گالری تصاویر'),
        bottom: TabBar(
          controller: _tabController,
          tabs: galleryImages.keys.map((cat) => Tab(text: cat)).toList(),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: galleryImages.entries.map((entry) {
          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 1,
              ),
              itemCount: entry.value.length,
              itemBuilder: (context, index) {
                final imagePath = entry.value[index];
                return GestureDetector(
                  onTap: () => _showFullScreenImage(context, imagePath),
                  child: Hero(
                    tag: imagePath,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        imagePath,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => Container(
                          color: Colors.grey[200],
                          child: const Icon(Icons.broken_image, size: 40, color: Colors.grey),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        }).toList(),
      ),
    );
  }

  void _showFullScreenImage(BuildContext context, String imagePath) {
    showDialog(
      context: context,
      builder: (context) => GestureDetector(
        onTap: () => Navigator.of(context).pop(),
        child: Container(
          color: Colors.black,
          alignment: Alignment.center,
          child: Hero(
            tag: imagePath,
            child: InteractiveViewer(
              child: Image.asset(imagePath),
            ),
          ),
        ),
      ),
    );
  }
} 