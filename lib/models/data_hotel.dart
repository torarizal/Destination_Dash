import 'base_item.dart';

class Hotel extends BaseItem {
  final String description;
  final double rating;
  final String price;
  final String priceInfo;

  Hotel({
    required String imageUrl,
    required String name,
    required this.description,
    required this.rating,
    required this.price,
    required this.priceInfo,
  }) : super(
          imageUrl: imageUrl,
          title: name,
          location: 'Various Locations', // Hotel tidak punya lokasi di data, kita beri default
        );
  
  @override
  String getCategory() {
    return 'Hotel';
  }
}

// Data dummy tidak perlu diubah
final List<Hotel> dummyHotels= [
  Hotel(
    imageUrl: 'https://images.unsplash.com/photo-1566073771259-6a8506099945?q=80&w=2070&auto=format&fit=crop&ixlib-rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    name: 'Grand Aston',
    description: 'Hotel bintang 5 dengan pemandangan kota dan fasilitas mewah.',
    rating: 4.8,
    price: 'Rp1.500.000',
    priceInfo: 'per malam',
  ),
  Hotel(
    imageUrl: 'https://images.unsplash.com/photo-1542314831-068cd1dbb5eb?q=80&w=2070&auto=format&fit=crop&ixlib-rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    name: 'The Ritz-Carlton',
    description: 'Nikmati pengalaman menginap tak terlupakan di tepi pantai.',
    rating: 4.9,
    price: 'Rp3.250.000',
    priceInfo: 'per malam',
  ),
  Hotel(
    imageUrl: 'https://images.unsplash.com/photo-1582719508461-905c673771fd?q=80&w=1925&auto=format&fit=crop&ixlib-rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    name: 'Amanjiwo Resort',
    description: 'Ketenangan pedesaan dengan arsitektur yang terinspirasi dari Borobudur.',
    rating: 4.7,
    price: 'Rp2.100.000',
    priceInfo: 'per malam',
  ),
  Hotel(
    imageUrl: 'https://images.unsplash.com/photo-1618773928121-c32242e63f39?q=80&w=2070&auto=format&fit=crop&ixlib-rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    name: 'Hotel Tentrem',
    description: 'Menggabungkan nuansa modern dan tradisional Jawa di pusat kota.',
    rating: 4.8,
    price: 'Rp1.800.000',
    priceInfo: 'per malam',
  ),
   Hotel(
    imageUrl: 'https://images.unsplash.com/photo-1571003123894-1f0594d2b5d9?q=80&w=1949&auto=format&fit=crop&ixlib-rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    name: 'Padma Hotel',
    description: 'Dikelilingi oleh perbukitan hijau, cocok untuk relaksasi.',
    rating: 4.6,
    price: 'Rp1.950.000',
    priceInfo: 'per malam',
  ),
   Hotel(
    imageUrl: 'https://images.unsplash.com/photo-1596394516093-501ba68a0ba6?q=80&w=2070&auto=format&fit=crop&ixlib-rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    name: 'JW Marriott',
    description: 'Akomodasi premium dengan akses mudah ke pusat bisnis.',
    rating: 4.9,
    price: 'Rp2.500.000',
    priceInfo: 'per malam',
  ),
];
