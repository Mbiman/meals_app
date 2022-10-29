import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/build_container.dart';

class Steps extends StatelessWidget {
  const Steps({
    Key? key,
    required this.selectedMeal,
  }) : super(key: key);

  final Meal selectedMeal;

  @override
  Widget build(BuildContext context) {
    return BuildContainer(
      child: ListView.builder(
        itemCount: selectedMeal.steps.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              ListTile(
                leading: CircleAvatar(
                  child: Text('# ${(index + 1)}'),
                ),
                title: Text(
                  selectedMeal.steps[index],
                ),
              ),
              Divider(
                color: Theme.of(context).dividerColor,
                thickness: 1,
              ),
            ],
          );
        },
      ),
    );
  }
}
