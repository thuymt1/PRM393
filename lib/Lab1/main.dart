import 'dart:io';
import 'product.dart';
import 'productDAO.dart';

void main() {
  final dao = ProductDAO();

  // Demo factory fromJson
  print('\n--- Demo factory fromJson ---');
  final json = {'id': 99, 'name': 'Test JSON', 'image': 'test.png', 'price': 999000};
  final fromJson = Product.fromJson(json);
  print('Tạo từ JSON: $fromJson');
  print('Chuyển lại JSON: ${fromJson.toJson()}');

  // Demo const constructor
  const constProduct = Product.constant(
    id: 100, name: 'Const Product', image: 'const.png', price: 123000,
  );
  print('Const product: $constProduct');

  bool running = true;
  while (running) {
    print('\n========== MENU SẢN PHẨM ==========');
    print('1.  Hiển thị danh sách');
    print('2.  Thêm sản phẩm');
    print('3.  Xóa sản phẩm');
    print('4.  Sửa sản phẩm');
    print('5.  Tìm theo ID');
    print('6.  Tìm theo tên');
    print('7.  Tìm theo khoảng giá');
    print('8.  Sắp xếp theo giá tăng dần');
    print('9.  Sắp xếp theo giá giảm dần');
    print('10. Sắp xếp theo tên A→Z');
    print('11. Tăng giá tất cả 10%');
    print('12. Thống kê');
    print('0.  Thoát');
    print('====================================');
    stdout.write('Chọn chức năng: ');

    int choice = int.tryParse(stdin.readLineSync() ?? '') ?? -1;

    switch (choice) {
      case 1:
        dao.displayAll();
        break;

      case 2:
        stdout.write('Nhập ID: ');
        int id = int.tryParse(stdin.readLineSync() ?? '') ?? 0;
        stdout.write('Nhập tên: ');
        String name = stdin.readLineSync() ?? '';
        stdout.write('Nhập image: ');
        String image = stdin.readLineSync() ?? '';
        stdout.write('Nhập giá: ');
        double price = double.tryParse(stdin.readLineSync() ?? '') ?? 0;
        dao.add(Product(id: id, name: name, image: image, price: price));
        break;

      case 3:
        stdout.write('Nhập ID cần xóa: ');
        int id = int.tryParse(stdin.readLineSync() ?? '') ?? -1;
        dao.delete(id);
        break;

      case 4:
        stdout.write('Nhập ID cần sửa: ');
        int id = int.tryParse(stdin.readLineSync() ?? '') ?? -1;
        stdout.write('Tên mới (Enter bỏ qua): ');
        String? name = stdin.readLineSync();
        stdout.write('Image mới (Enter bỏ qua): ');
        String? image = stdin.readLineSync();
        stdout.write('Giá mới (Enter bỏ qua): ');
        double? price = double.tryParse(stdin.readLineSync() ?? '');
        dao.edit(
          id:    id,
          name:  (name?.isEmpty  ?? true) ? null : name,
          image: (image?.isEmpty ?? true) ? null : image,
          price: price,
        );
        break;

      case 5:
        stdout.write('Nhập ID cần tìm: ');
        int id = int.tryParse(stdin.readLineSync() ?? '') ?? -1;
        Product? found = dao.findById(id);
        print(found != null ? ' $found' : ' Không tìm thấy!');
        break;

      case 6:
        stdout.write('Nhập tên cần tìm: ');
        String keyword = stdin.readLineSync() ?? '';
        List<Product> byName = dao.findByName(keyword);
        if (byName.isEmpty) {
          print(' Không tìm thấy!');
        } else {
          byName.forEach(print);
        }
        break;

      case 7:
        stdout.write('Giá tối thiểu: ');
        double min = double.tryParse(stdin.readLineSync() ?? '') ?? 0;
        stdout.write('Giá tối đa: ');
        double max = double.tryParse(stdin.readLineSync() ?? '') ?? 0;
        List<Product> byPrice = dao.findByPriceRange(min, max);
        if (byPrice.isEmpty) {
          print(' Không có sản phẩm trong khoảng giá này!');
        } else {
          byPrice.forEach(print);
        }
        break;

      case 8:
        dao.sortByPriceAsc();
        dao.displayAll();
        break;

      case 9:
        dao.sortByPriceDesc();
        dao.displayAll();
        break;

      case 10:
        dao.sortByNameAsc();
        dao.displayAll();
        break;

      case 11:
        dao.increasePrice();
        dao.displayAll();
        break;

      case 12:
        print('\n===== THỐNG KÊ =====');
        print('Tổng số sản phẩm : ${dao.count()}');
        print('Đắt nhất          : ${dao.mostExpensive()}');
        print('Rẻ nhất           : ${dao.cheapest()}');
        print('Giá trung bình    : ${dao.averagePrice().toStringAsFixed(0)}');
        break;

      case 0:
        print('Thoát chương trình. Tạm biệt!');
        running = false;
        break;

      default:
        print(' Lựa chọn không hợp lệ!');
    }
  }
}