import 'base_item.dart';

class Destination extends BaseItem {
  // Properti unik yang tidak ada di parent
  final String description;
  final double rating;
  final String price;
  final String priceInfo;

  Destination({
    // Properti untuk parent
    required String imageUrl,
    required String name, // 'name' akan dipetakan ke 'title' di parent

    // Properti unik untuk child
    required this.description,
    required this.rating,
    required this.price,
    required this.priceInfo,
  }) : super(
          imageUrl: imageUrl,
          title: name, // Mengirim 'name' ke parameter 'title' milik parent
          location: name.split(',').last.trim(), // Mengambil lokasi dari nama
        );

  // POLYMORPHISM: Implementasi spesifik untuk class Destination
  @override
  String getCategory() {
    return 'Wisata';
  }
}

// Data dummy tidak perlu diubah
final List<Destination> dummyDestination = [
  Destination(
    imageUrl: 'https://images.unsplash.com/photo-1518548450227-205c40164da2?q=80&w=2070&auto=format&fit=crop&ixlib-rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    name: 'Pantai Kuta, Bali',
    description: 'Nikmati matahari terbenam yang ikonik dan suasana pantai yang hidup di salah satu destinasi paling terkenal di Bali.',
    rating: 4.8,
    price: 'Gratis',
    priceInfo: 'Mulai dari',
  ),
  Destination(
    imageUrl: 'https://images.unsplash.com/photo-1596422846543-75c6c1789714?q=80&w=1935&auto=format&fit=crop&ixlib-rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    name: 'Candi Borobudur, Magelang',
    description: 'Jelajahi kemegahan candi Buddha terbesar di dunia dan saksikan pemandangan matahari terbit yang magis.',
    rating: 4.9,
    price: 'Rp 50.000',
    priceInfo: 'Tiket Masuk',
  ),
  Destination(
    imageUrl: 'https://images.unsplash.com/photo-1595789123543-6997a3933e1d?q=80&w=2070&auto=format&fit=crop&ixlib-rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    name: 'Danau Toba, Sumatera Utara',
    description: 'Danau vulkanik terbesar di dunia, menawarkan pemandangan alam yang menakjubkan dan budaya Batak yang kaya.',
    rating: 4.7,
    price: 'Gratis',
    priceInfo: 'Mulai dari',
  ),
  Destination(
    imageUrl: 'https://images.unsplash.com/photo-1563814884145-383790e043b3?q=80&w=2070&auto=format&fit=crop&ixlib-rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    name: 'Raja Ampat, Papua Barat',
    description: 'Surga bagi penyelam dengan keanekaragaman hayati laut terkaya di planet ini dan gugusan pulau karst yang eksotis.',
    rating: 5.0,
    price: 'Rp 5 Jt',
    priceInfo: 'Paket Tur',
  ),
  Destination(
    imageUrl: 'https://images.unsplash.com/photo-1588668216647-38524d78e338?q=80&w=2070&auto=format&fit=crop&ixlib-rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    name: 'Gunung Bromo, Jawa Timur',
    description: 'Saksikan matahari terbit spektakuler dengan latar belakang gunung berapi aktif dan lautan pasir yang luas.',
    rating: 4.8,
    price: 'Rp 600.000',
    priceInfo: 'Sewa Jeep',
  ),
    Destination(
    imageUrl: 'https://images.unsplash.com/photo-1547387431-a207a650d032?q=80&w=2070&auto=format&fit=crop&ixlib-rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    name: 'Pulau Komodo, NTT',
    description: 'Bertemu langsung dengan kadal purba raksasa di habitat aslinya, serta menikmati pantai pink yang unik.',
    rating: 4.9,
    price: 'Rp 150.000',
    priceInfo: 'Tiket Masuk',
  ),
];
