import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
class PredictionProvider with ChangeNotifier {
  File? imageFile;
  String? predictionMessage;
  bool isLoading = false; 
  final ImagePicker _picker = ImagePicker();


  Future<void> pickImage(ImageSource source) async {
    if (isLoading) return;

    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      imageFile = File(pickedFile.path);
      notifyListeners();
    }
  }


  Future<void> pickImageCamera() async {
    if (isLoading) return; 

    final pickedFile = await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      imageFile = File(pickedFile.path);
      notifyListeners();
    }
  }

  Future<void> predictImage() async {
    if (imageFile == null) return;

    isLoading = true; 
    notifyListeners();

    final url = Uri.parse('https://tomato.loca.lt/api/predict-image'); 
    final request = http.MultipartRequest('POST', url)
      ..files.add(await http.MultipartFile.fromPath('image', imageFile!.path));

    request.headers.addAll({
      'Content-Type': 'multipart/form-data',
    });

    try {
      final response = await request.send();
      final responseData = await response.stream.bytesToString();
      print('Response status: ${response.statusCode}');
      print('Response body: $responseData');

      if (response.statusCode == 200) {
        final data = jsonDecode(responseData);

        if (data['prediction'] != null && data['prediction'].isNotEmpty) {
          String prediction = data['prediction'][0];
          predictionMessage = '$prediction';
        } else {
          predictionMessage = 'Gagal memprediksi';
        }
      } else {
        predictionMessage = 'Error ${response.statusCode}: $responseData';
      }
    } catch (e) {
      predictionMessage = 'Error: $e';
    } finally {
      isLoading = false; 
      notifyListeners();
    }
  }


  void clear() {
    imageFile = null;
    predictionMessage = null;
    notifyListeners();
  }
}
