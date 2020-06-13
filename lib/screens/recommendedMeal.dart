import 'package:flutter/material.dart';

class RecommendedMealPlan extends StatelessWidget {

  final breakfast;
  final lunch;
  final dinner;
  RecommendedMealPlan({this.breakfast,this.lunch,this.dinner});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purpleAccent,
      appBar: AppBar(
        title: Text('HealthRX'),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Card(
                color: Colors.white,
                elevation: 10,
                child: ListTile(
                  title: Text(
                    'Breakfast - $breakfast',
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Card(
                color: Colors.white,
                elevation: 10,
                child: ListTile(
                  title: Text(
                    'Lunch - $lunch',
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Card(
                color: Colors.white,
                elevation: 10,
                child: ListTile(
                  title: Text(
                    'Dinner - $dinner',
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
