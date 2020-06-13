import 'package:flutter/material.dart';
import 'package:hackathonrx/components/roundButton.dart';
import 'package:hackathonrx/constants.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/background.png'),
                    fit: BoxFit.cover
                )
            ),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  Flexible(
                    child: Hero(
                      tag: 'logo',
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage('assets/images/healthrx.png'),
                                fit: BoxFit.cover
                            )
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 35,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: TextField(
                      decoration: kInputDecoration,
                    ),
                  ),
                  SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: TextField(
                      decoration: kInputDecoration.copyWith(
                          labelText: 'Password'
                      ),
                      obscureText: true,
                    ),
                  ),
                  SizedBox(height: 20,),
                  RoundButton(
                    color: Colors.lightBlue, text: 'Log In', onPressed: () {},
                  ),
                ]
            ),
          ),
        )
    );
  }
}