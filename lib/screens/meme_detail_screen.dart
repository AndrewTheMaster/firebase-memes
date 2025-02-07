import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MemeDetailScreen extends StatelessWidget {
  final QueryDocumentSnapshot meme;

  MemeDetailScreen({required this.meme});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(meme['title'])),
      body: Center(
        child: Image.network(meme['imageUrl']),
      ),
    );
  }
}
