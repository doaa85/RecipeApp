import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/provider/app_auth.provider.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({
    super.key,
  });

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  var nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<AppAuthProvider>(
        builder: ((context, authProvider, child) => Scaffold(
              appBar: AppBar(
                title: Text('Edit Profile'),
              ),
              body: Center(
                  child: Form(
                key: authProvider.formKey,
                child: Column(
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          Provider.of<AppAuthProvider>(context, listen: false)
                              .updateUserImage(context);
                        }

                        //  () async {
                        //   OverlayLoadingProgress.start();

                        //   var imageResult = await FilePicker.platform
                        //       .pickFiles(type: FileType.image, withData: true);

                        //   var refresnce = FirebaseStorage.instance
                        //       .ref('reciepes/${imageResult?.files.first.name}');

                        //   if (imageResult?.files.first.bytes != null) {
                        //     var uploadResult = await refresnce.putData(
                        //         imageResult!.files.first.bytes!,
                        //         SettableMetadata(contentType: 'image/png'));

                        //     if (uploadResult.state == TaskState.success) {
                        //       print(
                        //           '?????image upload successfully ${await refresnce.getDownloadURL()}');
                        //     }
                        //   }

                        //   OverlayLoadingProgress.stop();
                        // },
                        ,
                        child: const Text('upload image')),
                    const SizedBox(
                      height: 20,
                    ),
                    TextField(
                      controller: authProvider.nameController,
                      onChanged: (value) {
                        String value = nameController.text;

                        print(value);
                        nameController.clear();
                      },
                      style: TextStyle(color: Colors.black),
                      decoration: const InputDecoration(
                          border: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          fillColor: Colors.transparent,
                          filled: true,
                          hintStyle: TextStyle(color: Colors.black),
                          hintText: 'Enter name',
                          prefixIcon: Icon(
                            Icons.document_scanner,
                            color: Colors.white,
                          )),
                    ),
                    const SizedBox(
                      height: 80,
                    ),
                    TextButton(
                        onPressed: () {
                          Provider.of<AppAuthProvider>(context, listen: false)
                              .updateUserName(context, nameController.text);
                          Navigator.of(context).pop();
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'Edit',
                                style:
                                    TextStyle(fontSize: 24, color: Colors.blue),
                              ),
                            ],
                          ),
                        ))
                  ],
                ),
              )),
            )));
  }
}
