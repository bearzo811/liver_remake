import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:liver_remake/PlayerData/playerData.dart';
import 'package:liver_remake/pages/achievement_page.dart';
import 'package:liver_remake/pages/main_page.dart';
import 'package:liver_remake/pages/shop_page.dart';
import 'package:liver_remake/pages/skill_page.dart';
import 'package:liver_remake/pages/train_page.dart';
import 'package:liver_remake/Model/Models.dart';
import 'package:provider/provider.dart';



class LogPage extends StatefulWidget{
  final Key? keyLogPage;
  const LogPage({this.keyLogPage}):super(key:keyLogPage);
  @override
  LogPageState createState() => LogPageState();
}

class LogPageState extends State<LogPage>{

  Widget attackLogBar(double screenWidth,double screenHeight,String playerName,String monsterName,int attackPoint){
    return Container(
      height: 0.1*screenHeight,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/Log/Log_BattleLog.png'),
          fit: BoxFit.contain
        )
      ),
      child: Row(
        children: [
          SizedBox(width: 0.15*screenWidth,height: 0.1*screenHeight,),
          Column(
            children: [
              SizedBox(height: 0.02*screenHeight,),
              SizedBox(
                width: 0.65*screenWidth,
                //height: 0.1*screenHeight,
                child: AutoSizeText(
                  '$playerName 攻擊了 $monsterName',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Color(0xFF924101),
                  ),
                  maxLines: 1,
                ),
              ),
              SizedBox(
                width: 0.65*screenWidth,
                child: AutoSizeText(
                  '造成了 $attackPoint 點傷害',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Color(0xFF924101),
                  ),
                  maxLines: 1,
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget interestLogBar(double screenWidth,double screenHeight,String playerName,String trainName,int trainLevel,int trainAddSTR,int trainAddINT,int trainAddVIT,int trainAddEXP){
    return Container(
      height: 0.1*screenHeight,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/Log/Log_InterestLog.png'),
              fit: BoxFit.contain
          )
      ),
      child: Row(
        children: [
          SizedBox(width: 0.15*screenWidth,height: 0.1*screenHeight,),
          Column(
            children: [
              SizedBox(height: 0.02*screenHeight,),
              SizedBox(
                width: 0.65*screenWidth,
                //height: 0.1*screenHeight,
                child: AutoSizeText(
                  '$playerName 完成了 $trainName LV$trainLevel',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Color(0xFF924101),
                  ),
                  maxLines: 1,
                ),
              ),
              SizedBox(height: 0.005*screenHeight,),
              SizedBox(
                width: 0.65*screenWidth,
                child: AutoSizeText(
                  'STR + $trainAddSTR | INT + $trainAddINT | VIT + $trainAddVIT | EXP + $trainAddEXP',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Color(0xFF924101),
                  ),
                  maxLines: 1,
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget deadLogBar(double screenWidth,double screenHeight,String playerName,int deadLoseSTR,int deadLoseINT,int deadLoseVIT,int deadLoseEXP,String monsterName){
    return Container(
      height: 0.1*screenHeight,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/Log/Log_DeadLog.png'),
              fit: BoxFit.contain
          )
      ),
      child: Row(
        children: [
          SizedBox(width: 0.15*screenWidth,height: 0.1*screenHeight,),
          Column(
            children: [
              SizedBox(height: 0.02*screenHeight,),
              SizedBox(
                width: 0.65*screenWidth,
                //height: 0.1*screenHeight,
                child: AutoSizeText(
                  '$playerName 被 $monsterName 擊殺',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Color(0xFF924101),
                  ),
                  maxLines: 1,
                ),
              ),
              SizedBox(height: 0.008*screenHeight,),
              SizedBox(
                width: 0.65*screenWidth,
                child: AutoSizeText(
                  '損失了 $deadLoseSTR點STR、$deadLoseINT點INT、$deadLoseVIT點VIT、$deadLoseEXP點EXP',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Color(0xFF924101),
                  ),
                  maxLines: 1,
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget dateLogBar(double screenWidth,double screenHeight,String date){
    return Container(
      height: 0.1*screenHeight,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/Log/Log_SplitLine.png'),
              fit: BoxFit.contain
          )
      ),
      child: Center(
        child: AutoSizeText(
          date,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Color(0xFF924101),
          ),
          maxLines: 1,
        ),
      ),
    );
  }

  Widget logBar(double screenWidth,double screenHeight,Log log){
    switch(log.logType){
      case 0: return attackLogBar(screenWidth, screenHeight, log.playerName, log.monsterName, log.attackPoint);
      case 1: return interestLogBar(screenWidth, screenHeight, log.playerName, log.trainName, log.trainLevel, log.trainAddSTR, log.trainAddINT, log.trainAddVIT, log.trainAddEXP);
      case 2: return deadLogBar(screenWidth, screenHeight, log.playerName, log.deadLoseSTR, log.deadLoseINT, log.deadLoseVIT, log.deadLoseEXP, log.monsterName);
      case 3: return dateLogBar(screenWidth, screenHeight, log.date);
      default: return Container();
    }
  }

  Widget logScene(double screenWidth,double screenHeight){
    List<Log> allLogList = Provider.of<PlayerData>(context).allLogList;
    return Container(
      width: 0.9*screenWidth,
      height: 0.62*screenHeight,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/Log/Log_UI.png'),
              fit: BoxFit.contain
          )
      ),
      child: Column(
        children: [
          SizedBox(height: 0.12*screenHeight,),
          SizedBox(
            height: 0.41*screenHeight,
            width: 0.8*screenWidth,
            child: ListView.builder(
              itemCount: allLogList.length,
              itemBuilder: (BuildContext context, int index){
                return logBar(screenWidth, screenHeight, allLogList[index]);
              },
            )
          )
        ],
      )
    );
  }

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
                      builder: (context) => const SkillPage()
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
                      builder: (context) => const ShopPage()
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
              Navigator.of(context).pop();
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

  Widget achievementAndMenuBar(double screenWidth, double screenHeight){
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(left:0.41*screenWidth,right: 0.22*screenWidth),
          child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context)=>const AchievementPage())
                );
              },
              child: SizedBox(
                width: 0.18*screenWidth,
                height: 0.08*screenHeight,
                child: Image.asset('assets/Log/Log_Achievement_Button.png',fit: BoxFit.cover,),
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

  @override
  Widget build(BuildContext context){
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final player = Provider.of<PlayerData>(context).player;
    return Scaffold(
      backgroundColor: const Color(0xFFE2C799),
      body: SafeArea(
        child: Column(
          children: [
            characterStatusBlockWithInfoButton(screenWidth, screenHeight, player, context),
            SizedBox(height: 0.03*screenHeight,),
            logScene(screenWidth, screenHeight),
            achievementAndMenuBar(screenWidth, screenHeight)
          ],
        ),
      ),
    );
  }
}