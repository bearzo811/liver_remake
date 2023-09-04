import 'package:flutter/material.dart';
import 'package:liver_remake/pages/create_character_page.dart';

class IndexPage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color.fromRGBO(102, 214, 255, 100),
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
                    onTap: (){
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => CreateCharacterPage(),
                        )
                      );
                    },
                    child: Container(
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