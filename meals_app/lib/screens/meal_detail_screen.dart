import 'package:flutter/material.dart';
import '../models/meal.dart';

import '../dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';
  final Function toggleFavourite;
  final Function isFavorite;
  MealDetailScreen(this.toggleFavourite, this.isFavorite);

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context).settings.arguments as Map<String, String>;
    final mealId = routeArgs['id'];
    final Meal selectedMeal = DUMMY_MEALS.firstWhere((meal) {
      return meal.id == mealId;
    });

    Widget buildSectionTitle(String text) {
      return Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 26,
          ),
        ),
      );
    }

    Widget buildContainer(Widget children) {
      return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        height: 200,
        width: 300,
        child: children,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(selectedMeal.imageUrl, fit: BoxFit.cover,),
            ),
            buildSectionTitle('Ingredients'),
            buildContainer(
              ListView.builder(itemBuilder: (ctx, index) {
                return Card(
                  color: Theme.of(context).accentColor,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(selectedMeal.ingredients[index]),
                  ),
                );
              }, itemCount: selectedMeal.ingredients.length,)
            ),
            buildSectionTitle('Steps'),
            buildContainer(
              ListView.builder(itemBuilder: (ctx, index) {
                return Column(
                  children: [
                  ListTile(
                    leading: CircleAvatar(
                      child: Text('# ${index + 1}'),
                    ),
                    title: Text(selectedMeal.steps[index]),
                    ),
                    Divider(
                      height: 1,
                    ),
                  ]
                );
              }, itemCount: selectedMeal.steps.length),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
            isFavorite(mealId) ? Icons.star : Icons.star_border
        ),
        onPressed: () {
          print('meal id $mealId');
          toggleFavourite(mealId);
        },
      ),
    );
  }
}
