import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:liver_remake/pages/train_page.dart';
import 'package:liver_remake/pages/skill_page.dart';
import 'package:liver_remake/widget/characterStatusBlock.dart';

class MainPage extends StatefulWidget{
  @override
  _MainPage createState() => _MainPage();
}

class _MainPage extends State<MainPage>{

  Player _player = Player(2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0);
  int _battleSceneIndex = 0;
  double _monsterHpRatio = 0;
  String _monsterName = '';
  TextEditingController _monsterNameTextFieldController = TextEditingController();
  List<ImageProvider> _battleSceneFileName = [
    AssetImage('assets/BattleScene_Background_1_R.png'),
    AssetImage('assets/BattleScene_Background_2_B.png'),
    AssetImage('assets/BattleScene_Background_3_G.png')
  ] ;

  Widget BattleScene(double screenWidth, double screenHeight){
    List<ImageProvider> _battleSceneFileName = [
      AssetImage('assets/BattleScene_Background_1_R.png'),
      AssetImage('assets/BattleScene_Background_2_B.png'),
      AssetImage('assets/BattleScene_Background_3_G.png')
    ] ;

    return Container(
        width: screenWidth,
        height: screenHeight,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: _battleSceneFileName[_battleSceneIndex],
              fit: BoxFit.cover
          ),
        )
    );
  }

  Widget HpBarBlock(double screenWidth, double screenHeight,double hpRatio){
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
            valueColor: AlwaysStoppedAnimation<Color>(Color.fromRGBO(
                232, 29, 29, 0.8),),
            backgroundColor: Color.fromRGBO(0, 0, 0, 0),
          ),

        )
    );
  }


  Widget MonsterNameAndHpBarBlock(double screenWidth, double screenHeight){
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
        (_monsterHpRatio>0 ? HpBarBlock(screenWidth, screenHeight, _monsterHpRatio):
        Container(width: 0.6*screenWidth,
          height: 0.05*screenHeight,))
      ],
    );
  }

  Widget MonsterAndArrowBlock(double screenWidth, double screenHeight){
    List<ImageProvider> _monsterList = [
      AssetImage('assets/Monster_R_0.png'),
      AssetImage('assets/Monster_B_0.png'),
      AssetImage('assets/Monster_G_0.png'),
    ];

    Widget monsterImage(){
      return Container(
        width: 0.6*screenWidth,
        height: 0.4*screenHeight,
        decoration: BoxDecoration(
            image: DecorationImage(
              image: _monsterList[_battleSceneIndex],
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
                  backgroundColor: Color.fromRGBO(0, 0, 0, 0),
                  content: SingleChildScrollView(
                    child: CreateMonsterBlock(screenWidth, screenHeight),
                  ),
                );
              }
          );
        },
        child: Container(
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
                child: Container(
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
                child: Container(
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
            child: Container(
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
            child: Container(
              height: 0.0625*screenHeight,
              width: 0.125*screenWidth,
              child: Image.asset('assets/Right_Arrow.png',fit: BoxFit.cover,),
            ),
          )
        ],
      );
    }


  }

  Widget CreateMonsterBlock(double screenWidth, double screenHeight){
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
          Container(
            width: 0.6*screenWidth,
            child: Stack(
              children: [
                const Image(image: AssetImage('assets/Train_Add_TextBox.png'),fit: BoxFit.cover,),
                Container(
                  height: 0.05*screenHeight,
                  width: 0.6*screenWidth,
                  child: TextField(
                    controller: _monsterNameTextFieldController,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
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
                      _monsterName = _monsterNameTextFieldController.text;
                      _monsterHpRatio=1;
                    });
                    _monsterNameTextFieldController.clear();
                    Navigator.of(context).pop();
                  },
                  child: Container(
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

  Widget MenuBlock(double screenWidth, double screenHeight){
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
              print('Battle！');
              Navigator.of(context).pop();
            },
            child: Container(
              width: 0.6*screenWidth,
              height: 0.065*screenHeight,
              child: Image.asset('assets/New_Battle_Button.png',fit: BoxFit.contain,),
            ),
          ),
          GestureDetector(
            onTap: (){
              print('Train！');
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context)=>TrainPage()
                )
              );
            },
            child: Container(
              width: 0.6*screenWidth,
              height: 0.065*screenHeight,
              child: Image.asset('assets/New_Train_Button.png',fit: BoxFit.contain,),
            ),
          ),
          GestureDetector(
            onTap: (){
              print('Skill！');
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context)=>SkillPage()
                  )
              );
            },
            child: Container(
              width: 0.6*screenWidth,
              height: 0.065*screenHeight,
              child: Image.asset('assets/New_Skill_Button.png',fit: BoxFit.contain,),
            ),
          ),
          GestureDetector(
            onTap: (){
              print('Shop！');
            },
            child: Container(
              width: 0.6*screenWidth,
              height: 0.065*screenHeight,
              child: Image.asset('assets/New_Shop_Button.png',fit: BoxFit.contain,),
            ),
          ),
          GestureDetector(
            onTap: (){
              print('Log！');
            },
            child: Container(
              width: 0.6*screenWidth,
              height: 0.065*screenHeight,
              child: Image.asset('assets/New_Log_Button.png',fit: BoxFit.contain,),
            ),
          ),
          GestureDetector(
            onTap: (){
              print('Logout！');
            },
            child: Container(
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
              child: Container(
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
                  backgroundColor: Color.fromRGBO(0, 0, 0, 0),
                  content: MenuBlock(screenWidth, screenHeight),
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

  @override
  Widget build(BuildContext context){
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
              child: Stack(
                children: [
                  BattleScene(screenWidth, screenHeight),
                  Column(
                    children: [
                      CharacterStatusBlock(screenWidth, screenHeight,_player), //character status bar
                      SizedBox(height: 0.05*screenHeight,),
                      MonsterNameAndHpBarBlock(screenWidth, screenHeight),
                      SizedBox(height: 0.05*screenHeight,),
                      MonsterAndArrowBlock(screenWidth, screenHeight),//怪物 & 左右箭頭
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