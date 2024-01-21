import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/pages/home_page.pages.dart';
import 'package:recipe_app/provider/app_auth.provider.dart';
import 'package:recipe_app/utilities/colores.dart';
// class LoginPage extends StatefulWidget {
//   const LoginPage({super.key});

//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   late TextEditingController emailController;
//   late TextEditingController passwordController;
//   late GlobalKey<FormState> formkey;
//   bool obsecureText = true;
//   @override
//   void initState() {
//     super.initState();
//     emailController = TextEditingController();
//     passwordController = TextEditingController();
//     formkey = GlobalKey<FormState>();
//   }

//   void toggleObsecure() {
//     obsecureText = !obsecureText;
//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Center(
//       child: Stack(
//         children: [
//           Container(
//             decoration: const BoxDecoration(
//                 image: DecorationImage(
//                     image: AssetImage('assets/images/Mask Group 9.png'),
//                     fit: BoxFit.cover)),
//           ),
//           Container(
//             child: Padding(
//               padding: const EdgeInsets.fromLTRB(90, 30, 0, 0),
//               child: Container(
//                 width: 180,
//                 height: 100,
//                 child: const Image(
//                   image: AssetImage('assets/images/Logo (2).png'),
//                 ),
//               ),
//             ),
//           ),
//           SizedBox(
//             height: 5,
//           ),
//           Padding(
//             padding: const EdgeInsets.fromLTRB(155, 120, 0, 0),
//             child: const Text(
//               'Sign in',
//               style: TextStyle(color: Colors.white),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.fromLTRB(8, 90, 8, 0),
//             child: Expanded(
//               child: Form(
//                   key: formkey,
//                   child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         TextFormField(
//                           style: TextStyle(color: Colors.white),
//                           keyboardType: TextInputType.emailAddress,
//                           controller: emailController,
//                           decoration: const InputDecoration(
//                               border: UnderlineInputBorder(),
//                               label: Text(
//                                 'Email',
//                                 style: TextStyle(color: Colors.white),
//                               ),
//                               suffixIcon: Icon(
//                                 Icons.email,
//                                 color: Colors.white,
//                               ),
//                               prefixIcon: Icon(
//                                 Icons.email_outlined,
//                                 color: Colors.white60,
//                               )),
//                           validator: (value) {
//                             if (value == null || value.isEmpty) {
//                               return 'Email is required';
//                             }
//                             if (!EmailValidator.validate(value)) {
//                               return 'Not Valid Email';
//                             }
//                             return null;
//                           },
//                         ),
//                         const SizedBox(
//                           height: 15,
//                         ),
//                         TextFormField(
//                             style: TextStyle(color: Colors.white),
//                             obscureText: obsecureText,
//                             controller: passwordController,
//                             decoration: InputDecoration(
//                                 fillColor: Colors.orange,
//                                 label: const Text(
//                                   'Passwoord',
//                                   style: TextStyle(color: Colors.white),
//                                 ),
//                                 suffixIcon: InkWell(
//                                   onTap: () {
//                                     toggleObsecure();
//                                   },
//                                   child: Icon(
//                                     obsecureText
//                                         ? Icons.visibility_off
//                                         : Icons.visibility,
//                                     color: Colors.white,
//                                   ),
//                                 ),
//                                 prefixIcon: const Icon(
//                                   Icons.lock_outline,
//                                   color: Colors.white60,
//                                 )),
//                             validator: (value) {
//                               if (value == null || value.isEmpty) {
//                                 return 'password is required';
//                               }

//                               if (value.length < 6) {
//                                 return 'password too short';
//                               }
//                               return null;
//                             }),
//                         const SizedBox(height: 10),
//                         const Row(
//                           mainAxisAlignment: MainAxisAlignment.end,
//                           children: [
//                             Text(
//                               'Forgot Password ?',
//                               style: TextStyle(color: Colors.blueAccent),
//                             )
//                           ],
//                         ),
//                         const SizedBox(
//                           height: 10,
//                         ),
//                         ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                               backgroundColor: Colors.orange,
//                               fixedSize: const Size(450, 50)),
//                           onPressed: () async {
//                             if (formkey.currentState?.validate() ?? false) {
//                               await PreferencesServices.prefs
//                                   ?.setBool('islogin', true);
//                               Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                     builder: (context) => HomePage(),
//                                   ));
//                             }
//                           },
//                           child: const Text('Sign in'),
//                         ),
//                         const SizedBox(
//                           height: 10,
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.fromLTRB(0, 200, 0, 0),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               const Text(
//                                 'dont have account? ',
//                                 style: TextStyle(
//                                   fontSize: 20,
//                                   color: Colors.white,
//                                 ),
//                               ),
//                               GestureDetector(
//                                 onTap: () {
//                                   Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                         builder: (context) => RegisterPage(),
//                                       ));
//                                 },
//                                 child: const Text(
//                                   '  Register',
//                                   style: TextStyle(
//                                     fontSize: 20,
//                                     color: Colors.white,
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ])),
//             ),
//           ),
//         ],
//       ),
//     ));
//   }
// }

import 'package:recipe_app/widgets/widget_scrollable';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // late TextEditingController emailController;
  // late TextEditingController passwordController;
  // late GlobalKey<FormState> formkey;
  // bool obsecureText = true;
  // @override
  // void initState() {
  //   super.initState();
  //   emailController = TextEditingController();
  //   passwordController = TextEditingController();
  //   formkey = GlobalKey<FormState>();
  // }

  // void toggleObsecure() {
  //   obsecureText = !obsecureText;
  //   setState(() {});
  // }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: Stack(
  //       children: [
  //         Container(
  //           decoration: const BoxDecoration(
  //               image: DecorationImage(
  //                   image: AssetImage('assets/images/Mask Group 9.png'),
  //                   fit: BoxFit.cover)),
  //         ),
  //         Container(
  //           decoration: const BoxDecoration(color: Colors.black38),
  //         ),
  //         Form(
  //           key: formkey,
  //           child: WidgetScrollable(
  //             isColumn: true,
  //             columnMainAxisAlignment: MainAxisAlignment.center,
  //             widgets: [
  //               Padding(
  //                 padding: const EdgeInsets.only(
  //                     left: 50, right: 50, top: 50, bottom: 25),
  //                 child: Image.asset('assets/images/Logo (2).png'),
  //               ),
  //               const Text(
  //                 'Login',
  //                 style: TextStyle(color: Colors.white),
  //               ),
  //               const SizedBox(
  //                 height: 15,
  //               ),
  //               TextFormField(
  //                 controller: emailController,
  //                 style: const TextStyle(color: Colors.white),
  //                 decoration: const InputDecoration(
  //                     focusedBorder: UnderlineInputBorder(
  //                         borderSide: BorderSide(color: Colors.white)),
  //                     enabledBorder: UnderlineInputBorder(
  //                         borderSide: BorderSide(color: Colors.white)),
  //                     border: UnderlineInputBorder(
  //                         borderSide: BorderSide(color: Colors.white)),
  //                     fillColor: Colors.transparent,
  //                     filled: true,
  //                     hintStyle: TextStyle(color: Colors.white),
  //                     hintText: 'email',
  //                     prefixIcon: Icon(
  //                       Icons.person,
  //                       color: Colors.white,
  //                     )),
  //                 validator: (value) {
  //                   if (value != null || (value?.isEmpty ?? false)) {
  //                     return 'Email Is Required';
  //                   }
  //                   return null;
  //                 },
  //               ),
  //               const SizedBox(
  //                 height: 15,
  //               ),
  //               TextFormField(
  //                 controller: passwordController,
  //                 obscureText: obsecureText,
  //                 decoration: const InputDecoration(
  //                     focusedBorder: UnderlineInputBorder(
  //                         borderSide: BorderSide(color: Colors.white)),
  //                     enabledBorder: UnderlineInputBorder(
  //                         borderSide: BorderSide(color: Colors.white)),
  //                     border: UnderlineInputBorder(
  //                         borderSide: BorderSide(color: Colors.white)),
  //                     fillColor: Colors.transparent,
  //                     filled: true,
  //                     hintStyle: TextStyle(color: Colors.white),
  //                     hintText: 'password',
  //                     prefixIcon: Icon(
  //                       Icons.password,
  //                       color: Colors.white,
  //                     )),
  //                 validator: (value) {
  //                   if (value != null || (value?.isEmpty ?? false)) {
  //                     return 'Password Is Required';
  //                   }
  //                   return null;
  //                 },
  //               ),
  //               const SizedBox(
  //                 height: 15,
  //               ),
  //               ElevatedButton(
  //                   style: ElevatedButton.styleFrom(
  //                       fixedSize: Size(400, 50),
  //                       backgroundColor: ColoresConst.mainColor),
  //                   onPressed: () {
  //                     if (!(formkey.currentState?.validate() ?? false)) {
  //                       GetIt.I
  //                           .get<SharedPreferences>()
  //                           .setBool('isLogin', true);

  //                       Navigator.pushReplacement(
  //                           context,
  //                           MaterialPageRoute(
  //                               builder: (_) => const HomePage()));
  //                     }
  //                   },
  //                   child:
  //                       Text('Login', style: TextStyle(color: Colors.white))),
  //               const SizedBox(
  //                 height: 15,
  //               ),
  //             ],
  //           ),
  //         ),
  //         if (MediaQuery.of(context).viewInsets.bottom == 0)
  //           Positioned.fill(
  //             bottom: 10,
  //             child: Align(
  //               alignment: Alignment.bottomCenter,
  //               child: Padding(
  //                 padding: EdgeInsets.only(top: 8),
  //                 child: Row(
  //                   mainAxisAlignment: MainAxisAlignment.center,
  //                   children: [
  //                     InkWell(
  //                       onTap: () {
  //                         Navigator.push(
  //                             context,
  //                             MaterialPageRoute(
  //                                 builder: (_) => RegisterPage()));
  //                       },
  //                       child: Text(
  //                         "dont Have Account , Register Now ?",
  //                         style: TextStyle(color: Colors.white),
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //             ),
  //           )
  //       ],
  //     ),
  //   );
  // }
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
            decoration: BoxDecoration(
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
                  Text(
                    'Login',
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: authProvider.emailController,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
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
                    style: TextStyle(color: Colors.white),
                    controller: authProvider.passwordController,
                    decoration: InputDecoration(
                        suffixIcon: InkWell(
                          onTap: () => authProvider.toggleObsecure(),
                          child: authProvider.obsecureText
                              ? Icon(
                                  Icons.visibility_off,
                                  color: Colors.white,
                                )
                              : Icon(
                                  Icons.visibility,
                                  color: Colors.white,
                                ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        fillColor: Colors.transparent,
                        filled: true,
                        hintStyle: TextStyle(color: Colors.white),
                        hintText: 'password',
                        prefixIcon: Icon(
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
