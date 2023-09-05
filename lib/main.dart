import 'package:flutter/material.dart';
import 'package:liver_remake/pages/main_page.dart';
import 'pages/index_page.dart';
import 'pages/create_character_page.dart';
import 'package:liver_remake/main.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}