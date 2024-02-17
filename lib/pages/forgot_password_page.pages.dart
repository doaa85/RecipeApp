import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:overlay_kit/overlay_kit.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/provider/app_auth.provider.dart';
import 'package:recipe_app/utilities/toast_messege_status.utils.dart';
import 'package:recipe_app/widgets/toast_messege_widget.widgets.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final emailController = TextEditingController();
  GlobalKey<FormState>? formKey;
  @override
  void initState() {
    Provider.of<AppAuthProvider>(context, listen: false).providerInit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Reset Password')),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Consumer<AppAuthProvider>(
          builder: (context, authProvider, _) => Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: authProvider.emailController,
                  style: const TextStyle(color: Colors.black),
                  decoration: const InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue)),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue)),
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue)),
                      fillColor: Colors.transparent,
                      filled: true,
                      hintStyle: TextStyle(color: Colors.black),
                      hintText: 'email',
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.white,
                      )),
                  validator: (value) {
                    if (value == null || (value?.isEmpty ?? false)) {
                      return 'Email Is Required';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                // TextFormField(
                //   obscureText: authProvider.obsecureText,
                //   style: const TextStyle(color: Colors.blue),
                //   controller: authProvider.passwordController,
                //   decoration: InputDecoration(
                //       suffixIcon: InkWell(
                //         onTap: () => authProvider.toggleObsecure(),
                //         child: authProvider.obsecureText
                //             ? const Icon(
                //                 Icons.visibility_off,
                //                 color: Colors.black,
                //               )
                //             : const Icon(
                //                 Icons.visibility,
                //                 color: Colors.black,
                //               ),
                //       ),
                //       focusedBorder: const UnderlineInputBorder(
                //           borderSide: BorderSide(color: Colors.blue)),
                //       enabledBorder: const UnderlineInputBorder(
                //           borderSide: BorderSide(color: Colors.blue)),
                //       border: const UnderlineInputBorder(
                //           borderSide: BorderSide(color: Colors.white)),
                //       fillColor: Colors.transparent,
                //       filled: true,
                //       hintStyle: const TextStyle(color: Colors.black),
                //       hintText: 'password',
                //       prefixIcon: const Icon(
                //         Icons.password,
                //         color: Colors.black,
                //       )),
                //   validator: (value) {
                //     if (value == null || (value?.isEmpty ?? false)) {
                //       return 'Password Is Required';
                //     }
                //     return null;
                //   },
                // ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white30,
                        minimumSize: const Size.fromHeight(50)),
                    onPressed: () {
                      // resetPassword();
                      resetPassword(emailController.text);
                    },
                    icon: const Icon(Icons.email_outlined),
                    label: const Text(
                      'Reset password',
                      style: TextStyle(fontSize: 24),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future resetPassword1() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(
              child: CircularProgressIndicator(),
            ));
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailController.text.trim());
      OverlayLoadingProgress.stop();
      OverlayToastMessage.show(textMessage: 'Password Reset Email Sent');
      Navigator.popUntil(context, (route) => route.isFirst);
    } on FirebaseAuthException catch (e) {
      print(e);
      OverlayToastMessage.show(textMessage: e.message);
      Navigator.of(context).pop();
    }
  }

  Future<void> resetPassword(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      OverlayToastMessage.show(
        widget: const ToastMessageWidget(
          message: 'Password reset email sent. Check your email inbox.',
          toastMessageStatus: ToastMessageStatus.success,
        ),
      );
    } catch (e) {
      OverlayToastMessage.show(
        widget: const ToastMessageWidget(
          message: 'Failed to send password reset email. Please try again.',
          toastMessageStatus: ToastMessageStatus.failed,
        ),
      );
    }
  }
}
