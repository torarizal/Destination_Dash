import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dash_web/models/data_restoran.dart';

// Screen utama untuk halaman Restoran
class RestoranScreen extends StatelessWidget {
  const RestoranScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // DIUBAH: Menambahkan properti ini agar body bisa berada di belakang AppBar
      extendBodyBehindAppBar: true,
      // DIUBAH: Menambahkan AppBar untuk tombol kembali
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Membuat AppBar tidak terlihat
        elevation: 0, // Menghilangkan bayangan di bawah AppBar
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            // Aksi untuk kembali ke halaman sebelumnya
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            }
          },
          tooltip: 'Kembali',
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('https://images.unsplash.com/photo-1555396273-367ea4eb4db5?q=80&w=1974&auto=format&fit=crop&ixlib-rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          color: Colors.black.withOpacity(0.6),
          child: SafeArea(
            child: buildContent(dummyRestaurants),
          ),
        ),
      ),
    );
  }

  Widget buildContent(List<Restaurant> data) {
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
                      'Rekomendasi Restoran',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.playfairDisplay(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Temukan tempat makan terbaik di sekitar Anda.',
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
                    return RestoCard(restaurant: data[index]);
                  },
                  childCount: data.length,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

// Widget untuk kartu restoran
class RestoCard extends StatelessWidget {
  final Restaurant restaurant;

  const RestoCard({super.key, required this.restaurant});

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
                  restaurant.imageUrl,
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        restaurant.name,
                        style: GoogleFonts.playfairDisplay(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        restaurant.cuisine,
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          color: Colors.grey[300],
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Icon(Icons.location_on, color: Colors.grey[400], size: 16),
                                const SizedBox(width: 4),
                                Expanded(
                                  child: Text(
                                    restaurant.address,
                                    style: GoogleFonts.inter(
                                      fontSize: 12,
                                      color: Colors.grey[400],
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              children: [
                                const Icon(Icons.star, color: Color(0xFFFBBF24), size: 16),
                                const SizedBox(width: 4),
                                Text(
                                  restaurant.rating.toString(),
                                  style: GoogleFonts.inter(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      )
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

