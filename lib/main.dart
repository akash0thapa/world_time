import 'package:flutter/material.dart';
import 'package:world_time/pages/loading_screen.dart';
import 'pages/select_location.dart';
import 'pages/home.dart';



void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/':(context)=>LoadingScreen(),
      '/home':(context)=>Home(),
      '/location':(context)=>SelectLocation(),
    },
  ));
}

