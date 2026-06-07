import 'package:flutter/material.dart';

BottomNavigationBar buildHomePageFooter({
  required int currentIndex,
  required Function(int) onTap,
}) {
  return BottomNavigationBar(
    currentIndex: currentIndex,
    selectedItemColor: Colors.lightBlue,
    unselectedItemColor: Colors.grey,
    onTap: onTap,
    items: const [
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.tab),
        label: 'TabBar',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.person),
        label: 'Profile',
      ),
    ],
  );
}