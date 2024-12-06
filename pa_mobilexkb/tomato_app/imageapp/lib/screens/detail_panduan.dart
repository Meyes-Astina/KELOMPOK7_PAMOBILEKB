import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailPanduanPage extends StatelessWidget {
  const DetailPanduanPage({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Panduan Aplikasi",
          style: GoogleFonts.inter(
            fontSize: 20.sp,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(color: Colors.white),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 30.h),
            child: ListView(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16.r),
                  child: Image.asset(
                    'assets/images/3.png',
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 200.h,
                  ),
                ),
                SizedBox(height: 20.h),
                Text(
                  "Panduan Aplikasi Klasifikasi Kematangan Tomat",
                  style: GoogleFonts.inter(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10.h),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16.w),
                  height: 5.h,
                  color: Colors.black,
                ),
                SizedBox(height: 20.h),
                Text(
                  "Aplikasi ini dirancang untuk membantu pengguna mengklasifikasikan\n kematangan tomat secara otomatis. "
                  "Berikut panduan lengkap penggunaan aplikasi:\n",
                  style: GoogleFonts.inter(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.normal,
                    color: Colors.black87,
                    height: 1.5.h,
                  ),
                  textAlign: TextAlign.justify,
                ),
                Text(
                  "1. Daftar Akun",
                  style: GoogleFonts.inter(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  "- Pengguna baru dapat membuat akun \n\ dengan memasukkan email dan kata\n sandi.\n"
                  "- Pengguna lama dapat langsung masuk \n  dengan email dan kata sandi yang\n terdaftar.",
                  style: GoogleFonts.inter(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.normal,
                    color: Colors.black87,
                    height: 1.5,
                  ),
                  textAlign: TextAlign.start,
                ),
                SizedBox(height: 20.h),
                Text(
                  "2. Pengaturan Profil",
                  style: GoogleFonts.inter(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  "- Pengguna dapat mengubah profil melalui menu Profile pada pojok kanan atas menu 'Home'\n"
                  "- Data yang dapat diperbarui meliputi:\n"
                  "   Nama       : Nama pengguna.\n"
                  "   Bio           : Informasi singkat pengguna.\n"
                  "   Gender    : Pilihan untuk data pribadi.",
                  style: GoogleFonts.inter(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.normal,
                    color: Colors.black87,
                    height: 1.5,
                  ),
                  textAlign: TextAlign.start,
                ),
                SizedBox(height: 20.h),
                Text(
                  "3. Informasi Aplikasi",
                  style: GoogleFonts.inter(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  "Tomato App menyediakan informasi, sebagai berikut:\n"
                  "- Model Klasifikasi: Penjelasan tentang model CNN dan VGGNet yang digunakan.\n"
                  "- Grafik Akurasi dan Loss Model: Ringkasan kinerja model, seperti akurasi dan data pelatihan.\n"
                  "- Panduan Aplikasi: Petunjuk penggunaan aplikasi.\n"
                  "- Tomat: Informasi seputar manfaat dan karakteristik tomat.",
                  style: GoogleFonts.inter(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.normal,
                    color: Colors.black87,
                    height: 1.5,
                  ),
                  textAlign: TextAlign.start,
                ),
                SizedBox(height: 20.h),
                Text(
                  "4. Scan",
                  style: GoogleFonts.inter(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  "- Pengguna dapat memindai gambar tomat melalui kamera atau unggah foto dari galeri.\n"
                  "- Aplikasi akan memproses gambar menggunakan model klasifikasi untuk menentukan apakah tomat matang (ripe) atau mentah (unripe).\n"
                  "- Hasil klasifikasi ditampilkan di layar.",
                  style: GoogleFonts.inter(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.normal,
                    color: Colors.black87,
                    height: 1.5,
                  ),
                  textAlign: TextAlign.start,
                ),
                SizedBox(height: 30.h),
                Text(
                  "Cara menggunakan fitur scan",
                  style: GoogleFonts.inter(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20.h),
                Text(
                  "Langkah-Langkah Penggunaan Scan:\n"
                  "1. Siapkan sebuah gambar tomat.\n"
                  "2. Pilih menu Scan.\n"
                  "3. Pilih 'Select Image Source', lalu pilih opsi mana yang ingin Anda pilih (Choose from Gallery or Take a Picture)\n"
                  "4. Klik 'Submit' untuk memulai proses prediksi.\n"
                  "5. Hasil prediksi akan ditampilkan di layar, menunjukkan apakah tomat tersebut matang atau belum matang.",
                  style: GoogleFonts.inter(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.normal,
                    color: Colors.black87,
                    height: 1.5,
                  ),
                  textAlign: TextAlign.start,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
