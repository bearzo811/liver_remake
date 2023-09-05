import 'package:flutter/material.dart';
import 'pages/index_page.dart';
import 'pages/create_character_page.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CreateCharacterPage(),
    );
  }
}