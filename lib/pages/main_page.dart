import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:liver_remake/pages/shop_page.dart';
import 'package:liver_remake/pages/train_page.dart';
import 'package:liver_remake/pages/skill_page.dart';
import 'package:liver_remake/Model/Models.dart';

import 'log_page.dart';

class MainPage extends StatefulWidget{

  final Key? keyMainPage;
  const MainPage({this.keyMainPage}):super(key:keyMainPage);

  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage>{
  Player player = Player(
      bodyIndex: 2, earsTypeIndex: 0, earsColorIndex: 0, clothesIndex: 0, pantsIndex: 0, shoesIndex: 0,
      eyesTypeIndex: 0, eyesColorIndex: 0, mouthIndex: 0, backHairTypeIndex: 1, backHairColorIndex: 0,
      foreHairTypeIndex: 1, foreHairColorIndex: 0, backItemIndex: 0, eyeDecorationIndex: 0, heavyWeaponIndex: 0, lightWeaponIndex: 0,
      name: 'name', level: 99, STR:0,INT:0,VIT:0,hp:1,mp: 10, exp: 8, maxMp: 10, maxExp: 10, coin: 93);
  int _battleSceneIndex = 0;
  double _monsterHpRatio = 0;
  String _monsterName = '';
  TextEditingController monsterNameTextFieldController = TextEditingController();
  List<ImageProvider> battleSceneFileName = [
    const AssetImage('assets/BattleScene_Background_1_R.png'),
    const AssetImage('assets/BattleScene_Background_2_B.png'),
    const AssetImage('assets/BattleScene_Background_3_G.png')
  ] ;

  Widget battleScene(double screenWidth, double screenHeight){
    List<ImageProvider> battleSceneFileName = [
      const AssetImage('assets/BattleScene_Background_1_R.png'),
      const AssetImage('assets/BattleScene_Background_2_B.png'),
      const AssetImage('assets/BattleScene_Background_3_G.png')
    ] ;

    return Container(
        width: screenWidth,
        height: screenHeight,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: battleSceneFileName[_battleSceneIndex],
              fit: BoxFit.cover
          ),
        )
    );
  }

  Widget hpBarBlock(double screenWidth, double screenHeight,double hpRatio){
    return Container(
        width: 0.6*screenWidth,
        height: 0.05*screenHeight,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/CharacterStatus/Groove/HP_Groove.png'),
            fit: BoxFit.contain,
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(40.0),
          child: LinearProgressIndicator(
            value: hpRatio,
            valueColor: const AlwaysStoppedAnimation<Color>(Color.fromRGBO(
                232, 29, 29, 0.8),),
            backgroundColor: const Color.fromRGBO(0, 0, 0, 0),
          ),

        )
    );
  }


  Widget monsterNameAndHpBarBlock(double screenWidth, double screenHeight){
    return Column(
      children: [
        Container(
          width: 0.3*screenWidth,
          color: Colors.white70.withOpacity((_monsterHpRatio>0 ? 0.5 : 0)),
          child: SizedBox(
            width: 0.3*screenWidth,
            child: AutoSizeText(
              _monsterName,
              style: const TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                  fontWeight: FontWeight.bold
              ),
              maxLines: 1,
              textAlign: TextAlign.center,
            ),
          ),
        ), //怪物名稱
        SizedBox(height: 0.0035*screenHeight,),
        (_monsterHpRatio>0 ? hpBarBlock(screenWidth, screenHeight, _monsterHpRatio):
        SizedBox(width: 0.6*screenWidth,
          height: 0.05*screenHeight,))
      ],
    );
  }

  Widget monsterAndArrowBlock(double screenWidth, double screenHeight){
    List<ImageProvider> monsterList = [
      const AssetImage('assets/Monster_R_0.png'),
      const AssetImage('assets/Monster_B_0.png'),
      const AssetImage('assets/Monster_G_0.png'),
    ];

    Widget monsterImage(){
      return Container(
        width: 0.6*screenWidth,
        height: 0.4*screenHeight,
        decoration: BoxDecoration(
            image: DecorationImage(
              image: monsterList[_battleSceneIndex],
              fit: BoxFit.cover,
            )
        ),
      );
    }

    Widget monsterCreate(){
      return GestureDetector(
        onTap: (){
          showDialog(
              context: context,
              barrierDismissible: true,
              builder: (BuildContext context){
                return AlertDialog(
                  backgroundColor: const Color.fromRGBO(0, 0, 0, 0),
                  content: SingleChildScrollView(
                    child: createMonsterBlock(screenWidth, screenHeight),
                  ),
                );
              }
          );
        },
        child: SizedBox(
          height: 0.0625*screenHeight,
          width: 0.125*screenWidth,
          child: Image.asset('assets/Train_Add_Button.png',fit: BoxFit.cover,),
        ),
      );
    }

    if(_monsterHpRatio <=0){
      return Column(
        children: [
          SizedBox(height: 0.17*screenHeight,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: (){
                  setState(() {
                    if(_battleSceneIndex>0){
                      _battleSceneIndex--;
                    }
                    else{
                      _battleSceneIndex=2;
                    }
                  });
                },
                child: SizedBox(
                  height: 0.0625*screenHeight,
                  width: 0.125*screenWidth,
                  child: Image.asset('assets/Left_Arrow.png',fit: BoxFit.cover,),
                ),
              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 0.3*screenWidth),
                  child: monsterCreate()
              ),
              GestureDetector(
                onTap: (){
                  setState(() {
                    if(_battleSceneIndex<2){
                      _battleSceneIndex++;
                    }
                    else{
                      _battleSceneIndex=0;
                    }
                  });
                },
                child: SizedBox(
                  height: 0.0625*screenHeight,
                  width: 0.125*screenWidth,
                  child: Image.asset('assets/Right_Arrow.png',fit: BoxFit.cover,),
                ),
              )
            ],
          ),
          SizedBox(height: 0.17*screenHeight,),
        ],
      );
    }
    else{
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: (){
              setState(() {
                if(_battleSceneIndex>0){
                  _battleSceneIndex--;
                }
                else{
                  _battleSceneIndex=2;
                }
              });
            },
            child: SizedBox(
              height: 0.0625*screenHeight,
              width: 0.125*screenWidth,
              child: Image.asset('assets/Left_Arrow.png',fit: BoxFit.cover,),
            ),
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 0.05*screenWidth),
              child: monsterImage()
          ),
          GestureDetector(
            onTap: (){
              setState(() {
                if(_battleSceneIndex<2){
                  _battleSceneIndex++;
                }
                else{
                  _battleSceneIndex=0;
                }
              });
            },
            child: SizedBox(
              height: 0.0625*screenHeight,
              width: 0.125*screenWidth,
              child: Image.asset('assets/Right_Arrow.png',fit: BoxFit.cover,),
            ),
          )
        ],
      );
    }


  }

  Widget createMonsterBlock(double screenWidth, double screenHeight){
    return Container(
      width: 0.9*screenWidth,
      height: 0.25*screenHeight,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/Train_Add_Windows.png'),
              fit: BoxFit.contain
          )
      ),
      child: Column(
        children: [
          SizedBox(height: 0.08*screenHeight,),
          SizedBox(
            width: 0.6*screenWidth,
            child: Stack(
              children: [
                const Image(image: AssetImage('assets/Train_Add_TextBox.png'),fit: BoxFit.cover,),
                SizedBox(
                  height: 0.05*screenHeight,
                  width: 0.6*screenWidth,
                  child: TextField(
                    controller: monsterNameTextFieldController,
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: '請輸入習慣名稱',
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 0.02*screenHeight,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                  onTap: (){
                    setState(() {
                      _monsterName = monsterNameTextFieldController.text;
                      _monsterHpRatio=1;
                    });
                    monsterNameTextFieldController.clear();
                    Navigator.of(context).pop();
                  },
                  child: SizedBox(
                    width: 0.4*screenWidth,
                    height: 0.05*screenHeight,
                    child: Image.asset('assets/OKButton.png',fit: BoxFit.cover,),
                  )
              ),
            ],
          )
        ],
      ),
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
              Navigator.of(context).pop();
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
                      builder: (context)=>const TrainPage()
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

  Widget attackMenuBar(double screenWidth, double screenHeight){
    return Row(
      //mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(left:0.41*screenWidth,right: 0.22*screenWidth),
          child: GestureDetector(
              onTap: (){},
              child: SizedBox(
                width: 0.18*screenWidth,
                height: 0.08*screenHeight,
                child: Image.asset('assets/Attack_Button.png',fit: BoxFit.cover,),
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
    return Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
              child: Stack(
                children: [
                  battleScene(screenWidth, screenHeight),
                  Column(
                    children: [
                      characterStatusBlockWithInfoButton(screenWidth, screenHeight,player,context), //character status bar
                      SizedBox(height: 0.05*screenHeight,),
                      monsterNameAndHpBarBlock(screenWidth, screenHeight),
                      SizedBox(height: 0.05*screenHeight,),
                      monsterAndArrowBlock(screenWidth, screenHeight),//怪物 & 左右箭頭
                      SizedBox(height: 0.05*screenHeight,),
                      attackMenuBar(screenWidth, screenHeight),
                    ],
                  )
                ],
              )
          ),
        )
    );
  }
}


/*

 */