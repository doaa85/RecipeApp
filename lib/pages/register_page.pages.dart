import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/pages/home_page.pages.dart';
import 'package:recipe_app/pages/login_page.pages.dart';
import 'package:recipe_app/services/preferences.services.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController fullNameController;
  late GlobalKey<FormState> formkey;
  bool obsecureText = true;
  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    fullNameController = TextEditingController();
    formkey = GlobalKey<FormState>();
  }

  void toggleObsecure() {
    obsecureText = !obsecureText;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      'assets/images/Mask Group 9.png',
                    ),
                    fit: BoxFit.cover),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(85, 0, 0, 500),
              child: const Image(
                image: AssetImage('assets/images/Logo (2).png'),
                color: Colors.black12,
                colorBlendMode: BlendMode.darken,
                width: 200,
                height: 200,
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0, 150, 0, 0),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Register',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 100, 8, 0),
              child: Form(
                  key: formkey,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextFormField(
                          style: TextStyle(color: Colors.white),
                          keyboardType: TextInputType.emailAddress,
                          controller: fullNameController,
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            label: Text(
                              'Full Name',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            ),
                            prefixIcon: Icon(
                              Icons.person_2_outlined,
                              color: Colors.white,
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'full name is required';
                            }

                            return null;
                          },
                        ),
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
                        const SizedBox(
                          height: 50,
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
                          child: const Text('Register'),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 150, 0, 25),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'already Registered? ',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => LoginPage()));
                                },
                                child: const Text(
                                  '  Sign in',
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
    );
  }
}
