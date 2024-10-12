import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CameraApp extends StatefulWidget {
  const CameraApp({super.key});

  @override
  State<CameraApp> createState() => _CameraAppState();
}

class _CameraAppState extends State<CameraApp> {
  File? _image; // Variable to store the image
  final ImagePicker _picker = ImagePicker(); // ImagePicker instance

  Future<void> _openCamera() async {
    final XFile? image =
        await _picker.pickImage(source: ImageSource.camera); // Open camera
    if (image != null) {
      setState(() {
        _image = File(image.path); // Set the image to display
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Camera App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _image == null
                ? Text('No image selected.')
                : Image.file(_image!), // Display the image if available
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _openCamera,
              child: Text('Open Camera'),
            ),
          ],
        ),
      ),
    );
  }
}
