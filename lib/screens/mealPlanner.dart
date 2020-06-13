import 'package:flutter/material.dart';
import 'package:hackathonrx/foodApiNetworking.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:hackathonrx/screens/recommendedMeal.dart';

String _apiKey ='37858fd40dd048ce9a36c24155d78cd0';
String _url='https://api.spoonacular.com/mealplanner/generate?apiKey=';
//https://api.spoonacular.com/mealplanner/generate?apiKey=37858fd40dd048ce9a36c24155d78cd0&targetCalories=2000&diet=vegan&timeFrame=day

class MealPlanner extends StatefulWidget {
  @override
  _MealPlannerState createState() => _MealPlannerState();
}

class _MealPlannerState extends State<MealPlanner> {

  List<String> _diets = [
    //List of diets that lets spoonacular filter
    'None',
    'Gluten Free',
    'Ketogenic',
    'Lacto-Vegetarian',
    'Ovo-Vegetarian',
    'Vegan',
    'Pescetarian',
    'Paleo',
    'Primal',
    'Whole30',
  ];
  double _targetCalories = 2250;
  String _diet = 'None';
  String _breakfast;
  String _lunch;
  String _dinner;
  bool _showSpinner=false;

  Future getData(double target, String diet)async{
    NetworkHelper networkHelper = NetworkHelper(url: _url+_apiKey+'&targetCalories='+target.toString()+'&diet='+diet+'&timeFrame=day');
    print( _url+_apiKey+'&targetCalories='+target.toString()+'&diet='+diet+'&timeFrame=day');
    var response = await networkHelper.getData();
    if(response!=null) {
      print(response);
      _breakfast = response['meals'][0]['title'];
      _lunch = response['meals'][1]['title'];
      _dinner = response['meals'][2]['title'];
      setState(() {
        _showSpinner=false;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purpleAccent,
      body: ModalProgressHUD(
        inAsyncCall: _showSpinner,
        child: Center(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 30),
            padding: EdgeInsets.symmetric(horizontal: 30),
            height: MediaQuery.of(context).size.height * 0.55,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.9),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //Text widget for our app's title
                Text(
                  'My Daily Meal Planner',
                  style: TextStyle(fontSize: 32,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2),
                ),
                //space
                SizedBox(height: 20),
                //A RichText to style the target calories
                RichText(
                  text: TextSpan(
                      style: Theme.of(context).textTheme.body1.copyWith(fontSize: 25),
                      children: [
                        TextSpan(
                            text:  _targetCalories.truncate().toString(),
                            style: TextStyle(
                                color: Colors.purple,
                                fontWeight: FontWeight.bold
                            )
                        ),
                        TextSpan(
                            text: 'cal',
                            style: TextStyle(
                                fontWeight: FontWeight.w600
                            )
                        ),
                      ]
                  ),
                ),
                //Orange slider that sets our target calories
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    thumbColor: Colors.purple,
                    inactiveTrackColor: Colors.grey,
                    activeTrackColor: Colors.purple,
                    trackHeight: 6,
                  ),
                  child: Slider(
                    min: 0,
                    max: 4500,
                    value: _targetCalories,
                    onChanged: (value) => setState(() {
                      _targetCalories = value.round().toDouble();
                    }
                    ),
                  ),
                ),
                //Simple drop down to select the type of diet
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: DropdownButtonFormField(
                    items: _diets.map((String priority) {
                      return DropdownMenuItem(
                        value: priority,
                        child: Text(
                          priority,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18
                          ),
                        ),
                      );
                    }).toList(),
                    decoration: InputDecoration(
                      labelText: 'Diet',
                      labelStyle: TextStyle(fontSize: 18),
                    ),
                    onChanged: (value) {
                      setState(() {
                        _diet = value;
                      });
                    },
                    value: _diet,
                  ),
                ),
                //Space
                SizedBox(height: 30),
                //FlatButton where onPressed() triggers a function called _searchMealPlan
                FlatButton(
                  padding: EdgeInsets.symmetric(horizontal: 60, vertical: 8),
                  color: Theme.of(context).primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
                    'Search', style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                  ),
                  //_searchMealPlan function is above the build method
                  onPressed: ()async{
                    setState(() {
                      _showSpinner=true;
                    });
                    await getData(_targetCalories, _diet);
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>RecommendedMealPlan(breakfast: _breakfast,
                      lunch: _lunch,
                      dinner: _dinner,
                    )));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
