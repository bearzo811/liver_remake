import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:liver_remake/pages/info_page.dart';
import 'package:liver_remake/pages/main_page.dart';
import 'dart:core';

class Achievement{
  int type =0 ; // 0: star | 1: little int | 2: little vit | 3: little str | 4: big int | 5: big vit | 6: big str
  String description='';
  String date = '';
  Achievement({
    required this.type,
    required this.description,
    required this.date
  });
  
  Map<String,dynamic> toMap(){
    return {
      'type':type,
      'description':description,
      'date':date,
    };
  }

  void fetch(Map<String,dynamic> data){
    type = data['type'];
    description = data['description'];
    date = data['date'];
  }
}

class SkillModel{
  int skillLV = 1;
  bool canLearn = false; //是否可以學習
  bool hasLearned = true; //是否已學習
  bool canUse = true; //是否可使用
  bool hasUsed = false;
  int useConsumeMp = 1;
  int levelUpConsumeMp = 1;
  SkillModel(this.skillLV,this.canLearn,this.hasLearned,this.canUse,this.hasUsed,this.useConsumeMp,this.levelUpConsumeMp);
  
  Map<String,dynamic> toMap(){
    return {
      'skillLV':skillLV,
      'canLearn':canLearn,
      'hasLearned':hasLearned,
      'canUse':canUse,
      'hasUsed':hasUsed,
      'useConsumeMp':useConsumeMp,
      'levelUpConsumeMp':levelUpConsumeMp
    };
  }

  void fetch(Map<String,dynamic> data){
    skillLV = data['skillLV'];
    canLearn = data['canLearn'];
    hasLearned = data['hasLearned'];
    canUse = data['canUse'];
    hasUsed = data['hasUsed'];
    useConsumeMp = data['useConsumeMp'];
    levelUpConsumeMp = data['levelUpConsumeMp'];
  }
}

class TrainItem{
  int trainTypeIndex = 0;
  int trainLevel = 0;
  String trainName = '';
  int addEXP = 0;

  TrainItem(this.trainName,this.trainTypeIndex,this.trainLevel);

  int getAddSTR(){
    if(trainTypeIndex==0){
      return (trainLevel~/5)+1;
    }
    else{
      return 0;
    }
  }

  int getAddINT(){
    if(trainTypeIndex==1){
      return (trainLevel~/5)+1;
    }
    else{
      return 0;
    }
  }

  int getAddVIT(){
    if(trainTypeIndex==2){
      return (trainLevel~/5)+1;
    }
    else{
      return 0;
    }
  }

  int getAddEXP(){
    return (trainLevel~/10)+1;
  }

  Map<String,dynamic> toMap(){
    return {
      'trainTypeIndex':trainTypeIndex,
      'trainLevel':trainLevel,
      'trainName':trainName,
      'getAddSTR':getAddSTR(),
      'getAddINT':getAddINT(),
      'getAddVIT':getAddVIT(),
      'getAddEXP':getAddEXP(),
    };
  }

  void fetch(Map<String,dynamic> data){
    trainTypeIndex = data['trainTypeIndex'];
    trainLevel = data['trainLevel'];
    trainName = data['trainName'];
  }

}

class Item{
  int type = 0; // 0:weapon, 1:armors, 2: accessories, 3:body, 4:items
  int coin = 30;
  int addSTR = 10;
  int addINT = 10;
  int addVIT = 10;
  int addExp = 0;
  int addMp = 0;
  String description = 'STR + 10';
  int status = 0; // 0:in shop, 1:in bag, 2:on body
  String whatItem = 'LightWeapon'; //BackHair,BackItem,Clothes,Ears,EyeDecoration,Eyes,ForeHair,Head_Body,HeavyWeapon,LightWeapon,Mouth,Pants,Shoes
  String itemIndex = '2';
  int indexInList = 0;
  Item(
    this.type,
    this.coin,
    this.addSTR,
    this.addINT,
    this.addVIT,
    this.status,
    this.whatItem,
    this.itemIndex,
    this.description,
    this.addExp,
    this.addMp,
  );

  String getDescription(){
    if(this.addSTR>0){
      return "STR + ${this.addSTR}";
    }
    else if(this.addINT>0){
      return "INT + ${this.addINT}";
    }
    else if(this.addVIT>0){
      return "VIT + ${this.addVIT}";
    }
    else{
      return "";
    }
  }

  void getIndexInList(int index){
    indexInList  = index;
  }
  
  Map<String,dynamic> toMap(){
    return {
    'type':type, // 0:weapon, 1:armors, 2: accessories, 3:body, 4:items
    'coin':coin,
    'addSTR':addSTR,
    'addINT':addINT,
    'addVIT':addVIT,
    'addExp':addExp,
    'addMp':addMp,
    'description':getDescription(),
    'status':status, // 0:in shop, 1:in bag, 2:on body
    'whatItem':whatItem, //BackHair,BackItem,Clothes,Ears,EyeDecoration,Eyes,ForeHair,Head_Body,HeavyWeapon,LightWeapon,Mouth,Pants,Shoes
    'itemIndex':itemIndex,
    'indexInList':indexInList,
    };
  }

  void fetch(Map<String,dynamic> data){
    type = data['type'];
    coin = data['coin'];
    addSTR = data['addSTR'];
    addINT = data['addINT'];
    addVIT = data['addVIT'];
    addExp = data['addExp'];
    addMp = data['addMp'];
    description = data['description'];
    status = data['status'];
    whatItem = data['whatItem'];
    itemIndex = data['itemIndex'];
    indexInList = data['indexInList'];
  }
}

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
  int ogSTR = 0;
  int ogINT = 0;
  int ogVIT = 0;
  int STR = 0;
  int INT = 0;
  int VIT = 0;
  int hp = 0;
  int mp = 0;
  int exp = 0;
  int maxMp = 0;
  int maxExp = 0;
  int coin = 0;
  int sp =0;
  List<Item> shopItemList = [];
  List<Item> bagItemList = [];
  Player({
    required this.bodyIndex,
    required this.earsTypeIndex,
    required this.earsColorIndex,
    required this.clothesIndex,
    required this.pantsIndex,
    required this.shoesIndex,
    required this.eyesTypeIndex,
    required this.eyesColorIndex,
    required this.mouthIndex,
    required this.backHairTypeIndex,
    required this.backHairColorIndex,
    required this.foreHairTypeIndex,
    required this.foreHairColorIndex,
    required this.backItemIndex,
    required this.eyeDecorationIndex,
    required this.heavyWeaponIndex,
    required this.lightWeaponIndex,
    required this.name,
    required this.level,
    required this.ogSTR,
    required this.ogINT,
    required this.ogVIT,
    required this.hp,
    required this.mp,
    required this.exp,
    required this.maxMp,
    required this.maxExp,
    required this.coin,
    required this.sp,
  });

  int deadLoseSTR(){
    return ogSTR~/2;
  }

  int deadLoseINT(){
    return ogINT~/2;
  }

  int deadLoseVIT(){
    return ogVIT~/2;
  }

  int deadLoseExp(){
    return exp;
  }

  Map<String, dynamic> toMap() {
    return {
      'bodyIndex': bodyIndex,
      'earsTypeIndex': earsTypeIndex,
      'earsColorIndex': earsColorIndex,
      'clothesIndex': clothesIndex,
      'pantsIndex': pantsIndex,
      'shoesIndex': shoesIndex,
      'eyesTypeIndex': eyesTypeIndex,
      'eyesColorIndex': eyesColorIndex,
      'mouthIndex': mouthIndex,
      'backHairTypeIndex': backHairTypeIndex,
      'backHairColorIndex': backHairColorIndex,
      'foreHairTypeIndex': foreHairTypeIndex,
      'foreHairColorIndex': foreHairColorIndex,
      'backItemIndex': backItemIndex,
      'eyeDecorationIndex': eyeDecorationIndex,
      'heavyWeaponIndex': heavyWeaponIndex,
      'lightWeaponIndex': lightWeaponIndex,
      'name': name,
      'level': level,
      'ogSTR': ogSTR,
      'ogINT': ogINT,
      'ogVIT': ogVIT,
      'hp': hp,
      'mp': mp,
      'exp': exp,
      'maxMp': maxMp,
      'maxExp': maxExp,
      'coin': coin,
      'sp': sp,
    };
  }
}

class Monster{
  String monsterName = '';
  int monsterHp = 0;
  int monsterMaxHp = 0;
  int monsterLevel = 0;
  int getSTR = 0;
  int getINT = 0;
  int getVIT = 0;
  int getEXP = 0;
  int getCoin = 0;
  int type = 0; //0:STR | 1:INT | 2:VIT
  bool hasBeAttacked = false;
  DateTime lastBeAttackedTime = DateTime.now();
  Monster({
    required this.monsterName,
    required this.type,
    required this.monsterLevel,
  });

  void initMonster(){
    monsterMaxHp = monsterLevel*50;
    monsterHp = monsterLevel*50;
    getSTR = monsterLevel;
    getINT = monsterLevel;
    getVIT = monsterLevel;
    getEXP = monsterLevel*10;
    getCoin = monsterLevel*10;
    hasBeAttacked = false;
    lastBeAttackedTime = DateTime.now();
  }

  void fetch(Map<String,dynamic> data){
    monsterName = data['monsterName'];
    monsterHp = data['monsterHp'];
    monsterMaxHp = data['monsterMaxHp'];
    monsterLevel = data['monsterLevel'];
    getSTR = data['getSTR'];
    getINT = data['getINT'];
    getVIT = data['getVIT'];
    getEXP = data['getEXP'];
    getCoin = data['getCoin'];
    type = data['type']; //0:STR | 1:INT | 2:VIT
    hasBeAttacked = data['hasBeAttacked'];
    lastBeAttackedTime = data['lastBeAttackedTime'].toDate();
  }
  
  Map<String,dynamic> toMap(){
    return {
    'monsterName' :monsterName,
    'monsterHp' :monsterHp,
    'monsterMaxHp' :monsterMaxHp,
    'monsterLevel' :monsterLevel,
    'getSTR' :getSTR,
    'getINT' :getINT,
    'getVIT' :getVIT,
    'getEXP' :getEXP,
    'getCoin' :getEXP,
    'type' :type, //0:STR | 1:INT | 2:VIT
    'hasBeAttacked':hasBeAttacked,
    'lastBeAttackedTime': Timestamp.fromDate(lastBeAttackedTime),
    };
  }
}

class Log{
  int logType = 0; //0:attack 1:interest 2:dead 3:date
  String playerName='';
  String monsterName='';
  int attackPoint=0;
  String trainName = '';
  int trainLevel = 0;
  int trainAddSTR = 0;
  int trainAddINT = 0;
  int trainAddVIT = 0;
  int trainAddEXP = 0;
  int deadLoseSTR = 0;
  int deadLoseINT = 0;
  int deadLoseVIT = 0;
  int deadLoseEXP = 0;
  String date = '';

  Log({
    required this.logType,
    required this.playerName,
    required this.monsterName,
    required this.attackPoint,
    required this.trainName,
    required this. trainLevel,
    required this. trainAddSTR,
    required this. trainAddINT,
    required this. trainAddVIT,
    required this. trainAddEXP,
    required this. deadLoseSTR,
    required this. deadLoseINT,
    required this. deadLoseVIT,
    required this. deadLoseEXP,
    required this.date,
  });
  
  Map<String,dynamic> toMap(){
    return {
    'logType' : logType, //0:attack 1:interest 2:dead 3:date
    'playerName':playerName,
    'monsterName':monsterName,
    'attackPoint':attackPoint,
    'trainName' : trainName,
    'trainLevel' : trainLevel,
    'trainAddSTR' : trainAddSTR,
    'trainAddINT' : trainAddINT,
    'trainAddVIT' : trainAddVIT,
    'trainAddEXP' : trainAddEXP,
    'deadLoseSTR' : deadLoseSTR,
    'deadLoseINT' : deadLoseINT,
    'deadLoseVIT' : deadLoseVIT,
    'deadLoseEXP' : deadLoseEXP,
    'date' : date,
    };
  }

  void fetch(Map<String,dynamic> data){
    logType = data['logType'];
    playerName = data['playerName'];
    monsterName = data['monsterName'];
    attackPoint = data['attackPoint'];
    trainName = data['trainName'];
    trainLevel = data['trainLevel'];
    trainAddSTR = data['trainAddSTR'];
    trainAddINT = data['trainAddINT'];
    trainAddVIT = data['trainAddVIT'];
    trainAddEXP = data['trainAddEXP'];
    deadLoseSTR = data['deadLoseSTR'];
    deadLoseINT = data['deadLoseINT'];
    deadLoseVIT = data['deadLoseVIT'];
    deadLoseEXP = data['deadLoseEXP'];
    date = data['date'];
  }
}

Widget character(double screenWidth, double screenHeight,Player player){
  List<ImageProvider> bodyList = [
    const AssetImage('assets/Head_Body/0.png'),
    const AssetImage('assets/Head_Body/1.png'),
    const AssetImage('assets/Head_Body/2.png'),
    const AssetImage('assets/Head_Body/3.png'),
    const AssetImage('assets/Head_Body/4.png')
  ];

  List<List<ImageProvider>> earsList =[
    [
      const AssetImage('assets/Ears/0-0.png'),
      const AssetImage('assets/Ears/0-1.png'),
      const AssetImage('assets/Ears/0-2.png'),
      const AssetImage('assets/Ears/0-3.png'),
      const AssetImage('assets/Ears/0-4.png'),
    ],
    [
      const AssetImage('assets/Ears/1-0.png'),
      const AssetImage('assets/Ears/1-1.png'),
      const AssetImage('assets/Ears/1-2.png'),
      const AssetImage('assets/Ears/1-3.png'),
      const AssetImage('assets/Ears/1-4.png'),
    ],
  ];

  List<ImageProvider> clothesList = [
    const AssetImage('assets/Clothes/0.png'),
    const AssetImage('assets/Clothes/1.png'),
    const AssetImage('assets/Clothes/2.png'),
    const AssetImage('assets/Clothes/3.png'),
    const AssetImage('assets/Clothes/4.png'),
    const AssetImage('assets/Clothes/5.png'),
    const AssetImage('assets/Clothes/6.png'),
    const AssetImage('assets/Clothes/7.png'),
  ];

  List<ImageProvider> pantsList = [
    const AssetImage('assets/Pants/0.png'),
    const AssetImage('assets/Pants/1.png'),
    const AssetImage('assets/Pants/2.png'),
    const AssetImage('assets/Pants/3.png'),
    const AssetImage('assets/Pants/4.png'),
    const AssetImage('assets/Pants/5.png'),
    const AssetImage('assets/Pants/6.png'),
    const AssetImage('assets/Pants/7.png'),
    const AssetImage('assets/Pants/8.png'),
    const AssetImage('assets/Pants/9.png'),
    const AssetImage('assets/Pants/10.png'),
    const AssetImage('assets/Pants/11.png'),
  ];

  List<ImageProvider> shoesList = [
    const AssetImage('assets/Shoes/0.png'),
    const AssetImage('assets/Shoes/1.png'),
    const AssetImage('assets/Shoes/2.png'),
    const AssetImage('assets/Shoes/3.png'),
    const AssetImage('assets/Shoes/4.png'),
    const AssetImage('assets/Shoes/5.png'),
  ];

  List<List<ImageProvider>> eyesList =[
    [
      const AssetImage('assets/Eyes/0-0.png'),
      const AssetImage('assets/Eyes/0-1.png'),
      const AssetImage('assets/Eyes/0-2.png'),
      const AssetImage('assets/Eyes/0-3.png'),
      const AssetImage('assets/Eyes/0-4.png'),
      const AssetImage('assets/Eyes/0-5.png'),
      const AssetImage('assets/Eyes/0-6.png'),
      const AssetImage('assets/Eyes/0-7.png'),
      const AssetImage('assets/Eyes/0-8.png'),
      const AssetImage('assets/Eyes/0-9.png'),
    ],
    [
      const AssetImage('assets/Eyes/1-0.png'),
      const AssetImage('assets/Eyes/1-1.png'),
      const AssetImage('assets/Eyes/1-2.png'),
      const AssetImage('assets/Eyes/1-3.png'),
      const AssetImage('assets/Eyes/1-4.png'),
      const AssetImage('assets/Eyes/1-5.png'),
      const AssetImage('assets/Eyes/1-6.png'),
      const AssetImage('assets/Eyes/1-7.png'),
      const AssetImage('assets/Eyes/1-8.png'),
      const AssetImage('assets/Eyes/1-9.png'),
    ],
    [
      const AssetImage('assets/Eyes/2-0.png'),
      const AssetImage('assets/Eyes/2-1.png'),
      const AssetImage('assets/Eyes/2-2.png'),
      const AssetImage('assets/Eyes/2-3.png'),
      const AssetImage('assets/Eyes/2-4.png'),
      const AssetImage('assets/Eyes/2-5.png'),
      const AssetImage('assets/Eyes/2-6.png'),
      const AssetImage('assets/Eyes/2-7.png'),
      const AssetImage('assets/Eyes/2-8.png'),
      const AssetImage('assets/Eyes/2-9.png'),
    ],
    [
      const AssetImage('assets/Eyes/3-0.png'),
      const AssetImage('assets/Eyes/3-1.png'),
      const AssetImage('assets/Eyes/3-2.png'),
      const AssetImage('assets/Eyes/3-3.png'),
      const AssetImage('assets/Eyes/3-4.png'),
      const AssetImage('assets/Eyes/3-5.png'),
      const AssetImage('assets/Eyes/3-6.png'),
      const AssetImage('assets/Eyes/3-7.png'),
      const AssetImage('assets/Eyes/3-8.png'),
      const AssetImage('assets/Eyes/3-9.png'),
    ],
  ];

  List<ImageProvider> mouthList = [
    const AssetImage('assets/Mouth/0.png'),
    const AssetImage('assets/Mouth/1.png'),
    const AssetImage('assets/Mouth/2.png'),
    const AssetImage('assets/Mouth/3.png'),
    const AssetImage('assets/Mouth/4.png'),
  ];

  List<List<ImageProvider>> backHairList =[
    [
      const AssetImage('assets/BackHair/0-0.png'),
      const AssetImage('assets/BackHair/0-1.png'),
      const AssetImage('assets/BackHair/0-2.png'),
      const AssetImage('assets/BackHair/0-3.png'),
      const AssetImage('assets/BackHair/0-4.png'),
      const AssetImage('assets/BackHair/0-5.png'),
      const AssetImage('assets/BackHair/0-6.png'),
      const AssetImage('assets/BackHair/0-7.png'),
      const AssetImage('assets/BackHair/0-8.png'),
    ],
    [
      const AssetImage('assets/BackHair/1-0.png'),
      const AssetImage('assets/BackHair/1-1.png'),
      const AssetImage('assets/BackHair/1-2.png'),
      const AssetImage('assets/BackHair/1-3.png'),
      const AssetImage('assets/BackHair/1-4.png'),
      const AssetImage('assets/BackHair/1-5.png'),
      const AssetImage('assets/BackHair/1-6.png'),
      const AssetImage('assets/BackHair/1-7.png'),
      const AssetImage('assets/BackHair/1-8.png'),
    ],
    [
      const AssetImage('assets/BackHair/2.png'),
    ],
  ];

  List<List<ImageProvider>> foreHairList =[
    [
      const AssetImage('assets/ForeHair/0.png'),
    ],
    [
      const AssetImage('assets/ForeHair/1-0.png'),
      const AssetImage('assets/ForeHair/1-1.png'),
      const AssetImage('assets/ForeHair/1-2.png'),
      const AssetImage('assets/ForeHair/1-3.png'),
      const AssetImage('assets/ForeHair/1-4.png'),
      const AssetImage('assets/ForeHair/1-5.png'),
      const AssetImage('assets/ForeHair/1-6.png'),
      const AssetImage('assets/ForeHair/1-7.png'),
      const AssetImage('assets/ForeHair/1-8.png'),
    ],
    [
      const AssetImage('assets/ForeHair/2-0.png'),
      const AssetImage('assets/ForeHair/2-1.png'),
      const AssetImage('assets/ForeHair/2-2.png'),
      const AssetImage('assets/ForeHair/2-3.png'),
      const AssetImage('assets/ForeHair/2-4.png'),
      const AssetImage('assets/ForeHair/2-5.png'),
      const AssetImage('assets/ForeHair/2-6.png'),
      const AssetImage('assets/ForeHair/2-7.png'),
      const AssetImage('assets/ForeHair/2-8.png'),
    ],
    [
      const AssetImage('assets/ForeHair/3-0.png'),
      const AssetImage('assets/ForeHair/3-1.png'),
      const AssetImage('assets/ForeHair/3-2.png'),
      const AssetImage('assets/ForeHair/3-3.png'),
      const AssetImage('assets/ForeHair/3-4.png'),
      const AssetImage('assets/ForeHair/3-5.png'),
      const AssetImage('assets/ForeHair/3-6.png'),
      const AssetImage('assets/ForeHair/3-7.png'),
      const AssetImage('assets/ForeHair/3-8.png'),
    ],
  ];

  List<ImageProvider> backItemList = [
    const AssetImage('assets/BackItem/0.png'),
  ];

  List<ImageProvider> eyeDecorationList = [
    const AssetImage('assets/EyeDecoration/0.png'),
    const AssetImage('assets/EyeDecoration/1.png'),
  ];

  List<ImageProvider> heavyWeaponList = [
    const AssetImage('assets/HeavyWeapon/0.png'),
    const AssetImage('assets/HeavyWeapon/1.png'),
  ];

  List<ImageProvider> lightWeaponList = [
    const AssetImage('assets/LightWeapon/0.png'),
    const AssetImage('assets/LightWeapon/1.png'),
    const AssetImage('assets/LightWeapon/2.png'),
    const AssetImage('assets/LightWeapon/3.png'),
    const AssetImage('assets/LightWeapon/4.png'),
  ];

  return Column(
    children: [
      SizedBox(height: 0.005*screenHeight),
      Stack(
        children: [
          (player.backItemIndex>-1 ? Image(image:backItemList[player.backItemIndex],fit: BoxFit.cover): Container()),
          (player.heavyWeaponIndex>-1?Image(image:heavyWeaponList[player.heavyWeaponIndex],fit: BoxFit.cover):Container()),
          (player.backHairTypeIndex>-1 ? Image(image:backHairList[player.backHairTypeIndex][player.backHairColorIndex],fit: BoxFit.cover): Container()),
          (player.bodyIndex>-1?Image(image:bodyList[player.bodyIndex],fit: BoxFit.cover):Container()),
          (player.foreHairTypeIndex>-1?Image(image:foreHairList[player.foreHairTypeIndex][player.foreHairColorIndex],fit: BoxFit.cover):Container()),
          (player.clothesIndex>-1?Image(image:clothesList[player.clothesIndex],fit: BoxFit.cover):Container()),
          (player.earsTypeIndex>-1?Image(image:earsList[player.earsTypeIndex][player.earsColorIndex],fit: BoxFit.cover):Container()),
          (player.eyesTypeIndex>-1?Image(image:eyesList[player.eyesTypeIndex][player.eyesColorIndex],fit: BoxFit.cover):Container()),
          (player.mouthIndex>-1?Image(image:mouthList[player.mouthIndex],fit: BoxFit.cover):Container()),
          (player.pantsIndex>-1?Image(image:pantsList[player.pantsIndex],fit: BoxFit.cover):Container()),
          (player.shoesIndex>-1?Image(image:shoesList[player.shoesIndex],fit: BoxFit.cover):Container()),
          (player.lightWeaponIndex>-1?Image(image:lightWeaponList[player.lightWeaponIndex],fit: BoxFit.cover):Container()),
          (player.eyeDecorationIndex>-1?Image(image:eyeDecorationList[player.eyeDecorationIndex],fit: BoxFit.cover):Container()),
        ],
      )
    ],
  );
}

Widget numberBlock(double screenWidth, double screenHeight,int number){

  List<ImageProvider> numberList =[
    const AssetImage('assets/CharacterStatus/New_CharacterStatus_LV_Number_0.png'),
    const AssetImage('assets/CharacterStatus/New_CharacterStatus_LV_Number_1.png'),
    const AssetImage('assets/CharacterStatus/New_CharacterStatus_LV_Number_2.png'),
    const AssetImage('assets/CharacterStatus/New_CharacterStatus_LV_Number_3.png'),
    const AssetImage('assets/CharacterStatus/New_CharacterStatus_LV_Number_4.png'),
    const AssetImage('assets/CharacterStatus/New_CharacterStatus_LV_Number_5.png'),
    const AssetImage('assets/CharacterStatus/New_CharacterStatus_LV_Number_6.png'),
    const AssetImage('assets/CharacterStatus/New_CharacterStatus_LV_Number_7.png'),
    const AssetImage('assets/CharacterStatus/New_CharacterStatus_LV_Number_8.png'),
    const AssetImage('assets/CharacterStatus/New_CharacterStatus_LV_Number_9.png'),
  ];
  return Container(
    height: 0.03*screenHeight,
    width: 0.35*screenWidth,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image(image: numberList[(number/10000).toInt()%10]),
        Image(image: numberList[(number/1000).toInt()%10]),
        Image(image: numberList[(number/100).toInt()%10]),
        Image(image: numberList[(number/10).toInt()%10]),
        Image(image: numberList[number%10]),
      ],
    ),
  );
}

Widget mpBarBlock(double screenWidth, double screenHeight,double mpRatio){
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
          valueColor: const AlwaysStoppedAnimation<Color>(Color.fromRGBO(0, 140, 215, 1),),
          backgroundColor: const Color.fromRGBO(0, 0, 0, 0),
        ),

      )
  );
}

Widget eXPBarBlock(double screenWidth, double screenHeight,double expRatio){
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
          valueColor: const AlwaysStoppedAnimation<Color>(Color.fromRGBO(0, 193, 0, 1),),
          backgroundColor: const Color.fromRGBO(0, 0, 0, 0),
        ),

      )
  );
}

Widget characterStatusBlockWithInfoButton(double screenWidth, double screenHeight,Player player,BuildContext context){
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
                Container(
                  width: 0.33*screenWidth,
                  height: 0.2*screenHeight,
                  child: character(screenWidth, screenHeight, player),
                ),
                Column(
                  children: [
                    SizedBox(height: 0.165*screenHeight,),
                    SizedBox(
                        width: 0.35*screenWidth,
                        child: AutoSizeText(
                          player.name,
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
            ),
            //角色外觀 & 名稱
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
                  child: numberBlock(screenWidth, screenHeight, player.level),
                ),
                mpBarBlock(screenWidth, screenHeight,player.mp/player.maxMp),
                eXPBarBlock(screenWidth, screenHeight,player.exp/player.maxExp),
                Container(
                  height: 0.03*screenHeight,
                  width: 0.35*screenWidth,
                  child: numberBlock(screenWidth, screenHeight, player.coin),
                ),
              ],
            ), //LV Coin number & mp exp值
            Column(
              children: [
                SizedBox(height: 0.15*screenHeight,),
                GestureDetector(
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context)=>InfoPage()
                          )
                      );
                    },
                    child: SizedBox(
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

Widget characterStatusBlockWithHomeButton(double screenWidth, double screenHeight,Player player,BuildContext context){
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
                SizedBox(
                  width: 0.33*screenWidth,
                  height: 0.2*screenHeight,
                  child: character(screenWidth, screenHeight, player),
                ),
                Column(
                  children: [
                    SizedBox(height: 0.165*screenHeight,),
                    SizedBox(
                        width: 0.35*screenWidth,
                        child: AutoSizeText(
                          player.name,
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
            ),
            //角色外觀 & 名稱
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
                SizedBox(
                  height: 0.03*screenHeight,
                  width: 0.35*screenWidth,
                  child: numberBlock(screenWidth, screenHeight, player.level),
                ),
                mpBarBlock(screenWidth, screenHeight,player.mp/player.maxMp),
                eXPBarBlock(screenWidth, screenHeight,player.exp/player.maxExp),
                SizedBox(
                  height: 0.03*screenHeight,
                  width: 0.35*screenWidth,
                  child: numberBlock(screenWidth, screenHeight, player.coin),
                ),
              ],
            ), //LV Coin number & mp exp值
            Column(
              children: [
                SizedBox(height: 0.15*screenHeight,),
                GestureDetector(
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context)=>MainPage()
                          )
                      );
                    },
                    child: SizedBox(
                      width: 0.11*screenWidth,
                      height: 0.05*screenHeight,
                      child: Image.asset('assets/CharacterStatus/CharacterStatus_Home_Button.png',fit: BoxFit.fill,),
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
