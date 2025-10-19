import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// --- DIUBAH: Import diubah untuk menggunakan model data OOP kita ---
import '../models/base_item.dart';
import '../models/data_restoran.dart';
import '../models/data_hotel.dart';
import '../models/data_wisata.dart';
import '../models/data_belanja.dart';
// --- Hapus import 'rekomendasi.dart' karena sudah tidak dipakai ---

import 'wisata_screen.dart';
import 'hotel_screen.dart';
import 'restoran_screen.dart';
import 'belanja_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Stack(
                children: [
                  _buildBackgroundImage(),
                  _buildGradientOverlay(),
                  SafeArea(
                    child: Column(
                      children: [
                        _buildHeader(),
                        Expanded(
                          child: _buildMainContent(context),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            _buildRecommendationsSection(context),
          ],
        ),
      ),
    );
  }

  Widget _buildBackgroundImage() {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
              'https://images.pexels.com/photos/2161449/pexels-photo-2161449.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildGradientOverlay() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.5),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Destination Dash',
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.menu, color: Colors.white, size: 30),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildMainContent(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Jelajahi Kota Impianmu',
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 48,
              fontWeight: FontWeight.w900,
              height: 1.2,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Temukan tempat terbaik untuk menginap, makan, berbelanja, atau sekadar bersantai dari para ahli lokal.',
            textAlign: TextAlign.center,
            style: GoogleFonts.roboto(
              color: Colors.white70,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 32),
          _buildSearchForm(context),
          const SizedBox(height: 32),
          Text(
            'Atau telusuri sorotan',
            style: GoogleFonts.roboto(color: Colors.white70),
          ),
          const SizedBox(height: 16),
          _buildCategoryButtons(context),
        ],
      ),
    );
  }

  Widget _buildSearchForm(BuildContext context) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                style: GoogleFonts.roboto(),
                decoration: InputDecoration(
                  hintText: 'Cari: makanan, hotel...',
                  border: InputBorder.none,
                  icon: const Icon(Icons.search, color: Colors.grey),
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {},
              child:
                  Text('Cari', style: GoogleFonts.roboto(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryButtons(BuildContext context) {
    return Wrap(
      spacing: 24.0,
      runSpacing: 16.0,
      alignment: WrapAlignment.center,
      children: [
        _categoryButton(context, Icons.restaurant, 'Restoran'),
        _categoryButton(context, Icons.hotel, 'Hotel'),
        _categoryButton(context, Icons.tour, 'Wisata'),
        _categoryButton(context, Icons.shopping_bag, 'Belanja'),
      ],
    );
  }

  Widget _categoryButton(BuildContext context, IconData icon, String label) {
    return InkWell(
      onTap: () {
        if (label == 'Wisata') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const WisataScreen()),
          );
        } else if (label == 'Restoran') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const RestoranScreen()),
          );
        }
        else if (label == 'Hotel') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const HotelScreen()),
          );
        }
        else if (label == 'Belanja') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const BelanjaScreen()),
          );
        }
      },
      borderRadius: BorderRadius.circular(8),
      child: SizedBox(
        width: 80,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.25),
                  shape: BoxShape.circle,
                  border: Border.all(
                      color: Colors.white.withOpacity(0.4), width: 1.5)),
              child: Icon(icon, color: Colors.white, size: 28),
            ),
            const SizedBox(height: 8),
            Text(
              label,
              style: GoogleFonts.roboto(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecommendationsSection(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 24.0),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Rekomendasi',
                style: GoogleFonts.poppins(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
            const SizedBox(height: 16),
            TabBar(
              labelStyle: GoogleFonts.roboto(fontWeight: FontWeight.bold),
              unselectedLabelStyle: GoogleFonts.roboto(),
              isScrollable: true,
              labelColor: Colors.red,
              unselectedLabelColor: Colors.grey,
              indicatorColor: Colors.red,
              tabs: const [
                Tab(text: 'Restoran'),
                Tab(text: 'Hotel'),
                Tab(text: 'Wisata'),
                Tab(text: 'Belanja'),
              ],
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 250,
              child: TabBarView(
                children: [
                  _buildRecommendationCarousel(items: dummyRestaurants),
                  _buildRecommendationCarousel(items: dummyHotels),
                  _buildRecommendationCarousel(items: dummyDestination),
                  _buildRecommendationCarousel(items: shoppingData),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // --- PENERAPAN POLYMORPHISM DIMULAI DI SINI ---
  // Widget ini sekarang menerima List<BaseItem>, bukan List<Recommendation>.
  // Artinya, ia bisa menerima list APA SAJA (Restoran, Hotel, Wisata, Belanja)
  // selama class-nya adalah turunan dari BaseItem.
  Widget _buildRecommendationCarousel({required List<BaseItem> items}) {
    if (items.isEmpty) {
      return Center(
          child: Text('Belum ada rekomendasi.', style: GoogleFonts.roboto()));
    }
    return CarouselSlider.builder(
      itemCount: items.length,
      itemBuilder: (context, index, realIndex) {
        final item = items[index];
        // Kita cukup memanggil satu widget Card generik.
        return _buildRecommendationCard(item: item);
      },
      options: CarouselOptions(
        height: 250,
        autoPlay: true,
        enlargeCenterPage: true,
        viewportFraction: 0.8,
      ),
    );
  }

  // --- WIDGET CARD YANG POLIMORFIK ---
  // Widget ini hanya menerima satu parameter: `BaseItem`.
  // Ia tidak perlu tahu apakah item itu Hotel atau Restoran.
  // Ia hanya tahu bahwa setiap BaseItem PASTI punya `imageUrl`, `title`, dan `location`.
  Widget _buildRecommendationCard({required BaseItem item}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Card(
        elevation: 4,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Stack(
          children: [
            Image.network(
              // Mengakses getter dari BaseItem
              item.imageUrl,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
              loadingBuilder: (BuildContext context, Widget child,
                  ImageChunkEvent? loadingProgress) {
                if (loadingProgress == null) return child;
                return Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes!
                        : null,
                  ),
                );
              },
            ),
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.transparent, Colors.black.withOpacity(0.8)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: const [0.5, 1.0],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 12,
              left: 12,
              right: 12,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    // Mengakses getter dari BaseItem
                    item.title,
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.location_on,
                          color: Colors.white70, size: 16),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          // Mengakses getter dari BaseItem
                          item.location,
                          style: GoogleFonts.roboto(
                            color: Colors.white70,
                            fontSize: 14,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
