import 'package:flutter/material.dart';
import 'package:hackathonrx/screens/dashboard.dart';
import 'screens/welcomeScreen.dart';
import 'screens/loginPage.dart';
import 'screens/registrationPage.dart';
import 'screens/input_page.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
//      theme: ThemeData.dark().copyWith(
//        primaryColor: Color(0xFF0A0E21),
//        scaffoldBackgroundColor: Color(0xFF0A0E21),
//      ),
      initialRoute: '/',
      routes: {
        '/': (context)=>WelcomeScreen(),
        '/register': (context)=> RegistrationPage(),
        '/login': (context)=> LoginPage(),
        '/dashboard': (context)=> Dashboard(),
        '/bmiInput':(context)=>InputPage(),

      },
    );
  }
}