import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:liver_remake/PlayerData/playerData.dart';
import 'package:liver_remake/pages/shop_page.dart';
import 'package:liver_remake/pages/train_page.dart';
import 'package:liver_remake/pages/skill_page.dart';
import 'package:liver_remake/pages/log_page.dart';
import 'package:liver_remake/Model/Models.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget{

  final Key? keyMainPage;
  const MainPage({this.keyMainPage}):super(key:keyMainPage);

  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage>{
  int _battleSceneIndex = 0;
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

  Widget monsterNameAndHpBarBlock(double screenWidth, double screenHeight,Monster monster){
    double monsterHpRatio = monster.monsterHp/monster.monsterMaxHp;
    String monsterName = monster.monsterName;
    if(monsterHpRatio>0){
      return Column(
        children: [
          Container(
            width: 0.3*screenWidth,
            color: Colors.white70.withOpacity((monsterHpRatio>0 ? 0.5 : 0)),
            child: SizedBox(
              width: 0.3*screenWidth,
              child: AutoSizeText(
                monsterName,
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
          (monsterHpRatio>0 ? hpBarBlock(screenWidth, screenHeight, monster):
          SizedBox(width: 0.6*screenWidth,
            height: 0.05*screenHeight,))
        ],
      );
    }
    else{
      return Column(
        children: [
          SizedBox(
            width: 0.6*screenWidth,
            height: 0.1*screenHeight,
          )
        ],
      );
    }
  }

  Widget hpBarBlock(double screenWidth, double screenHeight,Monster monster){
    double hpRatio = monster.monsterHp/monster.monsterMaxHp;
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

  Widget monsterAndArrowBlock(double screenWidth, double screenHeight,Monster monster){
    double monsterHpRatio = monster.monsterHp/monster.monsterMaxHp;
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

    if(monsterHpRatio>0){
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
    else{
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

  }

  Widget createMonsterBlock(double screenWidth, double screenHeight){
    final playerData = Provider.of<PlayerData>(context);
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
                    playerData.createMonster(_battleSceneIndex, monsterNameTextFieldController.text);
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

  Widget attackMenuBar(double screenWidth, double screenHeight,Monster monster){
    final playerData = Provider.of<PlayerData>(context);
    return SizedBox(
      height: 0.18*screenHeight,
      child: Row(
        children: [
          SizedBox(
            width: 0.35*screenWidth,
            height: 0.17*screenHeight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Expanded(
                        child: Visibility(
                            visible: playerData.skillModelList[0][0].hasUsed,
                            child: const Image(
                              image:AssetImage('assets/Skill_Icon_STR_0_Primary_Circle.png'),
                              fit: BoxFit.cover,
                            )
                        )
                    ),
                    Expanded(
                        child: Visibility(
                            visible: playerData.skillModelList[0][1].hasUsed,
                            child: const Image(
                              image:AssetImage('assets/Skill_Icon_STR_1_Intermediate_Circle.png'),
                              fit: BoxFit.cover,
                            )
                        )
                    ),
                    Expanded(
                        child: Visibility(
                            visible: playerData.skillModelList[0][2].hasUsed,
                            child: const Image(
                              image:AssetImage('assets/Skill_Icon_STR_2_Advance_Circle.png'),
                              fit: BoxFit.cover,
                            )
                        )
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                        child: Visibility(
                            visible: playerData.skillModelList[1][0].hasUsed,
                            child: const Image(
                              image:AssetImage('assets/Skill_Icon_INT_0_Primary_Circle.png'),
                              fit: BoxFit.cover,
                            )
                        )
                    ),
                    Expanded(
                        child: Visibility(
                            visible: playerData.skillModelList[1][1].hasUsed,
                            child: const Image(
                              image:AssetImage('assets/Skill_Icon_INT_1_Intermediate_Circle.png'),
                              fit: BoxFit.cover,
                            )
                        )
                    ),
                    Expanded(
                        child: Visibility(
                            visible: playerData.skillModelList[1][2].hasUsed,
                            child: const Image(
                              image:AssetImage('assets/Skill_Icon_INT_2_Advance_Circle.png'),
                              fit: BoxFit.cover,
                            )
                        )
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                        child: Visibility(
                            visible: playerData.skillModelList[2][0].hasUsed,
                            child: const Image(
                              image:AssetImage('assets/Skill_Icon_VIT_0_Primary_Circle.png'),
                              fit: BoxFit.cover,
                            )
                        )
                    ),
                    Expanded(
                        child: Visibility(
                            visible: playerData.skillModelList[2][1].hasUsed,
                            child: const Image(
                              image:AssetImage('assets/Skill_Icon_VIT_1_Intermediate_Circle.png'),
                              fit: BoxFit.cover,
                            )
                        )
                    ),
                    Expanded(
                        child: Visibility(
                            visible: playerData.skillModelList[2][2].hasUsed,
                            child: const Image(
                              image:AssetImage('assets/Skill_Icon_VIT_2_Advance_Circle.png'),
                              fit: BoxFit.cover,
                            )
                        )
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(width: 0.07*screenWidth,),
          Column(
            children: [
              SizedBox(height: 0.088*screenHeight,),
              GestureDetector(
                  onTap: (){
                    if(!monster.hasBeAttacked && monster.monsterHp>0){
                      playerData.attackMonster(_battleSceneIndex);
                    }
                  },
                  child: SizedBox(
                    width: 0.18*screenWidth,
                    height: 0.08*screenHeight,
                    child: ((monster.hasBeAttacked || monster.monsterHp<=0) ? Image.asset('assets/Attack_Button_Unvailable.png',fit: BoxFit.cover,) : Image.asset('assets/Attack_Button.png',fit: BoxFit.cover,)),
                  )
              ),
            ],
          ),
          SizedBox(width: 0.2*screenWidth,),
          Column(
            children: [
              SizedBox(height: 0.088*screenHeight,),
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
          )

        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context){
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final player = Provider.of<PlayerData>(context).player;
    final monsterList = Provider.of<PlayerData>(context).allMonsterList;
    Provider.of<PlayerData>(context).checkMonsterAttacked();
    return Scaffold(
        body: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: SafeArea(
              child: Stack(
                children: [
                  battleScene(screenWidth, screenHeight),
                  Column(
                    children: [
                      characterStatusBlockWithInfoButton(screenWidth, screenHeight,player,context), //character status bar
                      SizedBox(height: 0.02*screenHeight,),
                      monsterNameAndHpBarBlock(screenWidth, screenHeight,monsterList[_battleSceneIndex]),
                      SizedBox(height: 0.04*screenHeight,),
                      monsterAndArrowBlock(screenWidth, screenHeight,monsterList[_battleSceneIndex]),//怪物 & 左右箭頭
                      attackMenuBar(screenWidth, screenHeight,monsterList[_battleSceneIndex]),
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