import 'product.dart';

class ProductDAO {

  List<Product> _products = List.from(Product.defaultProducts);


  List<Product> getAll() => List.unmodifiable(_products);


  void displayAll() {
    print('\n====== DANH SÁCH SẢN PHẨM ======');
    if (_products.isEmpty) {
      print('Danh sách trống!');
    } else {
      for (var p in _products) {
        print(p);
      }
    }
    print('=================================\n');
  }


  // THÊM

  void add(Product product) {
    bool idExists = _products.any((p) => p.id == product.id);
    if (idExists) {
      print(' Lỗi: ID ${product.id} đã tồn tại!');
      return;
    }
    _products.add(product);
    print(' Đã thêm: ${product.name}');
  }


  // SỬA  (dùng copyWith vì thuộc tính là final)

  void edit({
    required int id,
    String? name,
    String? image,
    double? price,
  }) {
    int index = _products.indexWhere((p) => p.id == id);
    if (index == -1) {
      print(' Không tìm thấy sản phẩm ID: $id');
      return;
    }
    _products[index] = _products[index].copyWith(
      name:  name,
      image: image,
      price: price,
    );
    print(' Đã cập nhật: ${_products[index]}');
  }


  // XÓA
  void delete(int id) {
    int index = _products.indexWhere((p) => p.id == id);
    if (index == -1) {
      print(' Không tìm thấy sản phẩm ID: $id');
      return;
    }
    print(' Đã xóa: ${_products[index].name}');
    _products.removeAt(index);
  }


  // TÌM KIẾM

  // Tìm theo ID → trả về 1 sản phẩm hoặc null
  Product? findById(int id) {
    try {
      return _products.firstWhere((p) => p.id == id);
    } catch (_) {
      return null;
    }
  }

  // Tìm theo tên
  List<Product> findByName(String keyword) {
    String kw = keyword.toLowerCase();
    return _products.where((p) => p.name.toLowerCase().contains(kw)).toList();
  }

  // Tìm theo khoảng giá
  List<Product> findByPriceRange(double min, double max) {
    return _products.where((p) => p.price >= min && p.price <= max).toList();
  }


  // SẮP XẾP

  void sortByPriceAsc() {
    _products.sort((a, b) => a.price.compareTo(b.price));
    print('✔ Đã sắp xếp theo giá TĂNG DẦN');
  }

  void sortByPriceDesc() {
    _products.sort((a, b) => b.price.compareTo(a.price));
    print('✔ Đã sắp xếp theo giá GIẢM DẦN');
  }

  void sortByNameAsc() {
    _products.sort((a, b) => a.name.compareTo(b.name));
    print('✔ Đã sắp xếp theo tên A → Z');
  }

  // TĂNG GIÁ 10%  (declarative - dùng map)

  void increasePrice() {
    _products = _products
        .map((p) => p.copyWith(price: p.price * 1.1))
        .toList();
    print('✔ Đã tăng giá tất cả sản phẩm lên 10%');
  }

  // THỐNG KÊ
  int count() => _products.length;

  Product? mostExpensive() => _products.isEmpty
      ? null
      : _products.reduce((a, b) => a.price > b.price ? a : b);

  Product? cheapest() => _products.isEmpty
      ? null
      : _products.reduce((a, b) => a.price < b.price ? a : b);

  double averagePrice() {
    if (_products.isEmpty) return 0;
    return _products.fold(0.0, (sum, p) => sum + p.price) / _products.length;
  }
}