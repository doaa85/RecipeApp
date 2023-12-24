import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/pages/home_page.pages.dart';
import 'package:recipe_app/pages/register_page.pages.dart';
import 'package:recipe_app/services/preferences.services.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late GlobalKey<FormState> formkey;
  bool obsecureText = true;
  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    formkey = GlobalKey<FormState>();
  }

  void toggleObsecure() {
    obsecureText = !obsecureText;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/Mask Group 9.png'),
              fit: BoxFit.cover)),
      child: Expanded(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
              child: Container(
                width: 180,
                height: 100,
                child: const Image(
                  image: AssetImage('assets/images/Logo (2).png'),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              'Sign in',
              style: TextStyle(color: Colors.white),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
              child: Form(
                  key: formkey,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextFormField(
                          style: TextStyle(color: Colors.white),
                          keyboardType: TextInputType.emailAddress,
                          controller: emailController,
                          decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              label: Text(
                                'Email',
                                style: TextStyle(color: Colors.white),
                              ),
                              suffixIcon: Icon(
                                Icons.email,
                                color: Colors.white,
                              ),
                              prefixIcon: Icon(
                                Icons.email_outlined,
                                color: Colors.white60,
                              )),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Email is required';
                            }
                            if (!EmailValidator.validate(value)) {
                              return 'Not Valid Email';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                            style: TextStyle(color: Colors.white),
                            obscureText: obsecureText,
                            controller: passwordController,
                            decoration: InputDecoration(
                                fillColor: Colors.orange,
                                label: const Text(
                                  'Passwoord',
                                  style: TextStyle(color: Colors.white),
                                ),
                                suffixIcon: InkWell(
                                  onTap: () {
                                    toggleObsecure();
                                  },
                                  child: Icon(
                                    obsecureText
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    color: Colors.white,
                                  ),
                                ),
                                prefixIcon: const Icon(
                                  Icons.lock_outline,
                                  color: Colors.white60,
                                )),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'password is required';
                              }

                              if (value.length < 6) {
                                return 'password too short';
                              }
                              return null;
                            }),
                        const SizedBox(height: 10),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'Forgot Password ?',
                              style: TextStyle(color: Colors.blueAccent),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orange,
                              fixedSize: const Size(450, 50)),
                          onPressed: () async {
                            if (formkey.currentState?.validate() ?? false) {
                              await PreferencesServices.prefs
                                  ?.setBool('islogin', true);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => HomePage(),
                                  ));
                            }
                          },
                          child: const Text('Sign in'),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 220, 0, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'dont have account? ',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => RegisterPage(),
                                      ));
                                },
                                child: const Text(
                                  '  Register',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ])),
            ),
          ],
        ),
      ),
    ));
  }
}
