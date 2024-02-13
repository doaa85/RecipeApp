import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/pages/forgot_password_page.pages.dart';
import 'package:recipe_app/pages/home_page.pages.dart';
import 'package:recipe_app/provider/app_auth.provider.dart';
import 'package:recipe_app/utilities/colores.dart';
import 'package:recipe_app/widgets/widget_scrollable';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
              child: WidgetScrollable(
                isColumn: true,
                columnMainAxisAlignment: MainAxisAlignment.center,
                widgets: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 50, right: 50, top: 50, bottom: 25),
                    child: Image.asset('assets/images/Logo (2).png'),
                  ),
                  const Text(
                    'Login',
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(
                    height: 15,
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
                  TextFormField(
                    obscureText: authProvider.obsecureText,
                    style: const TextStyle(color: Colors.white),
                    controller: authProvider.passwordController,
                    decoration: InputDecoration(
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
                        ),
                        focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        border: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        fillColor: Colors.transparent,
                        filled: true,
                        hintStyle: const TextStyle(color: Colors.white),
                        hintText: 'password',
                        prefixIcon: const Icon(
                          Icons.password,
                          color: Colors.white,
                        )),
                    validator: (value) {
                      if (value == null || (value?.isEmpty ?? false)) {
                        return 'Password Is Required';
                      }
                      return null;
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        child: const Text(
                          'Forgot Password ?',
                          style: TextStyle(color: Colors.blueAccent),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => ForgotPasswordPage()));
                        },
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(400, 50),
                          backgroundColor: ColoresConst.mainColor),
                      onPressed: () {
                        authProvider.logIn(context);
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => HomePage()));
                      },
                      child:
                          Text('Login', style: TextStyle(color: Colors.white))),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
          ),
          if (MediaQuery.of(context).viewInsets.bottom == 0)
            Positioned.fill(
              bottom: 10,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.only(top: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (_) => const RegisterPage()));
                          Provider.of<AppAuthProvider>(context, listen: false)
                              .openRegisterPage(context);
                        },
                        child: const Text(
                          "don't Have Account , Register Now ?",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}
