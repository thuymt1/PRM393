import 'package:flutter/material.dart';
import 'body.dart';
import 'footer.dart';
import 'header.dart';
import '../pages/tabbar_page.dart';
import '../pages/profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  final List<Widget> pages = const [
    HomePageBody(),
    TabbarPage(),
    ProfilePage(),
  ];

  final List<String> titles = const [
    "Product List",
    "TabBar Page",
    "Profile Page",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildHomePageHeader(titles[selectedIndex]),
      body: pages[selectedIndex],
      bottomNavigationBar: buildHomePageFooter(
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
    );
  }
}