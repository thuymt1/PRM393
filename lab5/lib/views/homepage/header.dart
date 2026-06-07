import 'package:flutter/material.dart';

AppBar buildHomePageHeader(String title) {
  return AppBar(
    title: Text(title),
    centerTitle: true,
    backgroundColor: Colors.lightBlue,
    leading: IconButton(
      onPressed: () {},
      icon: const Icon(Icons.menu),
    ),
    actions: [
      IconButton(
        onPressed: () {},
        icon: const Icon(Icons.search),
      ),
      IconButton(
        onPressed: () {},
        icon: const Icon(Icons.settings),
      ),
    ],
  );
}