import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:imageapp/controller/auth.dart';
import 'package:imageapp/pages/Login1.dart';

class Regis extends StatefulWidget {
  const Regis({super.key});

  @override
  State<Regis> createState() => _RegisState();
}

class _RegisState extends State<Regis> {
  bool _loading = false;
  bool _obscurePassword = true;

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _ctrlEmail = TextEditingController();
  final TextEditingController _ctrlPassword = TextEditingController();

  @override
  void dispose() {
    _ctrlEmail.dispose();
    _ctrlPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 250.h,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/image1.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: Column(
                children: [
                  SizedBox(height: 20.h),
                  Text(
                    "Selamat Datang \n di Tomato App",
                    style: GoogleFonts.poppins(
                      fontSize: 26.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.redAccent,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    "Mari Buat Akun",
                    style: GoogleFonts.poppins(
                      fontSize: 16.sp,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        TextFormField(
                          controller: _ctrlEmail,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Silakan masukkan email Anda';
                            }
                            if (!RegExp(
                                    r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
                                .hasMatch(value)) {
                              return 'Format email tidak valid';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.email,
                                color: Colors.redAccent),
                            hintText: 'Email',
                            labelText: 'Email',
                            filled: true,
                            fillColor: Colors.grey.shade200,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.r),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                        SizedBox(height: 15.h),
                        TextFormField(
                          controller: _ctrlPassword,
                          obscureText: _obscurePassword,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Silakan masukkan password Anda';
                            }
                            if (value.length < 6) {
                              return 'Password minimal 6 karakter';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            prefixIcon:
                                Icon(Icons.lock, color: Colors.redAccent),
                            hintText: 'Kata Sandi',
                            filled: true,
                            fillColor: Colors.grey.shade200,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.r),
                              borderSide: BorderSide.none,
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscurePassword
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: Colors.redAccent,
                              ),
                              onPressed: () {
                                setState(() {
                                  _obscurePassword = !_obscurePassword;
                                });
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: 30.h),
                        ElevatedButton(
                          onPressed: _loading ? null : () => handleSubmit(),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.redAccent,
                            padding: EdgeInsets.symmetric(vertical: 15.h),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.r),
                            ),
                          ),
                          child: _loading
                              ? SizedBox(
                                  width: 20.w,
                                  height: 20.h,
                                  child: const CircularProgressIndicator(
                                    color: Colors.white,
                                    strokeWidth: 2,
                                  ),
                                )
                              : Text(
                                  "Buat Akun",
                                  style: TextStyle(
                                      fontSize: 16.sp, color: Colors.white),
                                ),
                        ),
                        SizedBox(height: 15.h),
                        Center(
                          child: TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Login()),
                              );
                            },
                            child: Text(
                              "Sudah punya akun? Login di sini",
                              style: GoogleFonts.poppins(
                                fontSize: 14.sp,
                                color: Colors.redAccent,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> handleSubmit() async {
    if (!_formKey.currentState!.validate()) return;

    final email = _ctrlEmail.text.trim();
    final password = _ctrlPassword.text.trim();

    setState(() => _loading = true);

    try {
      await Auth().regis(email, password);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: AwesomeSnackbarContent(
            title: 'Registrasi berhasil!',
            message: 'Silakan login.',
            contentType: ContentType.success,
          ),
          duration: const Duration(seconds: 3),
        ),
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Login()),
      );
    } catch (e) {
      if (e.toString().contains('Email telah digunakan')) {}
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: AwesomeSnackbarContent(
            title: 'Registrasi Gagal',
            message: 'Registrasi Gagal: ${e.toString()}',
            contentType: ContentType.failure,
          ),
        ),
      );
    } finally {
      setState(() => _loading = false);
    }
  }
}
