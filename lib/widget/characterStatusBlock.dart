import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class Player{
  int bodyIndex = 2;
  int earsTypeIndex = 1;
  int earsColorIndex = 0;
  int clothesIndex = 0;
  int pantsIndex = 0;
  int shoesIndex = 0;
  int eyesTypeIndex = 0;
  int eyesColorIndex = 0;
  int mouthIndex = 0;
  int backHairTypeIndex = 0;
  int backHairColorIndex = 1;
  int foreHairTypeIndex = 2;
  int foreHairColorIndex = 1;
  int backItemIndex = 0;
  int eyeDecorationIndex = 0;
  int heavyWeaponIndex = 0;
  int lightWeaponIndex = 0;
  String name = '';
  int level = 1;
  int mp = 0;
  int exp = 0;
  int maxMp = 0;
  int maxExp = 0;
  int coin = 0;
  Player(
      this.bodyIndex,
      this.earsTypeIndex,
      this.earsColorIndex,
      this.clothesIndex,
      this.pantsIndex,
      this.shoesIndex,
      this.eyesTypeIndex,
      this.eyesColorIndex,
      this.mouthIndex,
      this.backHairTypeIndex,
      this.backHairColorIndex,
      this.foreHairTypeIndex,
      this.foreHairColorIndex,
      this.backItemIndex,
      this.eyeDecorationIndex,
      this.heavyWeaponIndex,
      this.lightWeaponIndex,
      this.name,
      this.level,
      this.mp,
      this.exp,
      this.maxMp,
      this.maxExp,
      this.coin
      );
}

Widget character(double screenWidth, double screenHeight,Player player){
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

  List<ImageProvider> _backItemList = [
    AssetImage('assets/BackItem/0.png'),
  ];

  List<ImageProvider> _eyeDecorationList = [
    AssetImage('assets/EyeDecoration/0.png'),
    AssetImage('assets/EyeDecoration/1.png'),
  ];

  List<ImageProvider> _heavyWeaponList = [
    AssetImage('assets/HeavyWeapon/0.png'),
    AssetImage('assets/HeavyWeapon/1.png'),
  ];

  List<ImageProvider> _lightWeaponList = [
    AssetImage('assets/LightWeapon/0.png'),
    AssetImage('assets/LightWeapon/1.png'),
    AssetImage('assets/LightWeapon/2.png'),
    AssetImage('assets/LightWeapon/3.png'),
    AssetImage('assets/LightWeapon/4.png'),
  ];

  return Container(
    height: 0.15*screenHeight,
    width: 0.35*screenWidth,
    child: Column(
      children: [
        SizedBox(height: 0.03*screenHeight),
        Stack(
          children: [
            Image(image:_backItemList[player.backItemIndex],fit: BoxFit.cover),
            Image(image:_backHairList[player.backHairTypeIndex][player.backHairColorIndex],fit: BoxFit.cover),
            Image(image:_bodyList[player.bodyIndex],fit: BoxFit.cover),
            Image(image:_foreHairList[player.foreHairTypeIndex][player.foreHairColorIndex],fit: BoxFit.cover),
            Image(image:_clothesList[player.clothesIndex],fit: BoxFit.cover),
            Image(image:_earsList[player.earsTypeIndex][player.earsColorIndex],fit: BoxFit.cover),
            Image(image:_eyesList[player.eyesTypeIndex][player.eyesColorIndex],fit: BoxFit.cover),
            Image(image:_mouthList[player.mouthIndex],fit: BoxFit.cover),
            Image(image:_pantsList[player.pantsIndex],fit: BoxFit.cover),
            Image(image:_shoesList[player.shoesIndex],fit: BoxFit.cover),
            Image(image:_heavyWeaponList[player.heavyWeaponIndex],fit: BoxFit.cover),
            Image(image:_lightWeaponList[player.lightWeaponIndex],fit: BoxFit.cover),
            Image(image:_eyeDecorationList[player.eyeDecorationIndex],fit: BoxFit.cover),
          ],
        )
      ],
    ),
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

Widget MpBarBlock(double screenWidth, double screenHeight,double mpRatio){
  return Container(
      height: 0.03*screenHeight,
      width: 0.35*screenWidth,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/CharacterStatus/Groove/MP_Groove.png'),
          fit: BoxFit.contain,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(40.0),
        child: LinearProgressIndicator(
          value: mpRatio,
          valueColor: AlwaysStoppedAnimation<Color>(Color.fromRGBO(0, 140, 215, 1),),
          backgroundColor: Color.fromRGBO(0, 0, 0, 0),
        ),

      )
  );
}

Widget EXPBarBlock(double screenWidth, double screenHeight,double expRatio){
  return Container(
      height: 0.03*screenHeight,
      width: 0.35*screenWidth,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/CharacterStatus/Groove/EXP1_Groove.png'),
          fit: BoxFit.contain,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(40.0),
        child: LinearProgressIndicator(
          value: expRatio,
          valueColor: AlwaysStoppedAnimation<Color>(Color.fromRGBO(0, 193, 0, 1),),
          backgroundColor: Color.fromRGBO(0, 0, 0, 0),
        ),

      )
  );
}

Widget CharacterStatusBlock(double screenWidth, double screenHeight,Player _player){

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
                character(screenWidth, screenHeight, _player),
                Column(
                  children: [
                    SizedBox(height: 0.165*screenHeight,),
                    SizedBox(
                        width: 0.35*screenWidth,
                        child: AutoSizeText(
                          _player.name,
                          style: const TextStyle(
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
                  child: NumberBlock(screenWidth, screenHeight, _player.level),
                ),
                MpBarBlock(screenWidth, screenHeight,_player.mp/_player.maxMp),
                EXPBarBlock(screenWidth, screenHeight,_player.exp/_player.maxExp),
                Container(
                  height: 0.03*screenHeight,
                  width: 0.35*screenWidth,
                  child: NumberBlock(screenWidth, screenHeight, _player.coin),
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