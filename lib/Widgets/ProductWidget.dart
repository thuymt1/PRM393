import 'package:flutter/material.dart';

class ProductWidget extends StatelessWidget {
  const ProductWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        width: double.infinity,
        height: 500,

        child: Column(
          children: [
            //Product Image
            Expanded(
              flex: 7,
              child: Container(
                width: double.infinity,
                height: 300,
                child: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 300,
                      child:
                      Image.asset('assets/images/hinhanh.jpg', fit: BoxFit.fill),
                    ),
                    Align(
                      alignment: AlignmentGeometry.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: FloatingActionButton.extended(
                          onPressed: () {},
                          label: Text("Add to cart"),
                          icon: Icon(Icons.shopping_cart),
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),
            //Product name, price, like
            Expanded(
              flex: 2,
              child: Row(
                //crossAxisAlignment: CrossAxisAlignment.start
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 8,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Product Name: Tea cup dog"),
                        Text("Price: 450\$"),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Icon(
                      Icons.star,
                      color: Colors.yellow,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Expanded(flex: 1, child: Text("41")),
                ],
              ),
            ),
            //List Icons
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  for (int i = 1; i <= 5; i++)
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                      fontWeight: FontWeight.bold,
                    ),
                ],
              ),
            ),
            SizedBox(height: 10),
            //Product Description
            Expanded(
              flex: 3,
              child: SingleChildScrollView(
                child: Text(
                  "Theo ghi nhận của phóng viên Dân trí, dự án được xây dựng trên một khu đất với nhiều hộ dân sinh sống bên trong, ở giữa khu đất là một khu nghĩa trang với hàng trăm ngôi mộ. Phần lớn diện tích khu vực này hiện vẫn còn bị bao phủ bởi đầm lầy, cỏ cây, bụi rậm, khá hoang sơ.",
                  textAlign: TextAlign.justify,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}