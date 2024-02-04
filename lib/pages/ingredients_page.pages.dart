// import 'package:flutter/material.dart';
// import 'package:recipe_app/pages/home_page.pages.dart';
// import 'package:recipe_app/utilities/numbers.dart';

// class IngredientPage extends StatefulWidget {
//   const IngredientPage({super.key});

//   @override
//   State<IngredientPage> createState() => _IngredientPageState();
// }

// class _IngredientPageState extends State<IngredientPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: const Padding(
//           padding:
//               EdgeInsets.symmetric(horizontal: Numbers.appHorizontalPadding),
//           child: Icon(Icons.menu),
//         ),
//         actions: [
//           Padding(
//               padding: EdgeInsets.symmetric(
//                   horizontal: Numbers.appHorizontalPadding),
//               child:
//                   // Icon(Icons.logout_sharp),
//                   IconButton(
//                 onPressed: () {
//                   Navigator.push(
//                       context, MaterialPageRoute(builder: (_) => HomePage()));
//                 },
//                 icon: Icon(Icons.logout_sharp),
//               ))
//         ],
//       ),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Row(
//               children: [
//                 Text(
//                   'Ingredients',
//                   style: TextStyle(fontSize: 24),
//                 )
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/provider/ingredients.provider.dart';

class IngredientPage extends StatefulWidget {
  const IngredientPage({super.key});

  @override
  State<IngredientPage> createState() => _IngredientPageState();
}

class _IngredientPageState extends State<IngredientPage> {
  @override
  void initState() {
    Provider.of<IngredientsProvider>(context, listen: false).getIngredients();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // leading: TextButton(
          //   child: Text(
          //     'Ingredients',
          //     style: TextStyle(fontSize: 20),
          //     maxLines: 1,
          //   ),
          //   onPressed: () {},
          // ),
          ),
      body: Consumer<IngredientsProvider>(
          builder: (ctx, ingredientProvider, _) =>
              ingredientProvider.ingredientsList == null
                  ? const CircularProgressIndicator()
                  : (ingredientProvider.ingredientsList?.isEmpty ?? false)
                      ? const Text('No Data Found')
                      : ListView.builder(
                          itemCount: ingredientProvider.ingredientsList!.length,
                          itemBuilder: (ctx, index) => ListTile(
                                leading: Checkbox(
                                    value: ingredientProvider
                                        .ingredientsList![index].users_ids
                                        ?.contains(FirebaseAuth
                                            .instance.currentUser?.uid),
                                    onChanged: (value) {
                                      ingredientProvider.addIngredientToUser(
                                          ingredientProvider
                                              .ingredientsList![index].docId!,
                                          value ?? false);
                                    }),
                                title: Text(ingredientProvider
                                        .ingredientsList![index].name ??
                                    'No Name'),
                              ))),
    );
  }
}
