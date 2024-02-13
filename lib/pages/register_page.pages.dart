import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/provider/app_auth.provider.dart';

// class RegisterPage extends StatefulWidget {
//   const RegisterPage({super.key});

//   @override
//   State<RegisterPage> createState() => _RegisterPageState();
// }

// class _RegisterPageState extends State<RegisterPage> {
//   late TextEditingController emailController;
//   late TextEditingController passwordController;
//   late TextEditingController fullNameController;
//   late GlobalKey<FormState> formkey;
//   bool obsecureText = true;
//   @override
//   void initState() {
//     super.initState();
//     emailController = TextEditingController();
//     passwordController = TextEditingController();
//     fullNameController = TextEditingController();
//     formkey = GlobalKey<FormState>();
//   }

//   void toggleObsecure() {
//     obsecureText = !obsecureText;
//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Stack(
//           children: [
//             Container(
//               width: double.infinity,
//               height: double.infinity,
//               decoration: const BoxDecoration(
//                 image: DecorationImage(
//                     image: AssetImage(
//                       'assets/images/Mask Group 9.png',
//                     ),
//                     fit: BoxFit.cover),
//               ),
//             ),
//             Container(
//               padding: const EdgeInsets.fromLTRB(85, 0, 0, 500),
//               child: const Image(
//                 image: AssetImage('assets/images/Logo (2).png'),
//                 color: Colors.black12,
//                 colorBlendMode: BlendMode.darken,
//                 width: 200,
//                 height: 200,
//               ),
//             ),
//             const SizedBox(
//               height: 60,
//             ),
//             Container(
//               padding: EdgeInsets.fromLTRB(0, 150, 0, 0),
//               child: const Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     'Register',
//                     style: TextStyle(color: Colors.white),
//                   ),
//                 ],
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.fromLTRB(8, 120, 8, 0),
//               child: Form(
//                   key: formkey,
//                   child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         TextFormField(
//                           style: TextStyle(color: Colors.white),
//                           keyboardType: TextInputType.emailAddress,
//                           controller: fullNameController,
//                           decoration: const InputDecoration(
//                             border: UnderlineInputBorder(),
//                             label: Text(
//                               'Full Name',
//                               style:
//                                   TextStyle(color: Colors.white, fontSize: 15),
//                             ),
//                             prefixIcon: Icon(
//                               Icons.person_2_outlined,
//                               color: Colors.white,
//                             ),
//                           ),
//                           validator: (value) {
//                             if (value == null || value.isEmpty) {
//                               return 'full name is required';
//                             }

//                             return null;
//                           },
//                         ),
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
//                         const SizedBox(
//                           height: 50,
//                         ),
//                         ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                               backgroundColor: Colors.orange,
//                               fixedSize: const Size(450, 50)),
//                           onPressed: () async {
//                             if (!(formkey.currentState?.validate() ?? false)) {
//                               GetIt.I
//                                   .get<SharedPreferences>()
//                                   .setBool('isLogin', true);
//                               Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                     builder: (context) => HomePage(),
//                                   ));
//                             }
//                           },
//                           child: const Text('Register'),
//                         ),
//                         SizedBox(
//                           height: 15,
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.fromLTRB(0, 150, 0, 25),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               const Text(
//                                 'already Registered? ',
//                                 style: TextStyle(
//                                   fontSize: 20,
//                                   color: Colors.white,
//                                 ),
//                               ),
//                               GestureDetector(
//                                 onTap: () {
//                                   Navigator.pushReplacement(
//                                       context,
//                                       MaterialPageRoute(
//                                           builder: (_) => LoginPage()));
//                                 },
//                                 child: const Text(
//                                   '  Sign in',
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
//           ],
//         ),
//       ),
//     );
//   }
// }

import '../utilities/colores.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  GlobalKey<FormState>? formKey;
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
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 50, right: 50, top: 40, bottom: 25),
                    child: Image.asset('assets/images/Logo (2).png'),
                  ),
                  Text(
                    'Register',
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(
                    height: 10,
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
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    style: TextStyle(color: Colors.white),
                    controller: authProvider.passwordController,
                    obscureText: authProvider.obsecureText,
                    decoration: InputDecoration(
                        border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        fillColor: Colors.transparent,
                        filled: true,
                        hintStyle: TextStyle(color: Colors.white),
                        hintText: 'password',
                        prefixIcon: Icon(
                          Icons.password,
                          color: Colors.white,
                        ),
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
                        )),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    style: TextStyle(color: Colors.white),
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
                      child: Text('register',
                          style: TextStyle(color: Colors.white))),
                  Spacer(
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
