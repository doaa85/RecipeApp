import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:overlay_kit/overlay_kit.dart';
import 'package:recipe_app/pages/home_page.pages.dart';
import 'package:recipe_app/pages/login_page.pages.dart';
import 'package:recipe_app/pages/register_page.pages.dart';
import 'package:recipe_app/utilities/toast_messege_status.utils.dart';
import 'package:recipe_app/widgets/toast_messege_widget.widgets.dart';

class AppAuthProvider extends ChangeNotifier {
  TextEditingController? emailController;
  TextEditingController? passwordController;
  TextEditingController? nameController;
  bool obsecureText = true;
  bool isFavourite = false;
  GlobalKey<FormState>? formKey;
  void providerInit() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    nameController = TextEditingController();
    formKey = GlobalKey<FormState>();
  }

  void providerDispose() {
    emailController = null;
    passwordController = null;
    nameController = null;
    formKey = null;
    obsecureText = false;
  }

  void openRegisterPage(BuildContext context) {
    // providerDispose();
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => const RegisterPage()));
  }

  void toggleObsecure() {
    obsecureText = !obsecureText;
    notifyListeners();
  }

  void toggleIconColor() {
    isFavourite = !isFavourite;
    notifyListeners();
  }

  void openLoginPage(BuildContext context) {
    // providerDispose();
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (_) => const LoginPage()));
  }

  Future<void> logIn(BuildContext context) async {
    try {
      if (formKey?.currentState?.validate() ?? false) {
        OverlayLoadingProgress.start();
        var credentials = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
                email: emailController!.text,
                password: passwordController!.text);

        if (credentials.user != null) {
          OverlayLoadingProgress.stop();
          // providerDispose();
          OverlayToastMessage.show(
            widget: const ToastMessageWidget(
              message: 'You Login Successully',
              toastMessageStatus: ToastMessageStatus.success,
            ),
          );

          if (context.mounted) {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (_) => HomePage()));
          }
        }
        OverlayLoadingProgress.stop();
      }
    } on FirebaseAuthException catch (e) {
      OverlayLoadingProgress.stop();

      if (e.code == 'user-not-found') {
        OverlayToastMessage.show(
          widget: const ToastMessageWidget(
            message: 'user not found',
            toastMessageStatus: ToastMessageStatus.failed,
          ),
        );
      } else if (e.code == 'wrong-password') {
        OverlayToastMessage.show(
            widget: const ToastMessageWidget(
          message: 'Wrong password provided for that user.',
          toastMessageStatus: ToastMessageStatus.failed,
        ));
      } else if (e.code == "user-disabled") {
        OverlayToastMessage.show(
            widget: const ToastMessageWidget(
          message: 'This email Account was disabled',
          toastMessageStatus: ToastMessageStatus.failed,
        ));
      } else if (e.code == "invalid-credential") {
        OverlayToastMessage.show(
            widget: const ToastMessageWidget(
          message: 'invalid-credential',
          toastMessageStatus: ToastMessageStatus.failed,
        ));
      }
    } catch (e) {
      OverlayLoadingProgress.stop();
      OverlayToastMessage.show(textMessage: 'General Error $e');
    }
  }

  Future<void> signUp(BuildContext context) async {
    try {
      if (formKey?.currentState?.validate() ?? false) {
        OverlayLoadingProgress.start();
        var credentials = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: emailController!.text,
                password: passwordController!.text);

        if (credentials.user != null) {
          await credentials.user?.updateDisplayName(nameController!.text);
          FirebaseAuth.instance.currentUser?.updatePhotoURL(
              'https://firebasestorage.googleapis.com/v0/b/recipe-app-6d083.appspot.com/o/reciepes%2FIMG_%D9%A2%D9%A0%D9%A2%D9%A3%D9%A0%D9%A6%D9%A2%D9%A3_%D9%A2%D9%A3%D9%A0%D9%A7%D9%A3%D9%A4.jpg?alt=media&token=c0478655-9e3d-44c1-878d-f48fc2b6dec2');
          OverlayLoadingProgress.stop();
          // providerDispose();

          if (context.mounted) {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (_) => HomePage()));
          }
        }
        OverlayLoadingProgress.stop();
      }
    } catch (e) {
      OverlayLoadingProgress.stop();
    }
  }

  void signOut(BuildContext context) async {
    OverlayLoadingProgress.start();
    await Future.delayed(const Duration(seconds: 1));
    await FirebaseAuth.instance.signOut();

    if (context.mounted) {
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (_) => LoginPage()), (route) => false);
    }
    OverlayLoadingProgress.stop();
  }

  Future<void> updateUserProfile(String value) async {
    try {
      if (formKey?.currentState?.validate() ?? false) {
        OverlayLoadingProgress.start();
        var credentials = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: emailController!.text,
                password: passwordController!.text);

        if (credentials.user != null) {
          await credentials.user?.updateDisplayName(nameController!.text);
          FirebaseAuth.instance.currentUser?.updatePhotoURL(
              'https://firebasestorage.googleapis.com/v0/b/recipe-app-6d083.appspot.com/o/reciepes%2FIMG_%D9%A2%D9%A0%D9%A2%D9%A3%D9%A0%D9%A6%D9%A2%D9%A3_%D9%A2%D9%A3%D9%A0%D9%A7%D9%A3%D9%A4.jpg?alt=media&token=c0478655-9e3d-44c1-878d-f48fc2b6dec2');
          OverlayLoadingProgress.stop();
          // providerDispose();

          // if (context.mounted) {
          //   Navigator.pushReplacement(
          //       context, MaterialPageRoute(builder: (_) => SettingsPage()));
          // }
        }
        OverlayLoadingProgress.stop();
      }
    } catch (e) {
      OverlayLoadingProgress.stop();
    }
  }
   Future<void> updateUserName(BuildContext context, String newName) async {
    try {
      OverlayLoadingProgress.start();
      User? currentUser = FirebaseAuth.instance.currentUser;
      await currentUser?.updateDisplayName(newName);
      OverlayLoadingProgress.stop();
      OverlayToastMessage.show(
        widget: const ToastMessageWidget(
          message: 'Your name has been updated successfully',
          toastMessageStatus: ToastMessageStatus.success,
        ),
      );
    } catch (e) {
      OverlayLoadingProgress.stop();
      OverlayToastMessage.show(
        widget: const ToastMessageWidget(
          message: 'Failed to update name. Please try again.',
          toastMessageStatus: ToastMessageStatus.failed,
        ),
      );
    }
  }
  Future<void> updateUserImage(BuildContext context) async {
    try {
      OverlayLoadingProgress.start();
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.image,
        allowMultiple: false,
      );

      if (result != null && result.files.isNotEmpty) {
        File file = File(result.files.single.path!);
        User? currentUser = FirebaseAuth.instance.currentUser;

        Reference ref = FirebaseStorage.instance
            .ref()
            .child('profile_images/${currentUser?.uid}.jpg');

        UploadTask uploadTask = ref.putFile(file);
        TaskSnapshot snapshot = await uploadTask.whenComplete(() => null);

        if (snapshot.state == TaskState.success) {
          String imageUrl = await ref.getDownloadURL();
          await currentUser?.updatePhotoURL(imageUrl);
          OverlayLoadingProgress.stop();
          OverlayToastMessage.show(
            widget: const ToastMessageWidget(
              message: ' image has been updated successfully',
              toastMessageStatus: ToastMessageStatus.success,
            ),
          );
        } else {
          throw Exception('Failed to upload image');
        }
      } else {
        OverlayLoadingProgress.stop();
        OverlayToastMessage.show(
          widget: const ToastMessageWidget(
            message: 'No image selected',
            toastMessageStatus: ToastMessageStatus.failed,
          ),
        );
      }
    } catch (e) {
      print('Error updating profile image: $e');
      OverlayLoadingProgress.stop();
      OverlayToastMessage.show(
        widget: const ToastMessageWidget(
          message: 'Failed to update profile image. Please try again.',
          toastMessageStatus: ToastMessageStatus.failed,
        ),
      );
    }
  }
}
