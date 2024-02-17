import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/provider/app_auth.provider.dart';

import '../utilities/colores.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  var formkey = GlobalKey<FormState>();
  @override
  void initState() {
    Provider.of<AppAuthProvider>(context, listen: false).providerInit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/Mask Group 9.png'),
                    fit: BoxFit.cover)),
          ),
          Container(
            decoration: const BoxDecoration(color: Colors.black38),
          ),
          Consumer<AppAuthProvider>(
            builder: (context, authProvider, _) => Form(
              key: authProvider.formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 50, right: 50, top: 20, bottom: 15),
                    child: Image.asset('assets/images/Logo (2).png'),
                  ),
                  const Text(
                    'Register',
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  TextFormField(
                    controller: authProvider.emailController,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        fillColor: Colors.transparent,
                        filled: true,
                        hintStyle: TextStyle(color: Colors.white),
                        hintText: 'email',
                        prefixIcon: Icon(
                          Icons.person,
                          color: Colors.white,
                        )),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    style: const TextStyle(color: Colors.white),
                    controller: authProvider.passwordController,
                    obscureText: authProvider.obsecureText,
                    decoration: InputDecoration(
                        border: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        fillColor: Colors.transparent,
                        filled: true,
                        hintStyle: const TextStyle(color: Colors.white),
                        hintText: 'password',
                        prefixIcon: const Icon(
                          Icons.password,
                          color: Colors.white,
                        ),
                        suffixIcon: InkWell(
                          onTap: () => authProvider.toggleObsecure(),
                          child: authProvider.obsecureText
                              ? const Icon(
                                  Icons.visibility_off,
                                  color: Colors.white,
                                )
                              : const Icon(
                                  Icons.visibility,
                                  color: Colors.white,
                                ),
                        )),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    style: const TextStyle(color: Colors.white),
                    controller: authProvider.nameController,
                    decoration: const InputDecoration(
                        border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        fillColor: Colors.transparent,
                        filled: true,
                        hintStyle: TextStyle(color: Colors.white),
                        hintText: 'name',
                        prefixIcon: Icon(
                          Icons.document_scanner,
                          color: Colors.white,
                        )),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(400, 40),
                          backgroundColor: ColoresConst.mainColor),
                      onPressed: () {
                        authProvider.signUp(context);
                      },
                      child: const Text('register',
                          style: TextStyle(color: Colors.white))),
                  const Spacer(
                    flex: 2,
                  ),
                  Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: TextButton(
                          onPressed: () {
                            Provider.of<AppAuthProvider>(context, listen: false)
                                .openLoginPage(context);
                          },
                          child: Text('LogIn')))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
