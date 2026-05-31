import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget { 
  final String title;
  final String description;

  const MovieCard({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12.0),
      child: ListTile(
        leading: CircleAvatar(
          child: Text(title[0]),
        ),
        title: Text(title),
        subtitle: Text(description),
      ),
    );
  }
}
