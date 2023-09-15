import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:liver_remake/PlayerData/playerData.dart';
import 'package:liver_remake/pages/create_character_page.dart';
import 'package:liver_remake/firebase/firebase_controller.dart';
import 'package:liver_remake/pages/main_page.dart';
import 'package:provider/provider.dart';

class IndexPage extends StatelessWidget{
  final Key? keyIndexPage;
  IndexPage({this.keyIndexPage}):super(key:keyIndexPage);



  @override
  Widget build(BuildContext context){
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final playerData = Provider.of<PlayerData>(context);
    return Scaffold(
      backgroundColor: const Color.fromRGBO(102, 214, 255, 100),
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/ThemePage_Background.png'),
                  fit: BoxFit.cover
              )
          ),
          child: Center(
            child: Column(
              children: [
                SizedBox(height: screenHeight * 0.3),
                Image.asset('assets/Logo.png'),
                SizedBox(height: screenHeight * 0.2),
                GestureDetector(
                    onTap: () async{
                      User? user = await loginGoogleAccount();
                      playerData.initPlayerData();
                      playerData.setUid(user!.uid);
                      final inUserDataOrNot = await checkUidInUserDataOrNot(user!.uid);
                      if(user!=null){
                        if(inUserDataOrNot!=null){
                          if(inUserDataOrNot){
                            getUserData(user!.uid,playerData).then(
                                    (_) => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const MainPage()))
                            );
                          }
                          else{
                            Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const CreateCharacterPage(),
                                )
                            );
                          }
                        }
                      }
                      else{
                        print('登錄失敗');
                      }
                    },
                    child: SizedBox(
                      width: 0.4*screenWidth,
                      height: 0.05*screenHeight,
                      child: Image.asset('assets/LoginButton.png',fit: BoxFit.cover,),
                    )
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}