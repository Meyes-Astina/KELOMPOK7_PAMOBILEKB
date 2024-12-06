import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailAkurasiLossPage extends StatelessWidget {
  const DetailAkurasiLossPage({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Grafik Akurasi dan Loss",
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
        decoration: BoxDecoration(color: Colors.white),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 35.h),
            child: ListView(
              children: [
                Text(
                  "Grafik Akurasi Pelatihan",
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
                    'assets/images/predict1.png',
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 200.h,
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  "\nGrafik ini menunjukkan perubahan akurasi pelatihan (kurva biru) dan akurasi validasi (kurva oranye) selama beberapa epoch. Akurasi pelatihan meningkat tajam di awal dan kemudian melambat mendekati nilai maksimum (~0.98). "
                  "Akurasi validasi juga meningkat pada awalnya dan mendekati akurasi pelatihan, namun mulai berfluktuasi pada beberapa epoch terakhir.",
                  style: GoogleFonts.inter(
                    fontSize: 14.sp,
                    color: Colors.black87,
                    height: 1.5,
                  ),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(height: 30.h),
                Text(
                  "Grafik Loss Pelatihan",
                  style: GoogleFonts.inter(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 20.h),
                ClipRRect(
                  borderRadius: BorderRadius.circular(16.r),
                  child: Image.asset(
                    'assets/images/predict2.png',
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 200.h,
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  "\nPada awal pelatihan, loss untuk kedua dataset cukup tinggi, kemudian secara bertahap menurun seiring dengan bertambahnya epoch. Loss pelatihan menurun lebih konsisten, sedangkan loss validasi menunjukkan fluktuasi kecil, "
                  "terutama setelah epoch ke-10. Namun, kedua loss cenderung stabil pada nilai yang rendah di epoch akhir, mengindikasikan bahwa model telah mencapai tingkat kesalahan minimal untuk kedua dataset.",
                  style: GoogleFonts.inter(
                    fontSize: 14.sp,
                    color: Colors.black87,
                    height: 1.5.h,
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
