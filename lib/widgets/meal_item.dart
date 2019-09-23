import 'package:flutter/material.dart';

import '../models/meal.dart';

class MealItem extends StatelessWidget {
  final Meal mealInfo;

  MealItem(this.mealInfo);

  String get complexityText {
    if (mealInfo.complexity == Complexity.Simple) {
      return 'Simple';
    } else if (mealInfo.complexity == Complexity.Hard) {
      return 'Hard';
    } else {
      return 'Challenging';
    }
  }

  String get affordabilityText {
    if (mealInfo.affordability == Affordability.Affordable) {
      return 'Affordable';
    } else if (mealInfo.affordability == Affordability.Luxurious) {
      return 'Luxurious';
    } else {
      return 'Pricey';
    }
  }

  void selectMeal() {}

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      onTap: selectMeal,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 5,
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    mealInfo.imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: 0,
                  child: Container(
                    width: 300,
                    padding: EdgeInsets.all(10),
                    color: Colors.black54,
                    child: Text(
                      mealInfo.title,
                      style: TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                      ),
                      // softWrap: true,
                      // overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Expanded(
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.schedule),
                        SizedBox(width: 5),
                        Text('${mealInfo.duration} min'),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.work),
                        SizedBox(width: 5),
                        Text('$complexityText'),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.attach_money),
                        SizedBox(width: 5),
                        Text('$affordabilityText'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
