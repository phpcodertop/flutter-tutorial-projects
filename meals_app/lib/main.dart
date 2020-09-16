import 'package:flutter/material.dart';
import './screens/meal_detail_screen.dart';
import './screens/category_meals_screen.dart';
import './screens/categories_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meals App',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
      ),
      // home: CategoriesScreen(),
      routes: {
        '/' : (ctx) => CategoriesScreen(),
        CategoryMealsScreen.routeName : (ctx) => CategoryMealsScreen(),
        MealDetailScreen.routeName : (ctx) => MealDetailScreen(),
      },
    );
  }
}