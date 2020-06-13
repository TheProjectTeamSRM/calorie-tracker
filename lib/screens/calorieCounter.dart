import 'package:flutter/material.dart';
import 'package:hackathonrx/foodApiNetworking.dart';
import 'package:hackathonrx/components/card.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';



String _apiKey = '52fae7b0abb444a6b6afbaa1ab84e5b6';
String _url = 'https://api.spoonacular.com/recipes/complexSearch?apiKey=';


// https://api.spoonacular.com/recipes/complexSearch?apiKey=52fae7b0abb444a6b6afbaa1ab84e5b6&query=pasta&minFat=25&minCalories=50&minCarbs=10&minSugar=0&number=1

class CalorieCounter extends StatefulWidget {
  @override
  _CalorieCounterState createState() => _CalorieCounterState();
}

class _CalorieCounterState extends State<CalorieCounter> {

  var carbs=0.0;
  var calories=0.0;
  var fat= 0.0;
  var sugar=0.0;

  void getData(String query) async {
    NetworkHelper networkHelper = NetworkHelper(url:_url+_apiKey+'&query='+query+'&minFat=25&minCalories=50&minCarbs=10&minSugar=0&number=1');
    var response = await networkHelper.getData();
    setState(() {
      calories= response["results"][0][ "nutrition"][0]["amount"];
      fat= response["results"][0][ "nutrition"][1]["amount"];
      carbs= response["results"][0][ "nutrition"][2]["amount"];
      sugar= response["results"][0][ "nutrition"][3]["amount"];
      _showSpinner=false;
    });

  }
  String food;
  bool _showSpinner=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: Colors.purpleAccent,
      body: ModalProgressHUD(
        inAsyncCall: _showSpinner,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(30),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: ListTile(
                      trailing: IconButton(
                        icon: Icon(Icons.search),
                        onPressed: (){
                          setState(() {
                            _showSpinner=true;
                          });
                          getData(food);
                        },
                      ),
                      title: TextField(
                        decoration: InputDecoration(
                            hintText: 'Enter food to get its stats',
                            filled: true,
                            fillColor: Colors.white,
                            icon: Icon(Icons.fastfood,color: Colors.grey[700],),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                borderSide: BorderSide.none
                            )
                        ),
                        onChanged: (value){
                          food=value;
                        },
                      ),
                    ),
                  ),
                ),
                Column(
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    SizedBox(height: 10,),
                    InfoCard(nutrient: "Calories",amount: calories,),
                    SizedBox(height: 5,),
                    InfoCard(nutrient: "Carbs",amount: carbs,),
                    SizedBox(height: 5,),
                    InfoCard(nutrient: "Sugar",amount: sugar,),
                    SizedBox(height: 5,),
                    InfoCard(nutrient: "Fat",amount: fat,),
                  ],
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}

