import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:imageapp/screens/home.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imageapp/controller/controller.dart';

class PredictionScreen extends StatelessWidget {
  const PredictionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final predictionProvider = Provider.of<PredictionProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Prediksi Tomat',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            predictionProvider.clear();
            Navigator.of(context).pop();
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomePage1()),
            );
          },
        ),
        toolbarHeight: 80.h,
        elevation: 2,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 350.h,
                width: 300.w,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.red.shade200,
                      blurRadius: 12.r,
                      offset: Offset(0, 8.h),
                    ),
                  ],
                ),
                child: predictionProvider.imageFile != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(16.r),
                        child: Image.file(
                          predictionProvider.imageFile!,
                          fit: BoxFit.cover,
                        ),
                      )
                    : Icon(
                        Icons.image,
                        size: 250.sp,
                        color: Colors.redAccent,
                      ),
              ),
              SizedBox(height: 32.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Select Image Source'),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ListTile(
                                  leading: const Icon(Icons.camera_alt),
                                  title: const Text('Take a Picture'),
                                  onTap: () {
                                    predictionProvider.pickImageCamera();
                                    Navigator.of(context).pop();
                                  },
                                ),
                                ListTile(
                                  leading: const Icon(Icons.photo_library),
                                  title: const Text('Choose from Gallery'),
                                  onTap: () {
                                    predictionProvider
                                        .pickImage(ImageSource.gallery);
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                    icon: const Icon(Icons.image),
                    label: const Text('Select Image Source'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.w, vertical: 12.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.r),
                      ),
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () async {
                      predictionProvider.predictImage();
                    },
                    icon: const Icon(Icons.upload_file),
                    label: const Text('Submit'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(
                          horizontal: 30.w, vertical: 12.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.r),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 32.h),
              if (predictionProvider.isLoading) CircularProgressIndicator(),
              if (predictionProvider.predictionMessage != null)
                Container(
                  padding: EdgeInsets.all(20.r),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.red.shade100,
                        blurRadius: 10.r,
                        offset: Offset(0, 5.h),
                      ),
                    ],
                  ),
                  child: Text(
                    predictionProvider.predictionMessage!,
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.redAccent,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
