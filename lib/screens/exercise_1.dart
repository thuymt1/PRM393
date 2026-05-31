import 'package:flutter/material.dart';

class Exercise1 extends StatelessWidget { // Đã đổi tên class thành Exercise1
  const Exercise1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Exercise 1 - Core Widgets')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Welcome to Flutter UI',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            const Icon(Icons.movie, size: 80, color: Colors.blue),
            const SizedBox(height: 24),
            Image.network(
              'https://picsum.photos/400/200',
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 24),
            const Card(
              elevation: 4,
              child: ListTile(
                leading: Icon(Icons.star, color: Colors.grey),
                title: Text('Movie Item'),
                subtitle: Text('This is a sample ListTile inside a Card.'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}