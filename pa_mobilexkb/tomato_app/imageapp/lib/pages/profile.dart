import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _nameController = TextEditingController();
  final _bioController = TextEditingController();
  String _profilePhotoUrl = 'assets/images/image1.jpg';
  String _selectedGender = 'Male';

  @override
  void initState() {
    super.initState();
    _loadProfileData();
  }

  Future<void> _loadProfileData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _nameController.text = prefs.getString('name') ?? 'Carrie Sanders';
      _bioController.text = prefs.getString('bio') ?? '';
      _selectedGender = prefs.getString('gender') ?? 'Male';
    });
  }

  Future<void> _saveProfileData() async {
    final prefs = await SharedPreferences.getInstance();
    try {
      await prefs.setString('name', _nameController.text);
      await prefs.setString('bio', _bioController.text);
      await prefs.setString('gender', _selectedGender);

      _showAwesomeSnackbar(
        title: 'Success!',
        message: 'Profile has been saved successfully.',
        contentType: ContentType.success,
      );
    } catch (e) {
      _showAwesomeSnackbar(
        title: 'Error!',
        message: 'Failed to save profile. Error: $e',
        contentType: ContentType.failure,
      );
    }
  }


  Future<void> _confirmSave() async {
    final result = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirm Save'),
        content: const Text('Do you want to save changes?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Save'),
          ),
        ],
      ),
    );
    if (result == true) {
      _saveProfileData();
    }
  }

  void _validateAndSave() {
    if (_nameController.text.isEmpty || _bioController.text.isEmpty) {
      _showAwesomeSnackbar(
        title: 'Validation Error',
        message: 'Name and Bio cannot be empty.',
        contentType: ContentType.warning,
      );
      return;
    }
    _confirmSave();
  }

  void _showAwesomeSnackbar({
    required String title,
    required String message,
    required ContentType contentType,
  }) {
    final snackBar = SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      elevation: 0,
      content: AwesomeSnackbarContent(
        title: title,
        message: message,
        contentType: contentType,
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAF9F6),
      appBar: AppBar(
        backgroundColor: const Color(0xFFE74C3C),
        title: Text(
          "Profile",
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: CircleAvatar(
                  radius: 60.r,
                  backgroundImage: AssetImage(_profilePhotoUrl),
                ),
              ),
              SizedBox(height: 24.h),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                  labelStyle: const TextStyle(color: Colors.red),
                  hintText: 'Enter your name',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: BorderSide.none,
                  ),
                  suffixIcon: const Icon(
                    Icons.edit,
                    color: Colors.red,
                  ),
                ),
                style: GoogleFonts.poppins(
                  fontSize: 18.sp,
                  color: Colors.red,
                ),
              ),
              SizedBox(height: 24.h),
              TextFormField(
                controller: _bioController,
                maxLines: 3,
                decoration: InputDecoration(
                  labelText: 'Bio',
                  labelStyle: const TextStyle(color: Colors.red),
                  hintText: 'Enter your bio',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: BorderSide.none,
                  ),
                ),
                style: GoogleFonts.poppins(
                  fontSize: 18.sp,
                  color: Colors.red,
                ),
              ),
              SizedBox(height: 24.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: RadioListTile<String>(
                      title: Text('Male', style: GoogleFonts.poppins(color: Colors.red)),
                      value: 'Male',
                      groupValue: _selectedGender,
                      onChanged: (value) {
                        setState(() {
                          _selectedGender = value!;
                        });
                      },
                      activeColor: Colors.red,
                    ),
                  ),
                  Expanded(
                    child: RadioListTile<String>(
                      title: Text('Female', style: GoogleFonts.poppins(color: Colors.red)),
                      value: 'Female',
                      groupValue: _selectedGender,
                      onChanged: (value) {
                        setState(() {
                          _selectedGender = value!;
                        });
                      },
                      activeColor: Colors.red,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 32.h),
              ElevatedButton(
                onPressed: _validateAndSave,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFE74C3C),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 100.w, vertical: 8.h),
                ),
                child: Text(
                  "Save",
                  style: GoogleFonts.poppins(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _bioController.dispose();
    super.dispose();
  }
}
