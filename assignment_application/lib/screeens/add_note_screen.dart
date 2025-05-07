import 'package:flutter/material.dart';
import '../db/notes_database.dart';
import '../models/note.dart';

class AddNoteScreen extends StatefulWidget {
  @override
  _AddNoteScreenState createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();

  void saveNote() async {
    final title = _titleController.text;
    final content = _contentController.text;
    if (title.isNotEmpty && content.isNotEmpty) {
      final newNote = Note(title: title, content: content);
      await NotesDatabase.instance.create(newNote);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ノート追加')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: _titleController, decoration: InputDecoration(labelText: 'タイトル')),
            TextField(controller: _contentController, decoration: InputDecoration(labelText: '内容')),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: saveNote,
              child: Text('保存'),
            ),
          ],
        ),
      ),
    );
  }
}
