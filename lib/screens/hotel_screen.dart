import 'dart:ui';
import 'package:dash_web/models/data_hotel.dart';
import 'package:dash_web/screens/payment_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


// Screen utama untuk halaman Hotel
class HotelScreen extends StatelessWidget {
  const HotelScreen({super.key});

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
        // Latar belakang bisa disesuaikan lagi jika perlu untuk tema hotel
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('https://images.unsplash.com/photo-1566073771259-6a8506099945?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          color: Colors.black.withOpacity(0.6),
          child: SafeArea(
            // DIUBAH: Menggunakan data yang diasumsikan berisi daftar hotel
            // Anda perlu mengganti 'dummyDestinations' jika nama variabel di file data_wisata berbeda
            child: buildContent(dummyHotels),
          ),
        ),
      ),
    );
  }

  // Widget untuk membangun konten utama (judul dan grid)
  // DIUBAH: Tipe data diubah menjadi List<Destination> untuk merefleksikan model hotel
  Widget buildContent(List<Hotel> hotels) {
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
                      'Istirahat Berkualitas',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.playfairDisplay(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Temukan kenyamanan terbaik di hotel-hotel pilihan kami',
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
                    // DIUBAH: Menggunakan HotelCard untuk menampilkan data hotel
                    return HotelCard(hotel: hotels[index]);
                  },
                  childCount: hotels.length,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

// DIUBAH: Widget WisataCard diubah namanya menjadi HotelCard dan disesuaikan
class HotelCard extends StatelessWidget {
  // DIUBAH: Properti diubah namanya dari destination menjadi hotel
  final Hotel hotel;

  const HotelCard({super.key, required this.hotel});

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
                  // DIUBAH: Menggunakan properti dari objek hotel
                  hotel.imageUrl,
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
                        // DIUBAH: Menggunakan properti dari objek hotel
                        hotel.name,
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
                        // DIUBAH: Menggunakan properti dari objek hotel
                        hotel.description,
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          color: Colors.grey[300],
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                // DIUBAH: Menggunakan properti dari objek hotel
                                hotel.priceInfo,
                                style: GoogleFonts.inter(
                                  fontSize: 12,
                                  color: Colors.grey[400],
                                ),
                              ),
                              Text(
                                // DIUBAH: Menggunakan properti dari objek hotel
                                hotel.price,
                                style: GoogleFonts.inter(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          ElevatedButton(
                            onPressed: () {
                              final priceInt = int.tryParse(
                                // DIUBAH: Menggunakan properti dari objek hotel
                                hotel.price.replaceAll(RegExp(r'[^0-9]'), ''),
                              ) ?? 0;
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PaymentScreen(
                                    // DIUBAH: Menggunakan properti dari objek hotel
                                    imageUrl: hotel.imageUrl,
                                    name: hotel.name,
                                    price: priceInt,
                                  ),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFFBBF24),
                              foregroundColor: Colors.black,
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                            child: Text(
                              // DIUBAH: Teks tombol diganti
                              'Pesan Sekarang',
                              style: GoogleFonts.inter(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          ),
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
