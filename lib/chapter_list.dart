// chapter_list.dart
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'shloka_list.dart';
import 'gita_model.dart';

class ChapterListScreen extends StatefulWidget {
  @override
  _ChapterListScreenState createState() => _ChapterListScreenState();
}

class _ChapterListScreenState extends State<ChapterListScreen> {
  late Future<Gita> gita;

  @override
  void initState() {
    super.initState();
    gita = loadGita();
  }

  Future<Gita> loadGita() async {
    String jsonString = await rootBundle.loadString('assets/gita.json');
    return Gita.fromJson(jsonString);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('अध्याय सूची')),
      body: FutureBuilder<Gita>(
        future: gita,
        builder: (context, snapshot) {
          if (!snapshot.hasData) return Center(child: CircularProgressIndicator());

          return ListView.builder(
            padding: EdgeInsets.all(8),
            itemCount: snapshot.data!.chapters.length,
            itemBuilder: (context, index) {
              return Card(
                margin: EdgeInsets.symmetric(vertical: 8),
                color: Colors.orange.shade200,
                child: ListTile(
                  title: Text(
                    '${snapshot.data!.chapters[index].id}. ${snapshot.data!.chapters[index].name}',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ShlokaListScreen(chapter: snapshot.data!.chapters[index]),
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}