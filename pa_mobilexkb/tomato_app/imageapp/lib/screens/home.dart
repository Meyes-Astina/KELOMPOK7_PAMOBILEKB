import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:imageapp/pages/profile.dart';
import 'package:imageapp/screens/scan.dart';
import 'package:imageapp/screens/detail_akurasi_loss.dart';
import 'package:imageapp/screens/detail_tomat.dart';
import 'package:imageapp/screens/detail_klasifikasi.dart';
import 'package:imageapp/screens/detail_panduan.dart';
import 'package:imageapp/pages/login1.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage1 extends StatefulWidget {
  const HomePage1({super.key});

  @override
  State<HomePage1> createState() => _HomePage1State();
}

class _HomePage1State extends State<HomePage1> {
  final List<String> _carouselImages = [
    'assets/images/2.png',
    'assets/images/4.png',
    'assets/images/3.png',
  ];

  final List<String> titles = [
    "Model Klasifikasi",
    "Grafik Akurasi dan Loss",
    "Panduan Aplikasi",
    "Tentang Tomat",
  ];

  final List<String> images = [
    'assets/images/klasifikasi.jpeg',
    'assets/images/predict1.png',
    'assets/images/3.png',
    'assets/images/5.jpeg',
  ];

  int _currentIndex = 0;

  void _logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      if (mounted) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const Login()),
          (route) => false,
        );
      }
    } catch (e) {
      print("Error during logout: $e");
    }
  }

  void _onBottomNavTap(int index) {
    setState(() {
      _currentIndex = index;
    });

    if (index == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomePage1()),
      );
    } else if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const PredictionScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.logout, color: Colors.red),
          onPressed: _logout,
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: CircleAvatar(
                radius: 15.sp,
                backgroundColor: Colors.red,
                child: const Icon(
                  Icons.account_circle,
                  size: 30,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LayoutBuilder(
                  builder: (context, constraints) {
                    double titleSize =
                        constraints.maxWidth > 600 ? 32.sp : 28.sp;
                    return Text(
                      "Tomato App",
                      style: GoogleFonts.poppins(
                        fontSize: titleSize,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    );
                  },
                ),
                LayoutBuilder(
                  builder: (context, constraints) {
                    double subTitleSize =
                        constraints.maxWidth > 600 ? 18.sp : 14.sp;
                    return Text(
                      "Smart Choices, Perfect Ripeness!",
                      style: GoogleFonts.poppins(
                        fontSize: subTitleSize,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    );
                  },
                ),
                SizedBox(height: 50.h),
                LayoutBuilder(
                  builder: (context, constraints) {
                    double carouselHeight =
                        constraints.maxWidth > 600 ? 300.h : 150;
                    0.h;
                    return CarouselSlider(
                      options: CarouselOptions(
                        height: carouselHeight,
                        autoPlay: true,
                        enlargeCenterPage: true,
                        aspectRatio: 16 / 9,
                        enableInfiniteScroll: true,
                        viewportFraction: 1.0,
                      ),
                      items: _carouselImages.map((image) {
                        return Builder(
                          builder: (BuildContext context) {
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(18.r),
                              child: Image.asset(
                                image,
                                fit: BoxFit.cover,
                                width: MediaQuery.of(context).size.width,
                              ),
                            );
                          },
                        );
                      }).toList(),
                    );
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 30.h),
          LayoutBuilder(
            builder: (context, constraints) {
              double subTitleSize = constraints.maxWidth > 600 ? 20.sp : 18.sp;
              return Text(
                "   Informasi Aplikasi",
                style: GoogleFonts.poppins(
                  fontSize: subTitleSize,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              );
            },
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
            child: LayoutBuilder(
              builder: (context, constraints) {
                int crossAxisCount = constraints.maxWidth > 600 ? 2 : 1;
                return GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    mainAxisSpacing: 12.w,
                    crossAxisSpacing: 12.w,
                    childAspectRatio: 1.3,
                  ),
                  itemCount: images.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        if (index == 0) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const DetailKlasifikasiPage(),
                            ),
                          );
                        } else if (index == 1) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const DetailAkurasiLossPage(),
                            ),
                          );
                        } else if (index == 2) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const DetailPanduanPage(),
                            ),
                          );
                        } else if (index == 3) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const DetailTomat(),
                            ),
                          );
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12.r),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 10,
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(16),
                                topRight: Radius.circular(16),
                              ),
                              child: Image.asset(
                                images[index],
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: 180.h,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(10.w),
                              child: Text(
                                titles[index],
                                style: GoogleFonts.poppins(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                                textAlign: TextAlign.justify,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onBottomNavTap,
        selectedItemColor: Colors.red,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code_outlined),
            label: 'Scan',
          ),
        ],
      ),
    );
  }
}
