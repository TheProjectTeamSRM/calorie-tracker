import 'package:flutter/material.dart';
import 'package:hackathonrx/screens/mealPlanner.dart';
import 'package:hackathonrx/screens/chatbot.dart';
import 'package:hackathonrx/screens/calorieCounter.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:hackathonrx/components/drawer.dart';


class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  int pageNumber = 1;
  List<Widget> pages=[
    MealPlanner(),
    ChatBot(),
    CalorieCounter(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.purpleAccent,
        appBar: AppBar(
          backgroundColor: Colors.purpleAccent,
          title: Text('HealthRX'),
          centerTitle: true,
        ),
        drawer: MainDrawer(),
        bottomNavigationBar: CurvedNavigationBar(
          index: pageNumber,
          animationDuration: Duration(milliseconds: 250 ),
          height: 50,
          backgroundColor: Colors.purpleAccent,
          color: Colors.white,
          items: <Widget>[
            Icon(Icons.fastfood),
            Icon(Icons.adb),
            Icon(Icons.add_to_queue),
          ],
          onTap: (index){
            setState(() {
              pageNumber = index;
            });
          },
        ),
        body: pages[pageNumber]
    );
  }
}
