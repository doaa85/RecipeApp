import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:overlay_kit/overlay_kit.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/firebase_options.dart';
import 'package:recipe_app/pages/splash_page.dart';
import 'package:recipe_app/provider/app_auth.provider.dart';
import 'package:recipe_app/provider/recipe_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  // SystemChrome.setSystemUIOverlayStyle(
  //     SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  WidgetsFlutterBinding.ensureInitialized();
  try {
    var preference = await SharedPreferences.getInstance();
    GetIt.I.registerSingleton<SharedPreferences>(preference);
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    // if (PreferencesServices.prefs != null) {
    //   print(
    //       '========================= prefrences init Successfully ========================');
    // }
  } catch (e) {
    print(
        '=========================Error In init Prefrences ${e}========================');
  }
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => RecipeProvider()..getAds()),
    ChangeNotifierProvider(create: (_) => AppAuthProvider())
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     debugShowCheckedModeBanner: false,
  //     title: 'Flutter Demo',
  //     theme: ThemeData(
  //       colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
  //       useMaterial3: true,
  //     ),
  //     home: SplashPage(),
  //   );
  // }
  @override
  Widget build(BuildContext context) {
    return OverlayKit(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily: 'Hellix',
          inputDecorationTheme: InputDecorationTheme(
            filled: true,
            fillColor: Colors.grey.shade200,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
          ),
          colorScheme: ColorScheme.fromSeed(
            seedColor: Color(0xfff45b00),
            primary: Color(0xfff45b00),
            secondary: Color(0xfff45b00),
          ),
          useMaterial3: true,
        ),
        home: SplashPage(),
      ),
    );
  }
}
