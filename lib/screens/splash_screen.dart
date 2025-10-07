import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // Import package

// Asumsi login_screen.dart sudah ada
  import 'login_screen.dart';

  void main() {
    runApp(const MyApp());
  }

  class MyApp extends StatelessWidget {
    const MyApp({Key? key}) : super(key: key);

    @override
Widget build(BuildContext context) {
  return MaterialApp(
    title: 'Destination Dash',
    theme: ThemeData(
      primarySwatch: Colors.blue,
      // MODIFIKASI: Menggunakan google_fonts untuk tema utama aplikasi
      textTheme: GoogleFonts.poppinsTextTheme(
        Theme.of(context).textTheme,
      ),
    ),
    debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
      );
    }
  }

  // Widget untuk Splash Screen
  class SplashScreen extends StatefulWidget {
    const SplashScreen({Key? key}) : super(key: key);

    @override
    State<SplashScreen> createState() => _SplashScreenState();
  }

  class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
    late AnimationController _animationController;
    late Animation<Offset> _slideAnimation;

    @override
    void initState() {
      super.initState();

      _animationController = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 2),
      );

      _slideAnimation = Tween<Offset>(
        begin: const Offset(0, 1.5),
        end: Offset.zero,
      ).animate(
        CurvedAnimation(
          parent: _animationController,
          curve: const Cubic(0.68, -0.55, 0.27, 1.55),
        ),
      );

      _animationController.forward();

      Timer(const Duration(seconds: 3), () {
        if (mounted) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const LoginPage()),
          );
        }
      });
    }

    @override
    void dispose() {
      _animationController.dispose();
      super.dispose();
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: Container(
          // MODIFIKASI: Menggunakan gambar sebagai latar belakang
          decoration: const BoxDecoration(
            image: DecorationImage(
              // Pastikan Anda memiliki gambar di path 'assets/background.png'
              image: AssetImage('bromo.jpg'), 
              // Membuat gambar menutupi seluruh layar
              fit: BoxFit.cover, 
            ),
          ),
          child: Center(
            child: SlideTransition(
              position: _slideAnimation,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.send,
                    color: Colors.white,
                    size: 50.0,
                  ),
                  const SizedBox(width: 16.0),
                  Text( // Dihapus 'const' agar bisa menggunakan GoogleFonts
                    'Destination Dash',
                    // MODIFIKASI: Menggunakan GoogleFonts.poppins() untuk style
                    style: GoogleFonts.poppins(
                      fontSize: 42.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 1.2,
                      // Menambahkan bayangan agar teks lebih mudah terbaca di atas gambar
                      shadows: [
                        const Shadow(
                          blurRadius: 10.0,
                          color: Colors.black54,
                          offset: Offset(2.0, 2.0),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }
  }

