import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imageapp/screens/home.dart';
import 'package:imageapp/pages/opening.dart';
import 'package:imageapp/pages/login1.dart';
import 'package:provider/provider.dart';
import 'package:imageapp/controller/controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); 
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PredictionProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 690), 
      builder: (context, child) {
        return MaterialApp(
          title: 'Tomato App',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return const HomePage1(); 
              } else {
                return const SplashPage(); 
              }
            },
          ),
          routes: {
            '/login': (context) => const Login(), 
            '/home': (context) => const HomePage1(), 
          },
        );
      },
    );
  }
}
