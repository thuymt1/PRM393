import 'package:flutter/material.dart';
import 'views/homepage/home_page.dart';
import 'views/pages/product_detail_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      initialRoute: '/',

      routes: {
        '/': (context) => const HomePage(),
        '/detail': (context) => const ProductDetailPage(),
      },
    );
  }
}