import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:liver_remake/PlayerData/playerData.dart';
import 'pages/index_page.dart';
import 'package:firebase_core/firebase_core.dart';


void main()  async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
      ChangeNotifierProvider(
        create: (context)=>PlayerData(),
        child: MyApp(),
      ),
  );
}

class MyApp extends StatelessWidget{
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IndexPage(),
    );
  }
}
