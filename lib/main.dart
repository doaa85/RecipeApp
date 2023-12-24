import 'package:flutter/material.dart';
import 'package:recipe_app/pages/splash_page.dart';
import 'package:recipe_app/services/preferences.services.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    PreferencesServices.prefs = await SharedPreferences.getInstance();

    if (PreferencesServices.prefs != null) {
      print(
          '========================= prefrences init Successfully ========================');
    }
  } catch (e) {
    print(
        '=========================Error In init Prefrences ${e}========================');
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
       
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: SplashPage(),
    );
  }
}
