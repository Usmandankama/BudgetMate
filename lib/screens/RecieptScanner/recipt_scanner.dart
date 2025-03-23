import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';

class ReceiptScannerPage extends StatefulWidget {
  const ReceiptScannerPage({super.key});

  @override
  ReceiptScannerPageState createState() => ReceiptScannerPageState();
}

class ReceiptScannerPageState extends State<ReceiptScannerPage> {
  File? _image;
  String _extractedText = "Scan a receipt to extract text";

  /// Pick an image from Camera or Gallery
  Future<File?> _pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    return pickedFile != null ? File(pickedFile.path) : null;
  }

  /// Extract text from the image using ML Kit
  Future<void> _scanReceipt(File image) async {
    final inputImage = InputImage.fromFile(image);
    final textRecognizer = TextRecognizer();
    final RecognizedText recognizedText = await textRecognizer.processImage(inputImage);
    textRecognizer.close();

    setState(() {
      _image = image;
      _extractedText = recognizedText.text.isNotEmpty ? recognizedText.text : "No text found";
    });
  }

  /// Show bottom sheet for image selection
  void _showImageSourceDialog() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(16),
          child: Wrap(
            children: [
              ListTile(
                leading: Icon(Icons.camera_alt, color: Colors.green),
                title: Text("Take a Picture"),
                onTap: () async {
                  Navigator.pop(context);
                  File? image = await _pickImage(ImageSource.camera);
                  if (image != null) _scanReceipt(image);
                },
              ),
              ListTile(
                leading: Icon(Icons.photo_library, color: Colors.blue),
                title: Text("Choose from Gallery"),
                onTap: () async {
                  Navigator.pop(context);
                  File? image = await _pickImage(ImageSource.gallery);
                  if (image != null) _scanReceipt(image);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Scan Receipt")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            /// Display selected image
            _image != null
                ? Image.file(_image!, height: 200, fit: BoxFit.cover)
                : Icon(Icons.receipt_long, size: 150, color: Colors.grey),

            SizedBox(height: 16),

            /// Button to scan receipt
            ElevatedButton.icon(
              icon: Icon(Icons.camera_alt),
              label: Text("Scan Receipt"),
              onPressed: _showImageSourceDialog,
            ),

            SizedBox(height: 16),

            /// Scrollable text area for extracted text
            Expanded(
              child: Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: SingleChildScrollView(
                  child: Text(
                    _extractedText,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
