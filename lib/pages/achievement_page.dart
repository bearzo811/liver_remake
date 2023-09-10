import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:liver_remake/pages/log_page.dart';
import 'package:liver_remake/pages/main_page.dart';
import 'package:liver_remake/pages/shop_page.dart';
import 'package:liver_remake/pages/skill_page.dart';
import 'package:liver_remake/pages/train_page.dart';
import 'package:liver_remake/widget/characterStatusBlock.dart';

class Achievement{
  int type =0 ; // 0: star | 1: little int | 2: little vit | 3: little str | 4: big int | 5: big vit | 6: big str
  String description='';
  String date = '';
  Achievement({
    required this.type,
    required this.description,
    required this.date
  });

}

class AchievementPage extends StatefulWidget{
  @override
  _AchievementPage createState() => _AchievementPage();
}

class _AchievementPage extends State<AchievementPage>{

  Player player = Player(
      bodyIndex: 2, earsTypeIndex: 0, earsColorIndex: 0, clothesIndex: 0, pantsIndex: 0, shoesIndex: 0,
      eyesTypeIndex: 0, eyesColorIndex: 0, mouthIndex: 0, backHairTypeIndex: 1, backHairColorIndex: 0,
      foreHairTypeIndex: 1, foreHairColorIndex: 0, backItemIndex: 0, eyeDecorationIndex: 0, heavyWeaponIndex: 0, lightWeaponIndex: 0,
      name: 'name', level: 99, STR:12,INT:70,VIT:19,hp:1,mp: 10, exp: 8, maxMp: 10, maxExp: 10, coin: 93);

  Widget menuBlock(double screenWidth, double screenHeight){
    return Container(
      width: 0.9*screenWidth,
      height: 0.5*screenHeight,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/Menu_UI.png'),
              fit: BoxFit.contain
          )
      ),
      child: Column(
        children: [
          SizedBox(height: 0.075*screenHeight,),
          GestureDetector(
            onTap: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MainPage()
                  )
              );
            },
            child: SizedBox(
              width: 0.6*screenWidth,
              height: 0.065*screenHeight,
              child: Image.asset('assets/New_Battle_Button.png',fit: BoxFit.contain,),
            ),
          ),
          GestureDetector(
            onTap: (){
              Navigator.of(context).pop();
            },
            child: SizedBox(
              width: 0.6*screenWidth,
              height: 0.065*screenHeight,
              child: Image.asset('assets/New_Train_Button.png',fit: BoxFit.contain,),
            ),
          ),
          GestureDetector(
            onTap: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context)=>SkillPage()
                  )
              );
            },
            child: SizedBox(
              width: 0.6*screenWidth,
              height: 0.065*screenHeight,
              child: Image.asset('assets/New_Skill_Button.png',fit: BoxFit.contain,),
            ),
          ),
          GestureDetector(
            onTap: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context)=>ShopPage()
                  )
              );
            },
            child: SizedBox(
              width: 0.6*screenWidth,
              height: 0.065*screenHeight,
              child: Image.asset('assets/New_Shop_Button.png',fit: BoxFit.contain,),
            ),
          ),
          GestureDetector(
            onTap: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context)=>LogPage()
                  )
              );
            },
            child: SizedBox(
              width: 0.6*screenWidth,
              height: 0.065*screenHeight,
              child: Image.asset('assets/New_Log_Button.png',fit: BoxFit.contain,),
            ),
          ),
          GestureDetector(
            onTap: (){
              print('Logout！');
            },
            child: SizedBox(
              width: 0.6*screenWidth,
              height: 0.065*screenHeight,
              child: Image.asset('assets/New_Logout_Button.png',fit: BoxFit.contain,),
            ),
          ),
        ],
      ),
    );
  }

  Widget logAndMenuBar(double screenWidth, double screenHeight){
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(left:0.41*screenWidth,right: 0.22*screenWidth),
          child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => LogPage()
                    )
                );
              },
              child: Container(
                width: 0.18*screenWidth,
                height: 0.08*screenHeight,
                child: Image.asset('assets/Achievement/Achievement_Log_Button.png',fit: BoxFit.cover,),
              )
          ),
        ),
        GestureDetector(
          onTap: (){
            showDialog(
                context: context,
                barrierDismissible: true,
                builder: (BuildContext context){
                  return AlertDialog(
                    backgroundColor: Color.fromRGBO(0, 0, 0, 0),
                    content: menuBlock(screenWidth, screenHeight),
                  );
                }
            );
          },
          child: Container(
            width: 0.18*screenWidth,
            height: 0.08*screenHeight,
            child: Image.asset('assets/Menu_Button.png',fit: BoxFit.cover,),
          ),
        ),
      ],
    );
  }

  Widget achievementBlock(double screenWidth, double screenHeight,Achievement achievement){
    return SizedBox(
      width: 0.3*screenWidth,
      height: 0.3*screenHeight,
      child: Column(
        children: [
          SizedBox(height: 0.02*screenHeight,),
          Container(
            height: 0.1*screenHeight,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/Achievement/${achievement.type}.png'),
                fit: BoxFit.contain
              )
            ),
          ),
          SizedBox(height: 0.02*screenHeight,),
          Container(
            height: 0.08*screenHeight,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/Achievement/Achievement_Signboard.png'),
                    fit: BoxFit.contain
                )
            ),
            child: Column(
              children: [
                SizedBox(height: 0.018*screenHeight,),
                SizedBox(
                  width: 0.3*screenWidth,
                  height: 0.03*screenHeight,
                  child: AutoSizeText(
                    achievement.description,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 0.01*screenHeight,),
                SizedBox(
                  width: 0.3*screenWidth,
                  height: 0.02*screenHeight,
                  //color: Colors.amber.withOpacity(0.3),
                  child: AutoSizeText(
                    achievement.date,
                    style: const TextStyle(
                        fontSize: 14,
                        color: Color(0xFFF6B989),
                        fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget achievementScene(double screenWidth, double screenHeight){
    return SizedBox(
      width: screenWidth,
      height: 0.62*screenHeight,
      child: ListView.builder(
        itemCount: (allAchievementList.length / 3).ceil(),
        itemBuilder: (context,row){
          int startIndex = row*3;
          int endIndex = startIndex+3;
          if(endIndex>allAchievementList.length){
            endIndex = allAchievementList.length;
          }

          List<Achievement> rowAchievement = allAchievementList.sublist(startIndex,endIndex);
          print('now row type: $row');
          return Row(
            children: rowAchievement.map((achievement){
              return Expanded(
                child: achievementBlock(screenWidth, screenHeight, achievement),
              );
            }).toList(),
          );
        },
      ),
    );
  }

  List<Achievement> allAchievementList = [
    Achievement(type: 0, description: '達到10級', date: '2023 / 09 / 10'),
    Achievement(type: 1, description: '達到10級', date: '2023 / 09 / 10'),
    Achievement(type: 4, description: '達到10級', date: '2023 / 09 / 10'),
    Achievement(type: 2, description: '達到10級', date: '2023 / 09 / 10'),
    Achievement(type: 6, description: '達到10級', date: '2023 / 09 / 10'),
    Achievement(type: 3, description: '達到10級', date: '2023 / 09 / 10'),
    Achievement(type: 5, description: '達到10級', date: '2023 / 09 / 10'),
    Achievement(type: 0, description: '達到10級', date: '2023 / 09 / 10'),
  ];

  @override
  Widget build(BuildContext context){
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
          child: Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/Achievement/Achievement_Background.png'),
                        fit: BoxFit.cover
                    )
                ),
              ),
              Column(
                children: [
                  characterStatusBlockWithInfoButton(screenWidth, screenHeight, player, context),
                  achievementScene(screenWidth, screenHeight),
                  SizedBox(height: 0.03*screenHeight,),
                  logAndMenuBar(screenWidth, screenHeight)
                ],
              ),
            ],
          )
      ),
    );
  }
}
