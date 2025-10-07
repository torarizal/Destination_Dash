// models/rekomendasi_belanja.dart

// Impor class Recommendation jika berada di file terpisah
// import 'rekomendasi.dart';

class Belanja {
  final String imageUrl;
  final String title;
  final String location;

  Belanja({
    required this.imageUrl,
    required this.title,
    required this.location,
  });
}


// --- DATA REKOMENDASI BELANJA (10 ITEM) ---
final List<Belanja> shoppingData = [
  Belanja(
    imageUrl: 'https://images.unsplash.com/photo-1580828343064-fde4fc206bc6?q=80&w=2071&auto=format&fit=crop&ixlib-rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    title: 'Jalan Malioboro',
    location: 'Yogyakarta, DIY',
  ),
  Belanja(
    imageUrl: 'https://images.unsplash.com/photo-1555529771-835f59ee5020?q=80&w=1932&auto=format&fit=crop&ixlib-rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    title: 'Grand Indonesia',
    location: 'Jakarta Pusat',
  ),
  Belanja(
    imageUrl: 'https://images.unsplash.com/photo-1599838183104-d7353b7543f4?q=80&w=2070&auto=format&fit=crop&ixlib-rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    title: 'Pasar Seni Ubud',
    location: 'Ubud, Bali',
  ),
  Belanja(
    imageUrl: 'https://media.istockphoto.com/id/1316949339/photo/a-man-working-in-a-textile-shop.jpg?s=612x612&w=0&k=20&c=N5pTSpw9PaY0z5YV3iL3-jGfBEs-9HqFm-S-XbAtSmg=',
    title: 'Pasar Tanah Abang',
    location: 'Jakarta Pusat',
  ),
  Belanja(
    imageUrl: 'https://media.istockphoto.com/id/1393961317/photo/paris-van-java-mall.jpg?s=612x612&w=0&k=20&c=K-b_pL1J7zsUH-8aG_a7oT_8-5X1E9Gz-0sE_j1bI7U=',
    title: 'Paris Van Java Mall',
    location: 'Bandung, Jawa Barat',
  ),
  Belanja(
    imageUrl: 'https://media.istockphoto.com/id/1289248559/photo/surabaya-indonesia-may-2019-tunjungan-plaza-shopping-mall-one-of-the-most-famous-and-biggest.jpg?s=612x612&w=0&k=20&c=7d2GCEk596wT2F8n-GzTUdCj16o_T-cg0P5KzAGKZbw=',
    title: 'Tunjungan Plaza',
    location: 'Surabaya, Jawa Timur',
  ),
  Belanja(
    imageUrl: 'https://images.unsplash.com/photo-1610016333246-d5697a5523a5?q=80&w=2070&auto=format&fit=crop&ixlib-rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    title: 'Seminyak Village',
    location: 'Seminyak, Bali',
  ),
  Belanja(
    imageUrl: 'https://media.istockphoto.com/id/1402284564/photo/beautiful-shopping-street-of-cihampelas-walk-bandung-indonesia.jpg?s=612x612&w=0&k=20&c=yDq1g9QW5SgLz-oN3j8l_zYyZJ9y-yq8gWw0b1Vl5qQ=',
    title: 'Cihampelas Walk',
    location: 'Bandung, Jawa Barat',
  ),
  Belanja(
    imageUrl: 'https://images.unsplash.com/photo-1525547719571-a2d4ac8945e2?q=80&w=1964&auto=format&fit=crop&ixlib-rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    title: 'Pondok Indah Mall',
    location: 'Jakarta Selatan',
  ),
  Belanja(
    imageUrl: 'https://media.istockphoto.com/id/1059534992/photo/pasar-baru-bandung.jpg?s=612x612&w=0&k=20&c=1W40h_fC3y-o95AEvOAToP06aY-8dJ0b8Cg2kRp7tB4=',
    title: 'Pasar Baru',
    location: 'Bandung, Jawa Barat',
  ),
];

