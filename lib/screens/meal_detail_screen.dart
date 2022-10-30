import 'package:flutter/material.dart';
import 'package:meals_app/widgets/list_title.dart';
import 'package:meals_app/widgets/meal_ingredients.dart';
import 'package:meals_app/widgets/meal_steps.dart';

import '../data/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const namedRoute = '/meal-details';
  const MealDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final mealId = ModalRoute.of(context)!.settings.arguments as String;

    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: height * 0.35,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            const ListTitle(header: 'Ingredients'),
            Ingredients(
                height: height, width: width, selectedMeal: selectedMeal),
            const ListTitle(header: 'Steps'),
            Steps(selectedMeal: selectedMeal),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pop(mealId);
        },
        child: const Icon(
          Icons.delete,
        ),
      ),
    );
  }
}
