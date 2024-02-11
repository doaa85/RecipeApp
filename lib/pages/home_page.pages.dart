import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/pages/favourite_page.pages.dart';
import 'package:recipe_app/pages/filter_page.pages.dart';
import 'package:recipe_app/pages/ingredients_page.pages.dart';
import 'package:recipe_app/pages/recently_viewed_page.pages.dart';
import 'package:recipe_app/pages/settings_page.pages.dart';
import 'package:recipe_app/provider/app_auth.provider.dart';
import 'package:recipe_app/provider/recipes_provider.dart';
import 'package:recipe_app/utilities/colores.dart';
import 'package:recipe_app/utilities/numbers.dart';
import 'package:recipe_app/widgets/ads_widget.widgets.dart';
import 'package:recipe_app/widgets/recipe_widget.widgets.dart';
import 'package:recipe_app/widgets/section_header.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ZoomDrawerController controller;
  var sliderIndex = 0;
  var carouselControllerEx;
  CarouselController buttonCarouselController = CarouselController();

  var adsList;
  var recommandedRecipesList;
  @override
  void initState() {
    controller = ZoomDrawerController();
    Provider.of<RecipesProvider>(context, listen: false)
        .getRecommandedRecipes();

    Provider.of<RecipesProvider>(context, listen: false).getFreshRecipes();
    Provider.of<RecipesProvider>(context, listen: false)
        .addRecipeToUserFavourite;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
        slideWidth: MediaQuery.of(context).size.width * 0.65,
        menuBackgroundColor: Colors.white,
        boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 5)],
        disableDragGesture: true,
        mainScreenTapClose: true,
        controller: controller,
        drawerShadowsBackgroundColor: Colors.grey,
        menuScreen: Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.white,
                  // child: CircleAvatar(
                  //   radius: 50,
                  // ),
                  backgroundImage: NetworkImage
                      // FirebaseAuth.instance.currentUser!.photoURL!)

                      ('https://firebasestorage.googleapis.com/v0/b/recipe-app-6d083.appspot.com/o/reciepes%2FIMG_%D9%A2%D9%A0%D9%A2%D9%A3%D9%A0%D9%A6%D9%A2%D9%A3_%D9%A2%D9%A3%D9%A0%D9%A7%D9%A3%D9%A4.jpg?alt=media&token=c0478655-9e3d-44c1-878d-f48fc2b6dec2'),
                ), // circleAvatar
                // circleAvatar
                Text(
                  FirebaseAuth.instance.currentUser!.displayName!,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 22,
                    fontFamily: 'Hellix-Bold',
                  ),
                  // TextStyle
                ),
                SizedBox(
                  height: 100,
                ),
                ListTile(
                  onTap: () {
                    controller.close?.call();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const FilterPage()));
                  },
                  leading: const Icon(Icons.search),
                  title: const Text('Filter'),
                ),
                ListTile(
                  onTap: () {
                    controller.close?.call();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const FavouritesPage()));
                  },
                  leading: const Icon(Icons.favorite_outlined),
                  title: const Text('Favourites'),
                ),
                ListTile(
                  onTap: () {
                    controller.close?.call();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const SettingsPage()));
                  },
                  leading: const Icon(Icons.settings),
                  title: const Text('Settings'),
                ),
                ListTile(
                  onTap: () {
                    controller.close?.call();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const RecentlyViewedPage()));
                  },
                  leading: const Icon(Icons.play_arrow),
                  title: const Text('Recently Viewad '),
                ),
                ListTile(
                  onTap: () {
                    var controller;
                    // controller.close?.call();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => IngredientPage()));
                  },
                  leading: Icon(Icons.food_bank),
                  title: Text('Ingredients'),
                ),
                ListTile(
                  onTap: () {
                    Provider.of<AppAuthProvider>(context, listen: false)
                        .signOut(context);
                  },
                  leading: Icon(Icons.logout),
                  title: Text('Logout'),
                )
              ],
            ),
          ),
        ),
        mainScreen: Scaffold(
            appBar: AppBar(
              leading: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: Numbers.appHorizontalPadding),
                child: InkWell(
                  child: Icon(Icons.menu),
                  onTap: () {
                    controller.toggle!();
                  },
                ),
              ),
              actions: [
                TextButton(
                    onPressed: () {
                      Provider.of<AppAuthProvider>(context, listen: false)
                          .signOut(context);
                    },
                    child: Text(
                      'SignOut',
                      style: TextStyle(color: Colors.black),
                    ))
              ],
            ),
            backgroundColor: ColoresConst.kLightColor,
            body: Container(
              margin: const EdgeInsets.only(top: 5, left: 20, right: 20),
              child: Column(children: [
                SizedBox(
                  height: 15,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Bonjour Emma',
                        style: TextStyle(fontSize: 15, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Container(
                  height: 30,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        'What Would you Like to coock today?',
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontFamily: 'Hellix-Bold'),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const FilterPage()));
                        },
                        child: Container(
                          height: 30,
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: ColoresConst.kprimaryColor,
                              borderRadius: BorderRadius.circular(12)),
                          child: Icon(
                            Icons.search,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const FilterPage()));
                        },
                        child: Container(
                          height: 30,
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: ColoresConst.kprimaryColor,
                              borderRadius: BorderRadius.circular(12)),
                          child: Icon(
                            Icons.tune,
                            size: 20,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 7,
                ),
                AdsWidget(),
                // const SizedBox(
                //   height: 8,
                // ),
                const SectionHeader(sectionName: "Today's Fresh Recipes"),

                Flexible(
                  child: Consumer<RecipesProvider>(
                      builder: (ctx, recipesProvider, _) => recipesProvider
                                  .freshRecipesList ==
                              null
                          ? const CircularProgressIndicator()
                          : (recipesProvider.freshRecipesList?.isEmpty ?? false)
                              ? const Text('No Data Found')
                              : ListView.builder(
                                  shrinkWrap: true,
                                  physics: AlwaysScrollableScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  itemCount:
                                      recipesProvider.freshRecipesList!.length,
                                  itemBuilder: (ctx, index) => RecipeWidget(
                                        recipe: recipesProvider
                                            .freshRecipesList![index],
                                      ))),
                ),

                const SectionHeader(
                  sectionName: 'Recommended',
                ),

                Flexible(
                  child: Consumer<RecipesProvider>(
                      builder: (ctx, recipesProvider, _) =>
                          recipesProvider.recommandedRecipesList == null
                              ? const CircularProgressIndicator()
                              : (recipesProvider
                                          .recommandedRecipesList?.isEmpty ??
                                      false)
                                  ? const Text('No Data Found')
                                  : ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: recipesProvider
                                          .recommandedRecipesList!.length,
                                      itemBuilder: (ctx, index) => RecipeWidget(
                                            recipe: recipesProvider
                                                .recommandedRecipesList![index],
                                          ))),
                ),
              ]),
            )));
  }
}
