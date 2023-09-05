import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class MainPage extends StatefulWidget{
  @override
  _MainPage createState() => _MainPage();
}

class _MainPage extends State<MainPage>{

  int _battleSceneIndex = 0;
  int _bodyIndex = 2;
  int _earsTypeIndex = 1;
  int _earsColorIndex = 0;
  int _clothesIndex = 0;
  int _pantsIndex = 0;
  int _shoesIndex = 0;
  int _eyesTypeIndex = 0;
  int _eyesColorIndex = 0;
  int _mouthIndex = 0;
  int _backHairTypeIndex = 0;
  int _backHairColorIndex = 1;
  int _foreHairTypeIndex = 2;
  int _foreHairColorIndex = 1;

  Widget character(double screenWidth, double screenHeight,int _bodyIndex,int _earsTypeIndex,
      int _earsColorIndex,int _eyesTypeIndex, int _eyesColorIndex,int _mouthIndex,
      int _backHairTypeIndex, int _backHairColorIndex,int _foreHairTypeIndex, int _foreHairColorIndex,){
    List<ImageProvider> _bodyList = [
      AssetImage('assets/Head_Body/0.png'),
      AssetImage('assets/Head_Body/1.png'),
      AssetImage('assets/Head_Body/2.png'),
      AssetImage('assets/Head_Body/3.png'),
      AssetImage('assets/Head_Body/4.png')
    ];

    List<List<ImageProvider>> _earsList =[
      [
        AssetImage('assets/Ears/0-0.png'),
        AssetImage('assets/Ears/0-1.png'),
        AssetImage('assets/Ears/0-2.png'),
        AssetImage('assets/Ears/0-3.png'),
        AssetImage('assets/Ears/0-4.png'),
      ],
      [
        AssetImage('assets/Ears/1-0.png'),
        AssetImage('assets/Ears/1-1.png'),
        AssetImage('assets/Ears/1-2.png'),
        AssetImage('assets/Ears/1-3.png'),
        AssetImage('assets/Ears/1-4.png'),
      ],
    ];

    List<ImageProvider> _clothesList = [
      AssetImage('assets/Clothes/0.png'),
      AssetImage('assets/Clothes/1.png'),
      AssetImage('assets/Clothes/2.png'),
      AssetImage('assets/Clothes/3.png'),
      AssetImage('assets/Clothes/4.png'),
      AssetImage('assets/Clothes/5.png'),
      AssetImage('assets/Clothes/6.png'),
      AssetImage('assets/Clothes/7.png'),
    ];

    List<ImageProvider> _pantsList = [
      AssetImage('assets/Pants/0.png'),
      AssetImage('assets/Pants/1.png'),
      AssetImage('assets/Pants/2.png'),
      AssetImage('assets/Pants/3.png'),
      AssetImage('assets/Pants/4.png'),
      AssetImage('assets/Pants/5.png'),
      AssetImage('assets/Pants/6.png'),
      AssetImage('assets/Pants/7.png'),
      AssetImage('assets/Pants/8.png'),
      AssetImage('assets/Pants/9.png'),
      AssetImage('assets/Pants/10.png'),
      AssetImage('assets/Pants/11.png'),
    ];

    List<ImageProvider> _shoesList = [
      AssetImage('assets/Shoes/0.png'),
      AssetImage('assets/Shoes/1.png'),
      AssetImage('assets/Shoes/2.png'),
      AssetImage('assets/Shoes/3.png'),
      AssetImage('assets/Shoes/4.png'),
      AssetImage('assets/Shoes/5.png'),
    ];

    List<List<ImageProvider>> _eyesList =[
      [
        AssetImage('assets/Eyes/0-0.png'),
        AssetImage('assets/Eyes/0-1.png'),
        AssetImage('assets/Eyes/0-2.png'),
        AssetImage('assets/Eyes/0-3.png'),
        AssetImage('assets/Eyes/0-4.png'),
        AssetImage('assets/Eyes/0-5.png'),
        AssetImage('assets/Eyes/0-6.png'),
        AssetImage('assets/Eyes/0-7.png'),
        AssetImage('assets/Eyes/0-8.png'),
        AssetImage('assets/Eyes/0-9.png'),
      ],
      [
        AssetImage('assets/Eyes/1-0.png'),
        AssetImage('assets/Eyes/1-1.png'),
        AssetImage('assets/Eyes/1-2.png'),
        AssetImage('assets/Eyes/1-3.png'),
        AssetImage('assets/Eyes/1-4.png'),
        AssetImage('assets/Eyes/1-5.png'),
        AssetImage('assets/Eyes/1-6.png'),
        AssetImage('assets/Eyes/1-7.png'),
        AssetImage('assets/Eyes/1-8.png'),
        AssetImage('assets/Eyes/1-9.png'),
      ],
      [
        AssetImage('assets/Eyes/2-0.png'),
        AssetImage('assets/Eyes/2-1.png'),
        AssetImage('assets/Eyes/2-2.png'),
        AssetImage('assets/Eyes/2-3.png'),
        AssetImage('assets/Eyes/2-4.png'),
        AssetImage('assets/Eyes/2-5.png'),
        AssetImage('assets/Eyes/2-6.png'),
        AssetImage('assets/Eyes/2-7.png'),
        AssetImage('assets/Eyes/2-8.png'),
        AssetImage('assets/Eyes/2-9.png'),
      ],
      [
        AssetImage('assets/Eyes/3-0.png'),
        AssetImage('assets/Eyes/3-1.png'),
        AssetImage('assets/Eyes/3-2.png'),
        AssetImage('assets/Eyes/3-3.png'),
        AssetImage('assets/Eyes/3-4.png'),
        AssetImage('assets/Eyes/3-5.png'),
        AssetImage('assets/Eyes/3-6.png'),
        AssetImage('assets/Eyes/3-7.png'),
        AssetImage('assets/Eyes/3-8.png'),
        AssetImage('assets/Eyes/3-9.png'),
      ],
    ];

    List<ImageProvider> _mouthList = [
      AssetImage('assets/Mouth/0.png'),
      AssetImage('assets/Mouth/1.png'),
      AssetImage('assets/Mouth/2.png'),
      AssetImage('assets/Mouth/3.png'),
      AssetImage('assets/Mouth/4.png'),
    ];

    List<List<ImageProvider>> _backHairList =[
      [
        AssetImage('assets/BackHair/0-0.png'),
        AssetImage('assets/BackHair/0-1.png'),
        AssetImage('assets/BackHair/0-2.png'),
        AssetImage('assets/BackHair/0-3.png'),
        AssetImage('assets/BackHair/0-4.png'),
        AssetImage('assets/BackHair/0-5.png'),
        AssetImage('assets/BackHair/0-6.png'),
        AssetImage('assets/BackHair/0-7.png'),
        AssetImage('assets/BackHair/0-8.png'),
      ],
      [
        AssetImage('assets/BackHair/1-0.png'),
        AssetImage('assets/BackHair/1-1.png'),
        AssetImage('assets/BackHair/1-2.png'),
        AssetImage('assets/BackHair/1-3.png'),
        AssetImage('assets/BackHair/1-4.png'),
        AssetImage('assets/BackHair/1-5.png'),
        AssetImage('assets/BackHair/1-6.png'),
        AssetImage('assets/BackHair/1-7.png'),
        AssetImage('assets/BackHair/1-8.png'),
      ],
      [
        AssetImage('assets/BackHair/2.png'),
      ],
    ];

    List<List<ImageProvider>> _foreHairList =[
      [
        AssetImage('assets/ForeHair/0.png'),
      ],
      [
        AssetImage('assets/ForeHair/1-0.png'),
        AssetImage('assets/ForeHair/1-1.png'),
        AssetImage('assets/ForeHair/1-2.png'),
        AssetImage('assets/ForeHair/1-3.png'),
        AssetImage('assets/ForeHair/1-4.png'),
        AssetImage('assets/ForeHair/1-5.png'),
        AssetImage('assets/ForeHair/1-6.png'),
        AssetImage('assets/ForeHair/1-7.png'),
        AssetImage('assets/ForeHair/1-8.png'),
      ],
      [
        AssetImage('assets/ForeHair/2-0.png'),
        AssetImage('assets/ForeHair/2-1.png'),
        AssetImage('assets/ForeHair/2-2.png'),
        AssetImage('assets/ForeHair/2-3.png'),
        AssetImage('assets/ForeHair/2-4.png'),
        AssetImage('assets/ForeHair/2-5.png'),
        AssetImage('assets/ForeHair/2-6.png'),
        AssetImage('assets/ForeHair/2-7.png'),
        AssetImage('assets/ForeHair/2-8.png'),
      ],
      [
        AssetImage('assets/ForeHair/3-0.png'),
        AssetImage('assets/ForeHair/3-1.png'),
        AssetImage('assets/ForeHair/3-2.png'),
        AssetImage('assets/ForeHair/3-3.png'),
        AssetImage('assets/ForeHair/3-4.png'),
        AssetImage('assets/ForeHair/3-5.png'),
        AssetImage('assets/ForeHair/3-6.png'),
        AssetImage('assets/ForeHair/3-7.png'),
        AssetImage('assets/ForeHair/3-8.png'),
      ],
    ];

    return Container(
      height: 0.28*screenHeight,
      width: 0.35*screenWidth,
      child: Column(
        children: [
          SizedBox(height: 0.03*screenHeight),
          Stack(
            children: [
              Image(image:_backHairList[_backHairTypeIndex][_backHairColorIndex],fit: BoxFit.cover),
              Image(image:_bodyList[_bodyIndex],fit: BoxFit.cover),
              Image(image:_foreHairList[_foreHairTypeIndex][_foreHairColorIndex],fit: BoxFit.cover),
              Image(image:_clothesList[_clothesIndex],fit: BoxFit.cover),
              Image(image:_earsList[_earsTypeIndex][_earsColorIndex],fit: BoxFit.cover),
              Image(image:_eyesList[_eyesTypeIndex][_eyesColorIndex],fit: BoxFit.cover),
              Image(image:_mouthList[_mouthIndex],fit: BoxFit.cover),
              Image(image:_pantsList[_pantsIndex],fit: BoxFit.cover),
              Image(image:_shoesList[_shoesIndex],fit: BoxFit.cover),
            ],
          )
        ],
      ),
    );
  }

  Widget BattleScene(){
    List<ImageProvider> _battleSceneFileName = [
      AssetImage('assets/BattleScene_Background_1_R.png'),
      AssetImage('assets/BattleScene_Background_2_B.png'),
      AssetImage('assets/BattleScene_Background_3_G.png')
    ] ;

    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: _battleSceneFileName[_battleSceneIndex],
              fit: BoxFit.cover
          ),
        )
    );
  }

  Widget NumberBlock(double screenWidth, double screenHeight,int number){
    
    List<ImageProvider> _numberList =[
      AssetImage('assets/CharacterStatus/New_CharacterStatus_LV_Number_0.png'),
      AssetImage('assets/CharacterStatus/New_CharacterStatus_LV_Number_1.png'),
      AssetImage('assets/CharacterStatus/New_CharacterStatus_LV_Number_2.png'),
      AssetImage('assets/CharacterStatus/New_CharacterStatus_LV_Number_3.png'),
      AssetImage('assets/CharacterStatus/New_CharacterStatus_LV_Number_4.png'),
      AssetImage('assets/CharacterStatus/New_CharacterStatus_LV_Number_5.png'),
      AssetImage('assets/CharacterStatus/New_CharacterStatus_LV_Number_6.png'),
      AssetImage('assets/CharacterStatus/New_CharacterStatus_LV_Number_7.png'),
      AssetImage('assets/CharacterStatus/New_CharacterStatus_LV_Number_8.png'),
      AssetImage('assets/CharacterStatus/New_CharacterStatus_LV_Number_9.png'),
    ];
    return Container(
      height: 0.03*screenHeight,
      width: 0.35*screenWidth,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image(image: _numberList[(number/10000).toInt()%10]),
          Image(image: _numberList[(number/1000).toInt()%10]),
          Image(image: _numberList[(number/100).toInt()%10]),
          Image(image: _numberList[(number/10).toInt()%10]),
          Image(image: _numberList[number%10]),
        ],
      ),
    );
  }

  Widget CharacterStatusBlock(double screenWidth, double screenHeight){
    return Container(
      width: screenWidth,
      height: 0.2*screenHeight,
      decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/CharacterStatus/CharacterStatus_All.png'),
            fit: BoxFit.cover,
          )
      ),
      child: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Stack(
                children: [
                  character(screenWidth, screenHeight, _bodyIndex, _earsTypeIndex, _earsColorIndex, _eyesTypeIndex, _eyesColorIndex, _mouthIndex, _backHairTypeIndex, _backHairColorIndex, _foreHairTypeIndex, _foreHairColorIndex),
                  Column(
                    children: [
                      SizedBox(height: 0.165*screenHeight,),
                      SizedBox(
                        width: 0.35*screenWidth,
                        child: AutoSizeText(
                          '測試玩家',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black54,
                            fontWeight: FontWeight.bold
                          ),
                          maxLines: 1,
                          textAlign: TextAlign.center,
                        )
                      )
                    ],
                  )
                ],
              ), //角色外觀 & 名稱
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 0.03*screenHeight,
                    width: 0.12*screenWidth,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/CharacterStatus/New_CharacterStatus_LV_Text.png'),
                        fit: BoxFit.contain,
                      )
                    ),
                  ),
                  Container(
                    height: 0.03*screenHeight,
                    width: 0.12*screenWidth,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/CharacterStatus/New_CharacterStatus_MP_Text.png'),
                            fit: BoxFit.contain,
                        )
                    ),
                  ),
                  Container(
                    height: 0.03*screenHeight,
                    width: 0.12*screenWidth,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/CharacterStatus/New_CharacterStatus_EXP_Text.png'),
                          fit: BoxFit.contain,
                        )
                    ),
                  ),
                  Container(
                    height: 0.03*screenHeight,
                    width: 0.12*screenWidth,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/CharacterStatus/CharacterStatus_Coin.png'),
                          fit: BoxFit.contain,
                        )
                    ),
                  ),
                ],
              ), // LV MP EXP Coin標題
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 0.03*screenHeight,
                    width: 0.35*screenWidth,
                    child: NumberBlock(screenWidth, screenHeight, 1),
                  ),
                  Container(
                    height: 0.03*screenHeight,
                    width: 0.35*screenWidth,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/CharacterStatus/Groove/MP_Groove.png'),
                          fit: BoxFit.contain,
                        )
                    ),
                  ),
                  Container(
                    height: 0.03*screenHeight,
                    width: 0.35*screenWidth,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/CharacterStatus/Groove/EXP1_Groove.png'),
                          fit: BoxFit.contain,
                        )
                    ),
                  ),
                  Container(
                    height: 0.03*screenHeight,
                    width: 0.35*screenWidth,
                    child: NumberBlock(screenWidth, screenHeight, 100),
                  ),
                ],
              ), //LV Coin number & mp exp值
              Column(
                children: [
                  SizedBox(height: 0.15*screenHeight,),
                  GestureDetector(
                      onTap: (){},
                      child: Container(
                        width: 0.11*screenWidth,
                        height: 0.05*screenHeight,
                        child: Image.asset('assets/CharacterStatus/CharacterStatus_Info_Button.png',fit: BoxFit.fill,),
                      )
                  ),
                ],
              )
            ],
          )

        ],
      ),
    );
  }

  Widget MonsterAndArrowBlock(double screenWidth, double screenHeight){
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
            child: Container(
              width: 0.6*screenWidth,
              height: 0.4*screenHeight,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/Monster_R_0.png'),
                    fit: BoxFit.cover,
                  )
              ),
            )
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
          onTap: (){},
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
      body: SafeArea(
        child: Stack(
          children: [
            BattleScene(),
            Column(
              children: [
                CharacterStatusBlock(screenWidth, screenHeight), //character status bar
                SizedBox(height: 0.05*screenHeight,),
                SizedBox(
                  width: 0.3*screenWidth,
                  child: Text('每天跑步',style: TextStyle(fontSize: 30,color: Colors.white),),
                ), //怪物名稱
                SizedBox(height: 0.0025*screenHeight,),
                Container(
                  width: 0.6*screenWidth,
                  height: 0.05*screenHeight,
                  child: Image.asset('assets/CharacterStatus/Groove/HP_Groove.png',fit: BoxFit.cover,),
                ), //怪物血條
                SizedBox(height: 0.05*screenHeight,),
                MonsterAndArrowBlock(screenWidth, screenHeight),//怪物 & 左右箭頭
                SizedBox(height: 0.05*screenHeight,),
                attackMenuBar(screenWidth, screenHeight),
              ],
            )
          ],
        )
      ),
    );
  }
}