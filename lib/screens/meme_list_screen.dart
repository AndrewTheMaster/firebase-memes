import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../services/firestore_service.dart';
import 'add_meme_screen.dart';
import 'meme_detail_screen.dart';

class MemeListScreen extends StatelessWidget {
  final FirestoreService _firestoreService = FirestoreService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Memes")),
      body: StreamBuilder<QuerySnapshot>(
        stream: _firestoreService.getMemes(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          var memes = snapshot.data!.docs;

          return ListView.builder(
            itemCount: memes.length,
            itemBuilder: (context, index) {
              var meme = memes[index];
              return ListTile(
                leading: Image.network(meme['imageUrl'], width: 50, height: 50, fit: BoxFit.cover),
                title: Text(meme['title']),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MemeDetailScreen(meme: meme)),
                  );
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AddMemeScreen()),
        ),
        child: Icon(Icons.add),
      ),
    );
  }
}
