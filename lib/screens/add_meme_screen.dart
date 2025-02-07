import 'package:flutter/material.dart';
import '../services/firestore_service.dart';

class AddMemeScreen extends StatefulWidget {
  @override
  _AddMemeScreenState createState() => _AddMemeScreenState();
}

class _AddMemeScreenState extends State<AddMemeScreen> {
  final _titleController = TextEditingController();
  final _imageUrlController = TextEditingController();
  final FirestoreService _firestoreService = FirestoreService();

  void _addMeme() async {
    if (_titleController.text.isEmpty || _imageUrlController.text.isEmpty) {
      return;
    }
    await _firestoreService.addMeme(_titleController.text, _imageUrlController.text);
    Navigator.pop(context); // Закрываем экран после добавления
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Добавить мем")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: "Название мема"),
            ),
            TextField(
              controller: _imageUrlController,
              decoration: InputDecoration(labelText: "Ссылка на изображение"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _addMeme,
              child: Text("Добавить"),
            ),
          ],
        ),
      ),
    );
  }
}
