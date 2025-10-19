import 'dart:ui';
import 'package:dash_web/screens/payment_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dash_web/models/data_wisata.dart';

// Screen utama untuk halaman Wisata
class WisataScreen extends StatelessWidget {
  const WisataScreen({super.key});

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
        // Latar belakang disesuaikan untuk tema wisata
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('https://images.unsplash.com/photo-1476514525535-07fb3b4ae5f1?q=80&w=2070&auto=format&fit=crop&ixlib-rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaGO0by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          // Overlay gelap agar teks mudah dibaca
          color: Colors.black.withOpacity(0.6),
          child: SafeArea(
            // Memanggil data wisata dari file terpisah
            child: buildContent(dummyDestinations),
          ),
        ),
      ),
    );
  }

  // Widget untuk membangun konten utama (judul dan grid)
  Widget buildContent(List<Destination> data) {
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
                    // Judul halaman disesuaikan
                    Text(
                      'Mari Jelajahi Indonesia',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.playfairDisplay(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Subjudul halaman disesuaikan
                    Text(
                      'Jelajahi tempat-tempat paling menakjubkan di Indonesia.',
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
                    // Menggunakan WisataCard untuk menampilkan data
                    return WisataCard(destination: data[index]);
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

// Widget untuk setiap kartu destinasi wisata (desain glassmorphism)
class WisataCard extends StatelessWidget {
  final Destination destination;

  const WisataCard({super.key, required this.destination});

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
                  destination.imageUrl,
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
                        destination.name,
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
                        destination.description,
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          color: Colors.grey[300],
                        ),
                        maxLines: 2, // Deskripsi bisa 2 baris
                        overflow: TextOverflow.ellipsis,
                      ),
                      const Spacer(), // Mendorong konten di bawahnya ke dasar kartu
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                           Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                destination.priceInfo,
                                style: GoogleFonts.inter(
                                  fontSize: 12,
                                  color: Colors.grey[400],
                                ),
                              ),
                              Text(
                                destination.price,
                                style: GoogleFonts.inter(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          // DIUBAH: Bagian rating diganti dengan tombol Beli Tiket
                          ElevatedButton(
                            onPressed: () {
                              // Ambil harga dalam bentuk int dari string (misal: "Rp100.000" -> 100000)
                              final priceInt = int.tryParse(
                                destination.price.replaceAll(RegExp(r'[^0-9]'), ''),
                              ) ?? 0;
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PaymentScreen(
                                    imageUrl: destination.imageUrl,
                                    name: destination.name,
                                    price: priceInt,
                                  ),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFFBBF24), // Warna kuning
                              foregroundColor: Colors.black, // Teks warna hitam
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                            child: Text(
                              'Beli Tiket',
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
