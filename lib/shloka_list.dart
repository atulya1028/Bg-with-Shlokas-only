// shloka_list.dart
import 'package:flutter/material.dart';
import 'gita_model.dart';

class ShlokaListScreen extends StatelessWidget {
  final Chapter chapter;

  ShlokaListScreen({required this.chapter});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${chapter.id}. ${chapter.name}')),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: chapter.slokas.length,
        itemBuilder: (context, index) {
          final shloka = chapter.slokas[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8),
            color: Colors.orange.shade100,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    shloka.sanskrit,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
