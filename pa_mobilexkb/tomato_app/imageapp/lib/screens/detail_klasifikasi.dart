import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailKlasifikasiPage extends StatelessWidget {
  const DetailKlasifikasiPage({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Model Klasifikasi",
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
        decoration: const BoxDecoration(color: Colors.white),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 30.h),
            child: ListView(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16.r),
                  child: Image.asset(
                    'assets/images/klasifikasi.jpeg',
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 200.h,
                  ),
                ),
                SizedBox(height: 20.h),
                Text(
                  "Klasifikasi Kematangan Buah Tomat Menggunakan CNN",
                  style: GoogleFonts.inter(
                    fontSize: 16.sp,
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
                  "Klasifikasi kematangan tomat adalah proses membedakan tingkat kematangan tomat, biasanya dalam dua kategori yaitu \n matang (ripe) dan mentah (unripe), menggunakan gambar sebagai input.\n "
                  "Tujuan utamanya adalah untuk mengotomatiskan proses penilaian kematangan, guna mendukung efisiensi di sektor pertanian.",
                  style: GoogleFonts.inter(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.normal,
                    color: Colors.black87,
                    height: 1.5,
                  ),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(height: 20.h),
                Text(
                  "CNN (Convolutional Neural Networks)",
                  style: GoogleFonts.inter(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16.w),
                  height: 5.h,
                  color: Colors.black,
                ),
                SizedBox(height: 10.h),
                Text(
                  "CNN adalah jenis jaringan saraf yang dirancang untuk mengenali pola pada gambar, seperti warna, tekstur, dan bentuk. CNN bekerja melalui:\n\n"
                  "1. Convolutional Layers: Menangkap fitur penting dari gambar.\n"
                  "2. Pooling Layers: Mengurangi dimensi data untuk efisiensi komputasi.\n"
                  "3. Fully Connected Layers: Melakukan klasifikasi berdasarkan fitur yang telah diproses.",
                  style: GoogleFonts.inter(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.normal,
                    color: Colors.black87,
                    height: 1.5,
                  ),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(height: 20.h),
                Text(
                  "Pendekatan dengan Model VGGNet",
                  style: GoogleFonts.inter(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16.w),
                  height: 5.h,
                  color: Colors.black,
                ),
                SizedBox(height: 10.h),
                Text(
                  "VGGNet adalah salah satu arsitektur CNN yang dirancang untuk klasifikasi gambar. Karakteristik utama VGGNet:\n"
                  "1. Filter kecil (3x3): Mendeteksi detail gambar secara mendalam.\n"
                  "2. Struktur sederhana: Menggunakan susunan lapisan convolusi dan pooling berulang.\n"
                  "3. Varian populer: VGG16 (16 lapisan) dan VGG19 (19 lapisan).",
                  style: GoogleFonts.inter(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.normal,
                    color: Colors.black87,
                    height: 1.5,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
