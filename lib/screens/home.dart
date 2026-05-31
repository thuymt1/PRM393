import 'package:flutter/material.dart';
import 'exercise_1.dart';
import 'exercise_2.dart';
import 'exercise_3.dart';
import 'exercise_4.dart';
import 'exercise_5.dart';

class Home extends StatelessWidget { // <--- class Home ở đây nè
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lab 4 - Main Menu'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          ElevatedButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Exercise1()),
            ),
            child: const Text('Exercise 1 - Core Widgets'),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Exercise2()),
            ),
            child: const Text('Exercise 2 - Input Controls'),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Exercise3()),
            ),
            child: const Text('Exercise 3 - Layout Demo'),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Exercise4()),
            ),
            child: const Text('Exercise 4 - App Structure & Theme'),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Exercise5()),
            ),
            child: const Text('Exercise 5 - Common UI Fixes'),
          ),
        ],
      ),
    );
  }
}