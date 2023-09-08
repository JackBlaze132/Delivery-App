import 'package:flutter/material.dart';
import 'package:flutter_delivery/src/pages/login/login_page.dart';
import 'package:flutter_delivery/src/pages/register/register_page.dart';
import 'package:flutter_delivery/src/utils/custom_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key:key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  /*Widget build(BuildContext context){
   return Scaffold(
     body: Container(
         width: double.infinity,
  child: Column(
  children: [
  Image.asset(
  'assets/img/delivery.png',
  width: 200,
  height: 200,
  )
  ]
  )
  ),

  );
}*/
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Rappi Flutter',
        debugShowCheckedModeBanner: false,
        initialRoute:'login',
        routes: {
          'login': (BuildContext context) => LoginPage(),
          'register' :(BuildContext context) => RegisterPage()
        },
        theme: ThemeData(
            primaryColor: CustomColors.primaryColor
        )
    );
  }
}

