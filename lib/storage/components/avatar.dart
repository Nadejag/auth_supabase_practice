// import 'package:auth/main.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../main.dart'; // Assuming supabase is initialized here

class Avatar extends StatefulWidget {
  final String? imageUrl;
  final void Function(String imageUrl) onUpload;

  const Avatar({super.key, required this.imageUrl, required this.onUpload});

  @override
  State<Avatar> createState() => _AvatarState();
}

class _AvatarState extends State<Avatar> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 150,
          height: 150,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(75),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(75),
              child: widget.imageUrl != null
                  ? Image.network(widget.imageUrl!, fit: BoxFit.cover)
                  : const Center(child: Text("No Image")),
            ),
          ),
        ),
        const SizedBox(height: 12),
        ElevatedButton(
          onPressed: () async {
            final ImagePicker picker = ImagePicker();
            final XFile? image =
            await picker.pickImage(source: ImageSource.gallery);

            if (image == null) return;

            final bytes = await image.readAsBytes();
            final userId = supabase.auth.currentUser?.id;

            if (userId == null) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("User not logged in")),
              );
              return;
            }

            final imageExt = image.path.split('.').last.toLowerCase();
            final imagePath = '$userId/profiles/avatar.$imageExt';

            try {
              await supabase.storage.from('profiles').uploadBinary(
                imagePath,
                bytes,
                fileOptions: FileOptions(
                  upsert: true,
                  contentType: "image/$imageExt",
                ),
              );

              String imageUrl =
              supabase.storage.from('profiles').getPublicUrl(imagePath);

              // Add timestamp to bust cache
              imageUrl = Uri.parse(imageUrl).replace(queryParameters: {
                't': DateTime.now().millisecondsSinceEpoch.toString()
              }).toString();

              widget.onUpload(imageUrl);
            } catch (e) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Upload failed: $e')),
              );
            }
          },
          child: const Text("Upload"),
        )
      ],
    );
  }
}





// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';
//
// class Avatar extends StatefulWidget {
//   final String? imageUrl;
//   final void Function(String imageUrl) onUpload;
//   const Avatar({super.key, required this.imageUrl, required this.onUpload});
//
//   @override
//   State<Avatar> createState() => _AvatarState();
// }
//
// class _AvatarState extends State<Avatar> {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         SizedBox(
//           width: 150,
//           height: 150,
//           child: Container(
//             color: Colors.grey,
//             child:widget.imageUrl !=null? Image.network(widget.imageUrl!,fit: BoxFit.cover,) : Center(
//               child: Text("NO Image"),
//             ),
//           ),
//         ),
//         ElevatedButton(
//           onPressed: ()async{
//             final ImagePicker picker = ImagePicker();
// // Pick an image.
//             final XFile? image = await picker.pickImage(source: ImageSource.gallery);
//             if(image==null){
//               return;
//             }
//             final imagebytes=await image.readAsBytes();
//             final userId=supabase.auth.currentUser!.id;
//             final imagepath='/$userId/profiles';
//            await supabase.storage.from('profiles').uploadBinary(imagepath, imagebytes);
//            final imageUrl=supabase.storage.from('profiles').getPublicUrl(imagepath);
//            widget.onUpload(imageUrl);
//           },
//           child: Text("Upload"),
//         )
//       ],
//     );
//   }
// }
