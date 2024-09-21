import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photo_view/photo_view.dart';
import 'package:http/http.dart' as http;
import 'package:vizscope/colors.dart';

class ImageGridViewPage extends StatefulWidget {
  const ImageGridViewPage({super.key});
  @override
  State<ImageGridViewPage> createState() => _ImageGridViewPageState();
}

class _ImageGridViewPageState extends State<ImageGridViewPage> {
  final List<String> imagePaths =
      List.generate(10, (index) => 'assets/dummyImages/dummyimage1.jpg');

  List<XFile>? _selectedImages = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgColor,
      appBar: AppBar(
        foregroundColor: AppColor.textColor,
        backgroundColor: Colors.transparent,
        title: const Text(
          'Site Images',
        ),
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
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     _pickImages();
      //   },
      //   child: const Icon(Icons.add),
      // ),
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

  Future _uploadImage(XFile image) async {
    final url = Uri.parse('server api');
    final request = http.MultipartRequest('POST', url);
    final file = await http.MultipartFile.fromPath('image', image.path);
    request.files.add(file);

    final response = await request.send();
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future _pickImages() async {
    final ImagePicker picker = ImagePicker();
    _selectedImages = await picker.pickMultiImage();
    if (_selectedImages != null) {
      for (var image in _selectedImages!) {
        try {
          final uploadResult = await _uploadImage(image);
          if (mounted) {
            if (uploadResult) {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Uploaded: ${image.name}')));
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Error uploading ${image.name}')));
            }
          }
        } catch (e) {
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Error uploading ${image.name}: $e')));
          }
        }
      }
    }
  }
}
