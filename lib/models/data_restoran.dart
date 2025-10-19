
import 'base_item.dart';
// Model untuk data Restoran
class Restaurant extends BaseItem {
  final String cuisine;
  final double rating;

  Restaurant({
    required String imageUrl,
    required String name,
    required String address, // 'address' akan dipetakan ke 'location'
    required this.cuisine,
    required this.rating,
  }) : super(
          imageUrl: imageUrl,
          title: name,
          location: address, // Mengirim 'address' ke parameter 'location' milik parent
        );

  @override
  String getCategory() {
    return 'Restoran';
  }
}

// Data dummy tidak perlu diubah
final List<Restaurant> dummyRestaurants = [
  Restaurant(
    imageUrl: 'https://images.unsplash.com/photo-1552566626-52f8b828add9?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    name: 'Sederhana Bintaro',
    cuisine: 'Masakan Padang',
    rating: 4.9,
    address: 'Jl. Veteran No. 2, Jakarta',
  ),
  Restaurant(
    imageUrl: 'https://images.unsplash.com/photo-1514933651103-005eec06c04b?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    name: 'Gudeg Yu Djum',
    cuisine: 'Masakan Jawa',
    rating: 4.8,
    address: 'Jl. Kaliurang KM 4.5, Yogyakarta',
  ),
  Restaurant(
    imageUrl: 'https://images.unsplash.com/photo-1579684033469-8f06f5b5f2b8?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    name: 'Bebek Tepi Sawah',
    cuisine: 'Masakan Bali',
    rating: 4.7,
    address: 'Jl. Raya Goa Gajah, Ubud, Bali',
  ),
  Restaurant(
    imageUrl: 'https://images.unsplash.com/photo-1506354666786-959d6d497f1a?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    name: 'Pizza Place',
    cuisine: 'Masakan Italia',
    rating: 4.6,
    address: 'Jl. Senopati No. 5, Jakarta',
  ),
  Restaurant(
    imageUrl: 'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?q=80&w=1981&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    name: 'Seafood City 21',
    cuisine: 'Hidangan Laut',
    rating: 4.8,
    address: 'Jl. Pantai Mutiara, Jakarta Utara',
  ),
  Restaurant(
    imageUrl: 'https://images.unsplash.com/photo-1604382354936-07c5d9983bd3?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    name: 'Sate Khas Senayan',
    cuisine: 'Sate & Masakan Indonesia',
    rating: 4.9,
    address: 'Jl. Pakubuwono VI, Jakarta Selatan',
  ),
];
