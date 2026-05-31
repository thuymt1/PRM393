import 'package:flutter/material.dart';
import '../widgets/movie_card.dart';

class Exercise3 extends StatelessWidget { 
  const Exercise3({super.key});

  final List<Map<String, String>> movies = const [
    {'title': 'Avatar', 'desc': 'Sample description'},
    {'title': 'Inception', 'desc': 'Sample description'},
    {'title': 'Interstellar', 'desc': 'Sample description'},
    {'title': 'Joker', 'desc': 'Sample description'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercise 3 - Layout Demo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 16.0),
              child: Text(
                'Now Playing',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: movies.length,
                itemBuilder: (context, index) {
                  return MovieCard(
                    title: movies[index]['title']!,
                    description: movies[index]['desc']!,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
