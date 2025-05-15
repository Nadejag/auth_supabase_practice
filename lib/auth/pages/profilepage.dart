import 'package:flutter/material.dart';
import 'package:auth/storage/components/avatar.dart';
import 'package:auth/main.dart'; // Make sure supabase is initialized here
import '../auth_service.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String? _imageUrl;
  final userId = supabase.auth.currentUser!.id;

  @override
  void initState() {
    super.initState();
    _loadProfileData(); // fetch current avatar_url
  }

  Future<void> _loadProfileData() async {

    final response = await supabase
        .from('profiles')
        .select('avatar_url')
        .eq('id', userId)
        .maybeSingle();

    if (response != null && response['avatar_url'] != null) {
      setState(() {
        _imageUrl = response['avatar_url'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              AuthService().SignOut();
            },
          )
        ],
      ),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            Avatar(
              imageUrl: _imageUrl,
              onUpload: (url) async {

                setState(() {
                  _imageUrl = url;
                });

                await supabase
                    .from('profiles')
                    .update({'avatar_url': url})
                    .eq('id', userId);

              },
            ),
          ],
        ),
      ),
    );
  }
}
//
//
// import 'package:auth/main.dart';
// import 'package:flutter/material.dart';
// import 'package:auth/storage/components/avatar.dart';
//
// import '../auth_service.dart';
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
//   final userId=supabase.auth.currentUser!.id;
//   final data=supabase.from('profiles').select().eq('id', userId).single();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//           title: const Text("Profile",),
//       actions: [
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: InkWell(onTap:(){
//             AuthService().SignOut();
//           },child: Icon(Icons.login)),
//         )
//       ],
//       ),
//       body: Center(
//         child: ListView(
//           padding: const EdgeInsets.all(16.0),
//           children: [
//             Avatar(
//               imageUrl: _imageUrl,
//               onUpload: (url) async{
//                 setState(() {
//                   _imageUrl = url;
//                   _imageUrl=data['avatar_url'];
//                 });
//
//                await supabase.from('profiles').update({'avatar_url': url}).eq('id', userId);
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
