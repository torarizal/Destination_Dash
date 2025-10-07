// File ini berisi model dan SEMUA data untuk rekomendasi.

// 1. MODEL DATA
// Kelas ini mendefinisikan struktur data untuk setiap item rekomendasi.
class Recommendation {
  final String imageUrl;
  final String title;
  final String location;

  Recommendation({
    required this.imageUrl,
    required this.title,
    required this.location,
  });
}

// 2. DATA UNTUK SETIAP KATEGORI

// DATA UNTUK KATEGORI RESTORAN
final List<Recommendation> restaurantData = [
  Recommendation(
    imageUrl:
        'https://images.pexels.com/photos/1640777/pexels-photo-1640777.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    title: 'Salad Bar Sehat',
    location: 'Jakarta',
  ),
  Recommendation(
    imageUrl:
        'https://images.pexels.com/photos/70497/pexels-photo-70497.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    title: 'Burger & Kentang',
    location: 'Bandung',
  ),
  Recommendation(
    imageUrl:
        'https://images.pexels.com/photos/262978/pexels-photo-262978.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    title: 'Warung Sate Khas',
    location: 'Yogyakarta',
  ),
  Recommendation(
    imageUrl:
        'https://images.pexels.com/photos/1267320/pexels-photo-1267320.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    title: 'Seafood Lezat',
    location: 'Makassar',
  ),
];

// DATA UNTUK KATEGORI HOTEL
final List<Recommendation> hotelData = [
  Recommendation(
    imageUrl:
        'https://images.pexels.com/photos/258154/pexels-photo-258154.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    title: 'Resort Tepi Pantai',
    location: 'Bali',
  ),
  Recommendation(
    imageUrl:
        'https://images.pexels.com/photos/271624/pexels-photo-271624.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    title: 'Hotel Modern Pusat Kota',
    location: 'Surabaya',
  ),
  Recommendation(
    imageUrl:
        'https://images.pexels.com/photos/161758/governor-s-mansion-montgomery-alabama-grand-staircase-161758.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    title: 'Boutique Hotel Klasik',
    location: 'Semarang',
  ),
  Recommendation(
    imageUrl:
        'https://images.pexels.com/photos/261102/pexels-photo-261102.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    title: 'Villa Asri Pegunungan',
    location: 'Puncak',
  ),
];

// DATA UNTUK KATEGORI WISATA
final List<Recommendation> tourData = [
  Recommendation(
    imageUrl:
        'https://images.pexels.com/photos/3278215/pexels-photo-3278215.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    title: 'Pulau Padar',
    location: 'Nusa Tenggara Timur',
  ),
  Recommendation(
    imageUrl:
        'https://images.pexels.com/photos/1020016/pexels-photo-1020016.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    title: 'Gunung Bromo',
    location: 'Jawa Timur',
  ),
  Recommendation(
    imageUrl:
        'https://images.pexels.com/photos/4170583/pexels-photo-4170583.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    title: 'Danau Toba',
    location: 'Sumatera Utara',
  ),
  Recommendation(
    imageUrl:
        'https://images.pexels.com/photos/1593333/pexels-photo-1593333.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    title: 'Raja Ampat',
    location: 'Papua Barat',
  ),
];

// DATA UNTUK KATEGORI BELANJA
final List<Recommendation> shoppingData = [
   Recommendation(
    imageUrl:
        'https://images.pexels.com/photos/325876/pexels-photo-325876.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    title: 'Pusat Pakaian',
    location: 'Jakarta',
  ),
  Recommendation(
    imageUrl:
        'https://images.pexels.com/photos/1020325/pexels-photo-1020325.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    title: 'Pasar Seni Tradisional',
    location: 'Yogyakarta',
  ),
  Recommendation(
    imageUrl:
        'https://images.pexels.com/photos/19090/pexels-photo.jpg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    title: 'Toko Sepatu Modern',
    location: 'Bandung',
  ),
  Recommendation(
    imageUrl:
        'https://images.pexels.com/photos/39853/woman-girl-freedom-happy-39853.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    title: 'Malioboro',
    location: 'Yogyakarta',
  ),
];

