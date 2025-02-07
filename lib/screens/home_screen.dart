// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'meme_detail_screen.dart';
//

//
//
// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Meme Gallery')),
//       body: StreamBuilder<QuerySnapshot>(
//         stream: FirebaseFirestore.instance.collection('memes').snapshots(),
//         builder: (context, snapshot) {
//           if (!snapshot.hasData) return const Center(child: CircularProgressIndicator());
//
//           var memes = snapshot.data!.docs;
//           return ListView.builder(
//             itemCount: memes.length,
//             itemBuilder: (context, index) {
//               var meme = memes[index];
//               return ListTile(
//                 leading: CachedNetworkImage(imageUrl: meme['url'], width: 50, height: 50, fit: BoxFit.cover),
//                 title: Text(meme['title']),
//                 onTap: () {
//                   Navigator.push(context, MaterialPageRoute(
//                     builder: (context) => MemeDetailScreen(title: meme['title'], imageUrl: meme['url']),
//                   ));
//                 },
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }
