import 'package:flutter/material.dart';
import 'package:hackathonrx/components/roundButton.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = "welcomeScreen";
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background.png'),
                fit: BoxFit.cover,
              )
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[

                Row(
                  children: <Widget>[
                    Hero(
                      tag: 'logo',
                      child: Container(
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage('assets/images/healthrx.png'),
                                fit: BoxFit.cover
                            )
                        ),
                      ),
                    ),
                    SizedBox(width: 10,),
                    Text('Be',style: TextStyle(fontSize: 45.0,fontFamily: 'Pacifico',fontWeight: FontWeight.bold)),
                    RotateAnimatedTextKit(
                      onTap: () {
                        print("Tap Event");
                      },
                      duration: Duration(seconds: 1 ),
                      repeatForever: true,
                      text: [" Fit", "Healthy"," You"],
                      textStyle: TextStyle(fontSize: 45.0, fontFamily: 'Pacifico', fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 48.0,
                ),
                RoundButton(
                  color: Colors.lightBlueAccent,
                  text: 'Login',
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  },
                ),
                RoundButton(
                  color: Colors.blueAccent,
                  text: 'Register',
                  onPressed: () {
                    Navigator.pushNamed(context, '/register');
                  },
                ),
                RoundButton(
                  color: Colors.blue[500],
                  text: 'Anonymous sign in',
                  onPressed: () {
                    Navigator.pushNamed(context, '/dashboard');
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
