// // import 'package:auth/storage/components/avatar.dart';
//
//
// import 'package:flutter/material.dart';
// import 'package:auth/storage/components/avatar.dart';
//
// class Profile extends StatefulWidget {
//   const Profile({super.key});
//
//   @override
//   State<Profile> createState() => _ProfileState();
// }
//
// class _ProfileState extends State<Profile> {
//   String? _imageUrl;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Profile")),
//       body: Center(
//         child: ListView(
//           padding: const EdgeInsets.all(16.0),
//           children: [
//             Avatar(
//               imageUrl: _imageUrl,
//               onUpload: (url) {
//                 setState(() {
//                   _imageUrl = url;
//                 });
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
//
//
//
//
// // import 'package:flutter/material.dart';
// //
// // class Profile extends StatefulWidget {
// //   const Profile({super.key});
// //
// //   @override
// //   State<Profile> createState() => _ProfileState();
// // }
// //
// // class _ProfileState extends State<Profile> {
// //   String? _imageurl;
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: ListView(
// //         children: [
// //           Avatar(imageUrl: _imageurl, onUpload:(imageUrl){
// //             setState(() {
// //               _imageurl=imageUrl;
// //             });
// //           })
// //         ],
// //       ),
// //     );
// //   }
// // }
