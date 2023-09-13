import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:liver_remake/PlayerData/playerData.dart';
import 'package:liver_remake/pages/log_page.dart';
import 'package:liver_remake/pages/main_page.dart';
import 'package:liver_remake/pages/shop_page.dart';
import 'package:liver_remake/pages/skill_page.dart';
import 'package:liver_remake/pages/train_page.dart';
import 'package:liver_remake/Model/Models.dart';
import 'package:provider/provider.dart';

class AchievementPage extends StatefulWidget{
  final Key? keyAchievementPage;
  const AchievementPage({this.keyAchievementPage}):super(key:keyAchievementPage);
  @override
  AchievementPageState createState() => AchievementPageState();
}

class AchievementPageState extends State<AchievementPage>{

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
                      builder: (context) => const MainPage()
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
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const TrainPage()
                  )
              );
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
                      builder: (context)=>const SkillPage()
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
                      builder: (context)=>const ShopPage()
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
                      builder: (context)=>const LogPage()
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
                        builder: (context) => const LogPage()
                    )
                );
              },
              child: SizedBox(
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
                    backgroundColor: const Color.fromRGBO(0, 0, 0, 0),
                    content: menuBlock(screenWidth, screenHeight),
                  );
                }
            );
          },
          child: SizedBox(
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
                      fontSize: 16,
                      fontWeight: FontWeight.bold
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 1,
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
    List<Achievement> allAchievementList = Provider.of<PlayerData>(context).allAchievementList;
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

  @override
  Widget build(BuildContext context){
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final player = Provider.of<PlayerData>(context).player;
    Provider.of<PlayerData>(context).checkMonsterAttacked();
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
