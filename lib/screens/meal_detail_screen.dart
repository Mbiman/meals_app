import 'package:flutter/material.dart';

class MealDetailScreen extends StatelessWidget {
  static const namedRoute = '/meal-details';
  const MealDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final mealTitle = routeArgs['title']!;
    final mealId = routeArgs['id']!;

    return Scaffold(
      appBar: AppBar(
        title: Text(mealTitle),
      ),
      body: const Center(
        child: Text('The Meal!'),
      ),
    );
  }
}
