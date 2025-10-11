import 'dart:async';
import 'package:dash_web/screens/login_screen.dart';
import 'package:flutter/material.dart';


// Widget untuk Splash Screen
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimationTitle;
  late Animation<Offset> _slideAnimationSubtitle;

  @override
  void initState() {
    super.initState();

    // Inisialisasi AnimationController untuk mengatur durasi animasi
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    // Definisi animasi fade-in untuk logo dan loading indicator
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.5, curve: Curves.easeIn),
      ),
    );

    // Definisi animasi slide-up untuk judul
    _slideAnimationTitle = Tween<Offset>(
      begin: const Offset(0, 0.5),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.3, 0.8, curve: Curves.easeOut),
      ),
    );
    
    // Definisi animasi slide-up untuk tagline
    _slideAnimationSubtitle = Tween<Offset>(
      begin: const Offset(0, 0.5),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.5, 1.0, curve: Curves.easeOut),
      ),
    );


    // Memulai semua animasi
    _controller.forward();

    // Timer untuk pindah ke halaman utama setelah durasi tertentu
    Timer(const Duration(seconds: 4), () {
      // Menggunakan pushReplacement agar user tidak bisa kembali ke splash screen
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose(); // Wajib di-dispose untuk mencegah memory leak
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // Membuat background gradasi seperti di versi web
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF06B6D4), Color(0xFF1E40AF)], // from-cyan-500 to-blue-800
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo
              FadeTransition(
                opacity: _fadeAnimation,
                child: const Icon(
                  Icons.explore, // Ikon yang mirip dengan SVG di versi web
                  size: 80,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 24),
              
              // Judul Website
              SlideTransition(
                position: _slideAnimationTitle,
                child: FadeTransition(
                  opacity: _fadeAnimation,
                  child: const Text(
                    'Jelajah Nusantara',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w900, // font-black
                      color: Colors.white,
                      letterSpacing: -1,
                    ),
                  ),
                ),
              ),
              
              // Tagline
              SlideTransition(
                position: _slideAnimationSubtitle,
                child: FadeTransition(
                  opacity: _fadeAnimation,
                  child: const Text(
                    'Temukan Surga Tersembunyi di Indonesia',
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xFFD1D5DB), // text-gray-200
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 48),

              // Indikator Loading
              FadeTransition(
                opacity: _fadeAnimation,
                child: const SizedBox(
                  width: 40,
                  height: 40,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    strokeWidth: 4.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

