import 'package:flutter/material.dart';
import 'package:recipe_app/pages/login_page.pages.dart';
import 'package:recipe_app/pages/register_page.pages.dart';

class EnterPage extends StatefulWidget {
  const EnterPage({super.key});

  @override
  State<EnterPage> createState() => _EnterPageState();
}

class _EnterPageState extends State<EnterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Image(
              image: AssetImage(
                'assets/images/Mask Group 9.png',
              ),
              color: Colors.black38,
              colorBlendMode: BlendMode.darken,
              width: double.infinity,
              height: double.infinity,
            ),
            SizedBox(
              height: 100,
            ),
            Container(
              padding: EdgeInsets.fromLTRB(85, 155, 50, 0),
              child: Image(
                image: AssetImage('assets/images/Logo (2).png'),
                color: Colors.black12,
                colorBlendMode: BlendMode.darken,
                width: 200,
                height: 200,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(85, 50, 50, 0),
                  child: Text(
                    'Cooking Done The Easy Way',
                    style: TextStyle(
                        color: Colors.white54,
                        fontFamily: "Hellix ",
                        fontWeight: FontWeight.w100),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        fixedSize: const Size(200, 40)),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RegisterPage(),
                          ));
                    },
                    child: const Text(
                      'Register',
                      selectionColor: Colors.black,
                    )),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(100, 0, 100, 50),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (_) => LoginPage()));
                      },
                      child: Text(
                        'Sign in',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
