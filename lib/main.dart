import 'package:flutter/material.dart';
import 'package:timeapp/pages/home.dart';
import 'package:timeapp/pages/loading.dart';
import 'package:timeapp/pages/location.dart';

void main()
{
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp( 
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      initialRoute: '/',
      routes: {
        '/' : (context) => Loading(),
        '/home' : (context) => HomePage(),
        '/location' : (context) => Location(),
      },
    );
  }
}