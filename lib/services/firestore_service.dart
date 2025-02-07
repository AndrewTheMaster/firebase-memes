import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Добавление мема в Firestore
  Future<void> addMeme(String title, String imageUrl) async {
    await _db.collection('memes').add({
      'title': title,
      'imageUrl': imageUrl,
      'createdAt': FieldValue.serverTimestamp(), // Для сортировки
    });
  }

  // Получение списка мемов
  Stream<QuerySnapshot> getMemes() {
    return _db.collection('memes').orderBy('createdAt', descending: true).snapshots();
  }
}
