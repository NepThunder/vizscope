import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:vizscope/colors.dart';

class ImageGridViewPage extends StatefulWidget {
  const ImageGridViewPage({super.key});
  @override
  State<ImageGridViewPage> createState() => _ImageGridViewPageState();
}

class _ImageGridViewPageState extends State<ImageGridViewPage> {
  final List<String> imagePaths =
      List.generate(10, (index) => 'assets/dummyImages/dummyimage1.jpg');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgColor,
      appBar: AppBar(
        foregroundColor: AppColor.textColor,
        backgroundColor: Colors.transparent,
        title: const Text(
          'Site Images',
          style: TextStyle(color: AppColor.textColor),
        ),
        titleTextStyle: const TextStyle(fontSize: 20, color: Colors.black),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1,
        ),
        itemCount: imagePaths.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              openImagePreview(context, imagePaths[index]);
            },
            child: Card(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  imagePaths[index],
                  fit: BoxFit.cover,
                  height: double.infinity,
                  width: 10,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void openImagePreview(BuildContext context, String imagePath) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        child: Stack(
          children: [
            PhotoView(
              imageProvider: AssetImage(imagePath),
              backgroundDecoration: const BoxDecoration(
                color: Colors.transparent,
              ),
            ),
            Positioned(
              top: 10,
              right: 0,
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Icon(Icons.close, color: Colors.red, size: 35),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
