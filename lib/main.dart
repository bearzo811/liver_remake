import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:liver_remake/PlayerData/playerData.dart';
import 'pages/index_page.dart';

void main()  {
  runApp(
      ChangeNotifierProvider(
        create: (context)=>PlayerData(),
        child: const MyApp(),
      ),
  );
}

class MyApp extends StatelessWidget{
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IndexPage(),
    );
  }
}
