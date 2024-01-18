import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/pages/home_page.pages.dart';
import 'package:recipe_app/pages/register_page.pages.dart';

class AppAuthProvider extends ChangeNotifier {
  TextEditingController? emailController;
  TextEditingController? passwordController;
  TextEditingController? nameController;
  bool? obsecureText;
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
    providerDispose();
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => const RegisterPage()));
  }

  void toggleObsecure() {
    obsecureText = !obsecureText!;
    notifyListeners();
  }

  Future<void> signUp(BuildContext context) async {
    try {
      if (formKey?.currentState?.validate() ?? false) {
        var credintials = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: emailController!.text,
                password: passwordController!.text);
        if (credintials.user != null) {
          await credintials.user?.updateDisplayName(nameController!.text);
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (_) => HomePage()));
        }
      }
    } catch (e) {}
  }
}
