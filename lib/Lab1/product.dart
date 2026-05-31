class Product {
  final int id;
  final String name;
  final String image;
  final double price;

  Product({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
  });

  // Phương thức khởi tạo const
  const Product.constant({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
  });

  //Factory: map JSON → Product
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id:    json['id']    as int,
      name:  json['name']  as String,
      image: json['image'] as String,
      price: (json['price'] as num).toDouble(),
    );
  }

  // Chuyển Product → JSON
  Map<String, dynamic> toJson() {
    return {
      'id':    id,
      'name':  name,
      'image': image,
      'price': price,
    };
  }

  // copyWith:
  Product copyWith({
    int?    id,
    String? name,
    String? image,
    double? price,
  }) {
    return Product(
      id:    id    ?? this.id,
      name:  name  ?? this.name,
      image: image ?? this.image,
      price: price ?? this.price,
    );
  }

  @override
  String toString() {
    return 'Product { id: $id, name: $name, image: $image, price: ${price.toStringAsFixed(0)} }';
  }

  // Danh sách tĩnh mặc định
  static List<Product> defaultProducts = [
    Product(id: 1, name: 'iPhone 15',          image: 'iphone15.png',    price: 100000),
    Product(id: 2, name: 'Samsung Galaxy S24',  image: 'samsung_s24.png', price: 200000),
    Product(id: 3, name: 'MacBook Air M3',      image: 'macbook_m3.png',  price: 300000),
    Product(id: 4, name: 'iPad Pro',            image: 'ipad_pro.png',    price: 400000),
    Product(id: 5, name: 'AirPods Pro',         image: 'airpods.png',     price: 500000),
  ];
}