import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screens/meme_list_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meme Gallery',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MemeListScreen(),
    );
  }
}
