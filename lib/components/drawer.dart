import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            color: Colors.purple,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            child: Center(
              child: Column(
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 100,
                    margin: EdgeInsets.only(top: 30),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage('assets/images/healthrx.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 20,),
          ListTile(
            leading: Icon(Icons.accessibility, size: 35,),
            title: Text('BMI calculator',style: TextStyle(fontSize: 20),),
            onTap: (){
              Navigator.pushNamed(context,'/bmiInput');
            },
          )

        ],
      ),
    );
  }
}
