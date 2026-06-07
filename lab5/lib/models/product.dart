class Product {
  final String id;
  final String name;
  final String image;
  final double price;
  final String description;
  final double rating;

  const Product({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.description,
    required this.rating,
  });

  static const List<Product> products = [
    Product(
      id: "P01",
      name: "Tea Cup Dog",
      image: "assets/images/avatar.png",
      price: 450,
      rating: 4.5,
      description:
      "Đây là sản phẩm Tea Cup Dog dễ thương, phù hợp với người yêu thú cưng.",
    ),
    Product(
      id: "P02",
      name: "iPhone 14",
      image: "assets/images/avatar.png",
      price: 20000,
      rating: 4.8,
      description:
      "iPhone 14 có thiết kế đẹp, hiệu năng ổn định và camera chất lượng.",
    ),
    Product(
      id: "P03",
      name: "iPhone 15",
      image: "assets/images/avatar.png",
      price: 30000,
      rating: 4.9,
      description:
      "iPhone 15 là sản phẩm mới hơn, hiệu năng mạnh và màn hình đẹp.",
    ),
    Product(
      id: "P04",
      name: "Laptop Gaming",
      image: "assets/images/avatar.png",
      price: 50000,
      rating: 4.7,
      description:
      "Laptop gaming hiệu năng cao, phù hợp học tập, làm việc và chơi game.",
    ),
    Product(
      id: "P05",
      name: "Smart Watch",
      image: "assets/images/avatar.png",
      price: 3500,
      rating: 4.3,
      description:
      "Đồng hồ thông minh hỗ trợ theo dõi sức khỏe và thông báo điện thoại.",
    ),
  ];
}