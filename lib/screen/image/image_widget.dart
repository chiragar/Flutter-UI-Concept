import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutterui/widget/topic_title_widget.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class ImageWidget extends StatefulWidget {
  const ImageWidget({super.key});

  @override
  State<ImageWidget> createState() => _ImageWidgetState();
}

class _ImageWidgetState extends State<ImageWidget> {
  Uint8List? _imageBytes;
  final ImagePicker _picker = ImagePicker();

  Uint8List? _imageMemoryBytes;

  //Image File (Not Worked Web)
  // File? _imageFile;
  // final ImagePicker _picker = ImagePicker();
  //
  // Future<void> _pickImage() async {
  //   final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
  //   if (pickedFile != null) {
  //     setState(() {
  //       _imageFile = File(pickedFile.path);
  //     });
  //   }
  // }

  Future<void> _loadImage() async {
    final response = await http.get(Uri.parse(
        'https://images.pexels.com/photos/30754133/pexels-photo-30754133/free-photo-of-stunning-aerial-view-of-london-skyline-at-sunset.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'));
    if (response.statusCode == 200) {
      setState(() {
        _imageMemoryBytes = response.bodyBytes;
      });
    }
  }

  Future<void> _pickImage() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final bytes = await pickedFile.readAsBytes(); // Convert file to bytes
      setState(() {
        _imageBytes = bytes;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _loadImage(); // Automatically load image when screen opens
  }

  void _deleteImage() {
    setState(() {
      _imageBytes = null; // Set to null to remove the image
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: _pickImage,
        child: const Icon(Icons.add_photo_alternate),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  const TopicTitleWidget(title: "Image Assets"),
                  Image.asset(
                    'assets/images/my_image.jpg',
                    width: size.width * 0.15,
                    height: size.width * 0.15,
                    fit: BoxFit.cover, // Adjust how the image fits in the space
                  ),
                ],
              ),
              Column(
                children: [
                  const TopicTitleWidget(title: "Image Network"),
                  Image.network(
                    'https://images.pexels.com/photos/7903529/pexels-photo-7903529.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                    width: size.width * 0.15,
                    height: size.width * 0.15,
                    fit: BoxFit.fill,
                    // When image is loading from the server it takes some time
                    // So we will show progress indicator while loading
                    loadingBuilder: (BuildContext context, Widget child,
                        ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
                              : null,
                        ),
                      );
                    },
                    // When dealing with networks it completes with two states,
                    // complete with a value or completed with an error,
                    // So handling errors is very important otherwise it will crash the app screen.
                    // I showed dummy images from assets when there is an error, you can show some texts or anything you want.
                    errorBuilder: (context, exception, stackTrace) {
                      return const Icon(Icons.error);
                    },
                  ),
                ],
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  //Image file
                  //   const TopicTitleWidget(title: "Image File"),
                  // _imageFile != null
                  //       ? Image.file(_imageFile!, width: 200, height: 200, fit: BoxFit.cover)
                  //       : Text('No image selected'),

                  const TopicTitleWidget(title: "Image Memory"),
                  _imageBytes != null
                      ? Image.memory(_imageBytes!,
                          width: 200, height: 200, fit: BoxFit.cover)
                      : const Text('No image selected'),

                  _imageBytes != null
                      ? const SizedBox(height: 10)
                      : const SizedBox.shrink(),
                  _imageBytes != null
                      ? ElevatedButton(
                          onPressed: _deleteImage,
                          style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.red),
                          child: const Text('Delete Image'),
                        )
                      : const SizedBox.shrink(),
                ],
              ),
              Column(
                children: [
                  const TopicTitleWidget(title: "Image Memory"),
                  _imageBytes != null
                      ? Image.memory(_imageMemoryBytes!,
                          width: 200, height: 200, fit: BoxFit.cover)
                      : const CircularProgressIndicator(),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
