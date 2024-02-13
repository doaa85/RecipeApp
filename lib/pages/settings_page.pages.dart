import 'package:flutter/material.dart';
import 'package:recipe_app/pages/edit_profile_page.pages.dart';
import 'package:recipe_app/pages/home_page.pages.dart';
import 'package:recipe_app/utilities/colores.dart';
import 'package:recipe_app/utilities/numbers.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: Numbers.appHorizontalPadding),
          child: GestureDetector(
            child: Icon(Icons.menu),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => HomePage()));
            },
          ),
        ),
        actions: [
          Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Numbers.appHorizontalPadding),
              child:
                  // Icon(Icons.logout_sharp),
                  IconButton(
                onPressed: () {
                  // Provider.of<AppAuthProvider>(context, listen: false)
                  //     .signOut(context);
                  Navigator.of(context).pop();
                },
                icon: Icon(Icons.logout_sharp),
              ))
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Settings',
                  style: TextStyle(fontSize: 24),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 70,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: 65,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: ColoresConst.kBlueColor),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.language,
                      size: 40,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text('Language'),
                    SizedBox(
                      width: 130,
                    ),
                    Text(
                      'English',
                      style: TextStyle(fontSize: 18, color: Colors.red),
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: 65,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: ColoresConst.kBlueColor),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    InkWell(
                        child: Icon(
                          Icons.edit,
                          size: 40,
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => EditProfilePage()));
                        }),
                    SizedBox(
                      width: 180,
                    ),
                    Text(
                      'Edit Profile',
                      style: TextStyle(fontSize: 18, color: Colors.red),
                    )
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
