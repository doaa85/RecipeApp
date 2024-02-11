import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:overlay_kit/overlay_kit.dart';
import 'package:recipe_app/provider/app_auth.provider.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  var nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: Column(
        children: [
          ElevatedButton(
              onPressed: () async {
                OverlayLoadingProgress.start();

                var imageResult = await FilePicker.platform
                    .pickFiles(type: FileType.image, withData: true);

                var refresnce = FirebaseStorage.instance
                    .ref('reciepes/${imageResult?.files.first.name}');

                if (imageResult?.files.first.bytes != null) {
                  var uploadResult = await refresnce.putData(
                      imageResult!.files.first.bytes!,
                      SettableMetadata(contentType: 'image/png'));

                  if (uploadResult.state == TaskState.success) {
                    print(
                        '?????image upload successfully ${await refresnce.getDownloadURL()}');
                  }
                }

                OverlayLoadingProgress.stop();
              },
              child: const Text('upload image')),
          TextFormField(
            onChanged: (value) =>
                FirebaseAuth.instance.currentUser?.updateDisplayName(value),
            style: TextStyle(color: Colors.black),
            controller: AppAuthProvider().nameController,
            decoration: const InputDecoration(
                border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)),
                fillColor: Colors.transparent,
                filled: true,
                hintStyle: TextStyle(color: Colors.black),
                hintText: 'name',
                prefixIcon: Icon(
                  Icons.document_scanner,
                  color: Colors.white,
                )),
          )
        ],
      )),
    );
  }
}
