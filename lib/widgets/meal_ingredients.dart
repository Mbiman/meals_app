import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/build_container.dart';

class Ingredients extends StatelessWidget {
  const Ingredients({
    Key? key,
    required this.height,
    required this.width,
    required this.selectedMeal,
  }) : super(key: key);

  final double height;
  final double width;
  final Meal selectedMeal;

  @override
  Widget build(BuildContext context) {
    return BuildContainer(
      child: ListView.builder(
        itemCount: selectedMeal.ingredients.length,
        itemBuilder: (context, index) {
          return Card(
            color: Theme.of(context).focusColor,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 5,
                horizontal: 10,
              ),
              child: Text(selectedMeal.ingredients[index]),
            ),
          );
        },
      ),
    );
  }
}
