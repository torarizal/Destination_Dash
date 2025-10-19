abstract class BaseItem {
  // 1. ENCAPSULATION: Properti dibuat private dengan underscore (_)
  final String _imageUrl;
  final String _title;
  final String _location;

  // Constructor yang akan dipanggil oleh semua child class
  BaseItem({
    required String imageUrl,
    required String title,
    required String location,
  })  : _imageUrl = imageUrl,
        _title = title,
        _location = location;

  // 2. ENCAPSULATION: Getter publik untuk mengakses data private (read-only)
  String get imageUrl => _imageUrl;
  String get title => _title;
  String get location => _location;

  // 3. POLYMORPHISM: Method abstrak yang WAJIB di-implementasikan
  //    oleh setiap child class. Setiap child akan memberikan "bentuk"
  //    yang berbeda untuk method ini.
  String getCategory();
}