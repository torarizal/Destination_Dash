import 'dart:ui';
import 'package:dash_web/models/data_belanja.dart'; // Pastikan path ini benar
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Screen utama untuk halaman Belanja
class BelanjaScreen extends StatelessWidget {
  const BelanjaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            }
          },
          tooltip: 'Kembali',
        ),
      ),
      body: Container(
        // Latar belakang disesuaikan untuk tema belanja
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('https://images.unsplash.com/photo-1555529771-835f59ee5020?q=80&w=1932&auto=format&fit=crop&ixlib-rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          color: Colors.black.withOpacity(0.6),
          child: SafeArea(
            // Menggunakan data shoppingData dari file data belanja
            child: buildContent(shoppingData),
          ),
        ),
      ),
    );
  }

  // Widget untuk membangun konten utama (judul dan grid)
  Widget buildContent(List<Belanja> shoppingList) {
    return LayoutBuilder(
      builder: (context, constraints) {
        int crossAxisCount;
        double childAspectRatio;
        
        if (constraints.maxWidth > 1024) {
          crossAxisCount = 3;
          childAspectRatio = 0.85;
        } else if (constraints.maxWidth > 600) {
          crossAxisCount = 2;
          childAspectRatio = 0.8;
        } else {
          crossAxisCount = 1;
          childAspectRatio = 0.9;
        }

        return CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 24.0),
                child: Column(
                  children: [
                    Text(
                      'Surga Belanja',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.playfairDisplay(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Temukan pusat perbelanjaan dan oleh-oleh terbaik',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                        fontSize: 18,
                        color: Colors.grey[300],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
              sliver: SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio: childAspectRatio,
                ),
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    // Menggunakan BelanjaCard untuk menampilkan data
                    return BelanjaCard(belanja: shoppingList[index]);
                  },
                  childCount: shoppingList.length,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

// Widget Card baru untuk menampilkan data belanja
class BelanjaCard extends StatelessWidget {
  final Belanja belanja;

  const BelanjaCard({super.key, required this.belanja});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16.0),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
            borderRadius: BorderRadius.circular(16.0),
            border: Border.all(
              color: Colors.white.withOpacity(0.2),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16.0),
                  topRight: Radius.circular(16.0),
                ),
                child: Image.network(
                  belanja.imageUrl,
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => 
                    Container(height: 180, color: Colors.grey[800], child: const Icon(Icons.broken_image, color: Colors.grey)),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        belanja.title,
                        style: GoogleFonts.playfairDisplay(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          Icon(Icons.location_on, color: Colors.grey[400], size: 16),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              belanja.location,
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                color: Colors.grey[300],
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ],
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

