import 'package:flutter/material.dart';
import '../../models/product.dart';

class HomePageBody extends StatelessWidget {
  const HomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    final products = Product.products;

    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        return buildProductItem(context, products[index]);
      },
    );
  }
}

Widget buildProductItem(BuildContext context, Product product) {
  return Padding(
    padding: const EdgeInsets.all(10),
    child: InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/detail',
          arguments: product,
        );
      },
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(width: 2, color: Colors.red),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            // Product Image
            SizedBox(
              width: double.infinity,
              height: 300,
              child: Stack(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 300,
                    child: Image.asset(
                      product.image,
                      fit: BoxFit.fill,
                    ),
                  ),

                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: SizedBox(
                        height: 40,
                        child: FloatingActionButton.extended(
                          heroTag: "cart_${product.id}",
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  "Đã thêm ${product.name} vào giỏ hàng",
                                ),
                              ),
                            );
                          },
                          label: const Text(
                            "Add to cart",
                            style: TextStyle(fontSize: 12),
                          ),
                          icon: const Icon(
                            Icons.shopping_cart,
                            size: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),

            // Product name, price, like
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Product Name: ${product.name}"),
                    Text("Price: ${product.price.toStringAsFixed(0)}\$"),
                  ],
                ),

                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      color: Colors.yellow,
                    ),
                    const SizedBox(width: 5),
                    Text(product.rating.toString()),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 10),

            // List Icons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                for (int i = 1; i <= 5; i++)
                  const Icon(
                    Icons.star,
                    color: Colors.yellow,
                  ),
              ],
            ),

            const SizedBox(height: 20),

            // Product Description
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                product.description,
                textAlign: TextAlign.justify,
              ),
            ),

            TextButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/detail',
                  arguments: product,
                );
              },
              child: const Text("View Detail"),
            ),
          ],
        ),
      ),
    ),
  );
}