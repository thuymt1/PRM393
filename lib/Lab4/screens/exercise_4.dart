import 'package:flutter/material.dart';

class Exercise4 extends StatefulWidget {
  const Exercise4({super.key});

  @override
  State<Exercise4> createState() => _Exercise4State();
}

class _Exercise4State extends State<Exercise4> {
  bool _isDark = false;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: _isDark ? ThemeData.dark() : ThemeData.light(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Exercise 4 - App Structure & Theme'),
          actions: [
            Row(
              children: [
                const Text('Dark', style: TextStyle(fontSize: 14)),
                Switch(
                  value: _isDark,
                  onChanged: (value) {
                    setState(() {
                      _isDark = value;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(width: 8),
          ],
        ),
        body: const Center(
          child: Text('This is a simple screen with theme toggle.'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}