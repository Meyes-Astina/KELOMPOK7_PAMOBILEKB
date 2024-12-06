import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailTomat extends StatelessWidget {
  const DetailTomat({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Tomat",
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
            padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 35.h),
            child: ListView(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20.r),
                  child: Image.asset(
                    'assets/images/kematangan.jpg',
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 200.h,
                  ),
                ),
                SizedBox(height: 20.h),
                Text(
                  "Tomat \n(Solanum lycopersicum)",
                  style: GoogleFonts.inter(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20.h),
                Text(
                  "Tomat merupakan salah satu tanaman hortikultura yang memiliki nilai ekonomi dan gizi tinggi. "
                  "Buah tomat dikenal sebagai sumber utama likopen, sebuah antioksidan kuat yang berperan dalam melindungi tubuh dari kerusakan oksidatif "
                  "dan menurunkan risiko penyakit kardiovaskular serta beberapa jenis kanker. \nSelain itu, tomat mengandung vitamin C, vitamin A, kalium, "
                  "dan serat pangan yang penting untuk menjaga kesehatan tubuh. Secara morfologi, tomat dapat dikategorikan berdasarkan tingkat kematangannya, "
                  "yaitu mentah (berwarna hijau) dan matang (berwarna merah), di mana perbedaan ini mencerminkan perubahan kandungan senyawa bioaktif dan karakteristik rasa.",
                  style: GoogleFonts.inter(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.normal,
                    color: Colors.black87,
                    height: 1.5,
                  ),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(height: 40.h),
                Text(
                  "Buah Tomat Mentah",
                  style: GoogleFonts.inter(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 20.h),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20.r),
                  child: Image.asset(
                    'assets/images/unripe.jpg',
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 200.h,
                  ),
                ),
                SizedBox(height: 20.h),
                Text(
                  "Tomat pada tahap ini masih hijau, keras, dan belum siap dikonsumsi. Rasanya cenderung asam.",
                  style: GoogleFonts.inter(
                    fontSize: 14.sp,
                    color: Colors.black87,
                    height: 1.5,
                  ),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(height: 40.h),
                Text(
                  "Buah Tomat Matang",
                  style: GoogleFonts.inter(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 20.h),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20.r),
                  child: Image.asset(
                    'assets/images/ripe.jpg',
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 200.h,
                  ),
                ),
                SizedBox(height: 20.h),
                Text(
                  "Pada tahap ini, tomat telah berwarna merah cerah, lembut, dan siap dikonsumsi dengan rasa manis.",
                  style: GoogleFonts.inter(
                    fontSize: 14.sp,
                    color: Colors.black87,
                    height: 1.5,
                  ),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(height: 40.h),
                Text(
                  "Fakta Tentang Tomat",
                  style: GoogleFonts.inter(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 20.h),
                Text(
                  "1. Asal-usul Nama\n Kata \"tomat\" berasal dari bahasa Nahuatl (Aztek) tomatl, yang berarti \"buah bengkak.\"\n"
                  "2. Buah atau Sayur?\n Secara botani, tomat adalah buah karena tumbuh dari bunga dan mengandung biji, tetapi sering dianggap sebagai sayur dalam kuliner.\n"
                  "3. Terdapat 10.000 Varietas\n Ada ribuan varietas tomat, mulai dari tomat ceri kecil hingga tomat raksasa heirloom.\n"
                  "4. Mengandung Likopen\n Tomat kaya akan likopen, antioksidan yang memberikan warna merah dan baik untuk kesehatan jantung.\n"
                  "5. Pernah Dianggap Beracun\n Di Eropa abad ke-16, tomat disebut \"apel beracun\" karena orang percaya tomat dapat menyebabkan penyakit.\n"
                  "6. Komposisi Air Tinggi\n Sekitar 95% kandungan tomat adalah air, menjadikannya makanan rendah kalori dan menyegarkan.\n"
                  "7. Dapat Memperbaiki Kulit\n Masker tomat sering digunakan untuk mencerahkan kulit dan mengurangi jerawat karena kandungan vitaminnya.",
                  style: GoogleFonts.inter(
                    fontSize: 14.sp,
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
