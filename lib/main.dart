import 'package:flutter/material.dart';
import 'pages/main_page.dart';
import 'pages/index_page.dart';
import 'pages/create_character_page.dart';
import 'package:liver_remake/main.dart';
import 'pages/train_page.dart';
import 'pages/skill_page.dart';
import 'pages/shop_page.dart';
import 'pages/info_page.dart';
import 'pages/bag_page.dart';
import 'pages/log_page.dart';
import 'pages/achievement_page.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IndexPage(),
    );
  }
}