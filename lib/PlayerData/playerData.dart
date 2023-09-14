import 'package:liver_remake/Model/Models.dart';
import 'package:flutter/material.dart';
import 'package:liver_remake/firebase/firebase_controller.dart';
import 'dart:math';

class PlayerData extends ChangeNotifier{

  Player player = Player(
      bodyIndex: 2,
      earsTypeIndex: 1,
      earsColorIndex: 2,
      clothesIndex: 5,
      pantsIndex: 5,
      shoesIndex: 5,
      eyesTypeIndex: 2,
      eyesColorIndex: 1,
      mouthIndex: 1,
      backHairTypeIndex: 1,
      backHairColorIndex: 1,
      foreHairTypeIndex: 3,
      foreHairColorIndex: 1,
      backItemIndex: -1,
      eyeDecorationIndex: -1,
      heavyWeaponIndex: -1,
      lightWeaponIndex: -1,
      name: '測試玩家',
      level: 1,
      ogSTR: 1,
      ogINT: 1,
      ogVIT: 1,
      hp: 1,
      mp: 10,
      exp: 0,
      maxMp: 10,
      maxExp: 10,
      coin: 20,
      sp: 0
  );

  int strMonsterLevel= 1;
  int intMonsterLevel = 1;
  int vitMonsterLevel = 1;

  List<Monster> allMonsterList = [
    Monster(monsterName: '每日晨跑', type: 0,monsterLevel:1),
    Monster(monsterName: '每日讀書', type: 1,monsterLevel:1),
    Monster(monsterName: '每日下廚', type: 2,monsterLevel:1)
  ];
  
  List<Achievement> allAchievementList = [
    Achievement(type: 0, description: '啟程', date: '2023 / 09 /11')
  ];

  List<Log> allLogList = [
    Log(logType: 3, playerName: '', monsterName: '', attackPoint: 0, trainName: '', trainLevel: 0, trainAddSTR: 0, trainAddINT: 0, trainAddVIT: 0, trainAddEXP: 0, deadLoseSTR: 0, deadLoseINT: 0, deadLoseVIT: 0, deadLoseEXP: 0, date: '2023 / 09 /11'),
  ];

  List<TrainItem> trainItemList = [];

  List<List<SkillModel>> skillModelList = [
    [
      SkillModel(1,true, false, true,true,5,1),
      SkillModel(1,false, false, true,true,10,3),
      SkillModel(1,false, false, false,true,200,10),
    ],
    [
      SkillModel(1,true, false, true,true,5,1),
      SkillModel(1,false, false, true,true,10,3),
      SkillModel(1,false, false, false,true,200,10),
    ],
    [
      SkillModel(1,true, false, true,true,5,1),
      SkillModel(1,false, false, true,true,10,3),
      SkillModel(1,false, false, false,true,200,10),
    ]
  ];

  List<Item> shopItemsList= [
    //Item(type,coin,addSTR,addINT,addVIT,status,whatItem,itemIndex,description,addExp,addMp)
    // status 0:in shop, 1:in bag, 2:on body
    //0: weapon
    Item(0, 50, 10, 0, 0, 0, 'HeavyWeapon', '0','',0,0,),
    Item(0, 60, 15, 0, 0, 0, 'HeavyWeapon', '1','',0,0,),
    Item(0, 20, 5, 0, 0, 0, 'LightWeapon', '0','',0,0,),
    Item(0, 20, 0, 5, 0, 0, 'LightWeapon', '1','',0,0,),
    Item(0, 20, 0, 0, 5, 0, 'LightWeapon', '2','',0,0,),
    Item(0, 25, 8, 0, 0, 0, 'LightWeapon', '3','',0,0,),
    Item(0, 20, 13, 0, 0, 0, 'LightWeapon', '4','',0,0,),
    //1:armors
    Item(1, 100, 0, 0, 0, 0, 'Clothes', '0','',0,0,),
    Item(1, 100, 0, 0, 0, 0, 'Clothes', '1','',0,0,),
    Item(1, 100, 0, 0, 0, 0, 'Clothes', '2','',0,0,),
    Item(1, 100, 0, 0, 0, 0, 'Clothes', '3','',0,0,),
    Item(1, 100, 0, 0, 0, 0, 'Clothes', '4','',0,0,),
    Item(1, 100, 0, 0, 0, 0, 'Clothes', '5','',0,0,),
    Item(1, 100, 0, 0, 0, 0, 'Clothes', '6','',0,0,),
    Item(1, 100, 0, 0, 0, 0, 'Clothes', '7','',0,0,),
    Item(1, 90, 0, 0, 0, 0, 'Pants', '0','',0,0,),
    Item(1, 90, 0, 0, 0, 0, 'Pants', '1','',0,0,),
    Item(1, 90, 0, 0, 0, 0, 'Pants', '2','',0,0,),
    Item(1, 90, 0, 0, 0, 0, 'Pants', '3','',0,0,),
    Item(1, 90, 0, 0, 0, 0, 'Pants', '4','',0,0,),
    Item(1, 90, 0, 0, 0, 0, 'Pants', '5','',0,0,),
    Item(1, 90, 0, 0, 0, 0, 'Pants', '6','',0,0,),
    Item(1, 90, 0, 0, 0, 0, 'Pants', '7','',0,0,),
    Item(1, 90, 0, 0, 0, 0, 'Pants', '8','',0,0,),
    Item(1, 90, 0, 0, 0, 0, 'Pants', '9','',0,0,),
    Item(1, 90, 0, 0, 0, 0, 'Pants', '10','',0,0,),
    Item(1, 90, 0, 0, 0, 0, 'Pants', '11','',0,0,),
    Item(1, 80, 0, 0, 0, 0, 'Shoes', '0','',0,0,),
    Item(1, 80, 0, 0, 0, 0, 'Shoes', '1','',0,0,),
    Item(1, 80, 0, 0, 0, 0, 'Shoes', '2','',0,0,),
    Item(1, 80, 0, 0, 0, 0, 'Shoes', '3','',0,0,),
    Item(1, 80, 0, 0, 0, 0, 'Shoes', '4','',0,0,),
    Item(1, 80, 0, 0, 0, 0, 'Shoes', '5','',0,0,),
    //2:accessories
    Item(2, 200, 0, 50, 0, 0, 'BackItem', '0','',0,0,),
    Item(2, 200, 0, 0, 10, 0, 'EyeDecoration', '0','',0,0,),
    Item(2, 200, 0, 0, 20, 0, 'EyeDecoration', '1','',0,0,),
    //3:body
    Item(3, 80, 0, 0, 0, 0, 'Head_Body', '0','',0,0,),
    Item(3, 80, 0, 0, 0, 0, 'Head_Body', '1','',0,0,),
    Item(3, 80, 0, 0, 0, 0, 'Head_Body', '2','',0,0,),
    Item(3, 80, 0, 0, 0, 0, 'Head_Body', '3','',0,0,),
    Item(3, 80, 0, 0, 0, 0, 'Head_Body', '4','',0,0,),
    Item(3, 20, 0, 0, 0, 0, 'BackHair', '0-0','',0,0,),
    Item(3, 20, 0, 0, 0, 0, 'BackHair', '0-1','',0,0,),
    Item(3, 20, 0, 0, 0, 0, 'BackHair', '0-2','',0,0,),
    Item(3, 20, 0, 0, 0, 0, 'BackHair', '0-3','',0,0,),
    Item(3, 20, 0, 0, 0, 0, 'BackHair', '0-4','',0,0,),
    Item(3, 20, 0, 0, 0, 0, 'BackHair', '0-5','',0,0,),
    Item(3, 20, 0, 0, 0, 0, 'BackHair', '0-6','',0,0,),
    Item(3, 20, 0, 0, 0, 0, 'BackHair', '0-7','',0,0,),
    Item(3, 20, 0, 0, 0, 0, 'BackHair', '0-8','',0,0,),
    Item(3, 20, 0, 0, 0, 0, 'BackHair', '1-0','',0,0,),
    Item(3, 20, 0, 0, 0, 0, 'BackHair', '1-1','',0,0,),
    Item(3, 20, 0, 0, 0, 0, 'BackHair', '1-2','',0,0,),
    Item(3, 20, 0, 0, 0, 0, 'BackHair', '1-3','',0,0,),
    Item(3, 20, 0, 0, 0, 0, 'BackHair', '1-4','',0,0,),
    Item(3, 20, 0, 0, 0, 0, 'BackHair', '1-5','',0,0,),
    Item(3, 20, 0, 0, 0, 0, 'BackHair', '1-6','',0,0,),
    Item(3, 20, 0, 0, 0, 0, 'BackHair', '1-7','',0,0,),
    Item(3, 20, 0, 0, 0, 0, 'BackHair', '1-8','',0,0,),
    Item(3, 20, 0, 0, 0, 0, 'BackHair', '2','',0,0,),
    Item(3, 20, 0, 0, 0, 0, 'ForeHair', '0','',0,0,),
    Item(3, 20, 0, 0, 0, 0, 'ForeHair', '1-0','',0,0,),
    Item(3, 20, 0, 0, 0, 0, 'ForeHair', '1-1','',0,0,),
    Item(3, 20, 0, 0, 0, 0, 'ForeHair', '1-2','',0,0,),
    Item(3, 20, 0, 0, 0, 0, 'ForeHair', '1-3','',0,0,),
    Item(3, 20, 0, 0, 0, 0, 'ForeHair', '1-4','',0,0,),
    Item(3, 20, 0, 0, 0, 0, 'ForeHair', '1-5','',0,0,),
    Item(3, 20, 0, 0, 0, 0, 'ForeHair', '1-6','',0,0,),
    Item(3, 20, 0, 0, 0, 0, 'ForeHair', '1-7','',0,0,),
    Item(3, 20, 0, 0, 0, 0, 'ForeHair', '1-8','',0,0,),
    Item(3, 20, 0, 0, 0, 0, 'ForeHair', '2-0','',0,0,),
    Item(3, 20, 0, 0, 0, 0, 'ForeHair', '2-1','',0,0,),
    Item(3, 20, 0, 0, 0, 0, 'ForeHair', '2-2','',0,0,),
    Item(3, 20, 0, 0, 0, 0, 'ForeHair', '2-3','',0,0,),
    Item(3, 20, 0, 0, 0, 0, 'ForeHair', '2-4','',0,0,),
    Item(3, 20, 0, 0, 0, 0, 'ForeHair', '2-5','',0,0,),
    Item(3, 20, 0, 0, 0, 0, 'ForeHair', '2-6','',0,0,),
    Item(3, 20, 0, 0, 0, 0, 'ForeHair', '2-7','',0,0,),
    Item(3, 20, 0, 0, 0, 0, 'ForeHair', '2-8','',0,0,),
    Item(3, 20, 0, 0, 0, 0, 'ForeHair', '3-0','',0,0,),
    Item(3, 20, 0, 0, 0, 0, 'ForeHair', '3-1','',0,0,),
    Item(3, 20, 0, 0, 0, 0, 'ForeHair', '3-2','',0,0,),
    Item(3, 20, 0, 0, 0, 0, 'ForeHair', '3-3','',0,0,),
    Item(3, 20, 0, 0, 0, 0, 'ForeHair', '3-4','',0,0,),
    Item(3, 20, 0, 0, 0, 0, 'ForeHair', '3-5','',0,0,),
    Item(3, 20, 0, 0, 0, 0, 'ForeHair', '3-6','',0,0,),
    Item(3, 20, 0, 0, 0, 0, 'ForeHair', '3-7','',0,0,),
    Item(3, 20, 0, 0, 0, 0, 'ForeHair', '3-8','',0,0,),
    Item(3, 20, 0, 0, 0, 0, 'Ears', '0-0','',0,0,),
    Item(3, 20, 0, 0, 0, 0, 'Ears', '0-1','',0,0,),
    Item(3, 20, 0, 0, 0, 0, 'Ears', '0-2','',0,0,),
    Item(3, 20, 0, 0, 0, 0, 'Ears', '0-3','',0,0,),
    Item(3, 20, 0, 0, 0, 0, 'Ears', '0-4','',0,0,),
    Item(3, 20, 0, 0, 0, 0, 'Ears', '1-0','',0,0,),
    Item(3, 20, 0, 0, 0, 0, 'Ears', '1-1','',0,0,),
    Item(3, 20, 0, 0, 0, 0, 'Ears', '1-2','',0,0,),
    Item(3, 20, 0, 0, 0, 0, 'Ears', '1-3','',0,0,),
    Item(3, 20, 0, 0, 0, 0, 'Ears', '1-4','',0,0,),
    Item(3, 20, 0, 0, 0, 0, 'Eyes', '0-0','',0,0,),
    Item(3, 20, 0, 0, 0, 0, 'Eyes', '0-1','',0,0,),
    Item(3, 20, 0, 0, 0, 0, 'Eyes', '0-2','',0,0,),
    Item(3, 20, 0, 0, 0, 0, 'Eyes', '0-3','',0,0,),
    Item(3, 20, 0, 0, 0, 0, 'Eyes', '0-4','',0,0,),
    Item(3, 20, 0, 0, 0, 0, 'Eyes', '0-5','',0,0,),
    Item(3, 20, 0, 0, 0, 0, 'Eyes', '0-6','',0,0,),
    Item(3, 20, 0, 0, 0, 0, 'Eyes', '0-7','',0,0,),
    Item(3, 20, 0, 0, 0, 0, 'Eyes', '0-8','',0,0,),
    Item(3, 20, 0, 0, 0, 0, 'Eyes', '0-9','',0,0,),
    Item(3, 20, 0, 0, 0, 0, 'Eyes', '1-0','',0,0,),
    Item(3, 20, 0, 0, 0, 0, 'Eyes', '1-1','',0,0,),
    Item(3, 20, 0, 0, 0, 0, 'Eyes', '1-2','',0,0,),
    Item(3, 20, 0, 0, 0, 0, 'Eyes', '1-3','',0,0,),
    Item(3, 20, 0, 0, 0, 0, 'Eyes', '1-4','',0,0,),
    Item(3, 20, 0, 0, 0, 0, 'Eyes', '1-5','',0,0,),
    Item(3, 20, 0, 0, 0, 0, 'Eyes', '1-6','',0,0,),
    Item(3, 20, 0, 0, 0, 0, 'Eyes', '1-7','',0,0,),
    Item(3, 20, 0, 0, 0, 0, 'Eyes', '1-8','',0,0,),
    Item(3, 20, 0, 0, 0, 0, 'Eyes', '1-9','',0,0,),
    Item(3, 20, 0, 0, 0, 0, 'Eyes', '2-0','',0,0,),
    Item(3, 20, 0, 0, 0, 0, 'Eyes', '2-1','',0,0,),
    Item(3, 20, 0, 0, 0, 0, 'Eyes', '2-2','',0,0,),
    Item(3, 20, 0, 0, 0, 0, 'Eyes', '2-3','',0,0,),
    Item(3, 20, 0, 0, 0, 0, 'Eyes', '2-4','',0,0,),
    Item(3, 20, 0, 0, 0, 0, 'Eyes', '2-5','',0,0,),
    Item(3, 20, 0, 0, 0, 0, 'Eyes', '2-6','',0,0,),
    Item(3, 20, 0, 0, 0, 0, 'Eyes', '2-7','',0,0,),
    Item(3, 20, 0, 0, 0, 0, 'Eyes', '2-8','',0,0,),
    Item(3, 20, 0, 0, 0, 0, 'Eyes', '2-9','',0,0,),
    Item(3, 20, 0, 0, 0, 0, 'Eyes', '3-0','',0,0,),
    Item(3, 20, 0, 0, 0, 0, 'Eyes', '3-1','',0,0,),
    Item(3, 20, 0, 0, 0, 0, 'Eyes', '3-2','',0,0,),
    Item(3, 20, 0, 0, 0, 0, 'Eyes', '3-3','',0,0,),
    Item(3, 20, 0, 0, 0, 0, 'Eyes', '3-4','',0,0,),
    Item(3, 20, 0, 0, 0, 0, 'Eyes', '3-5','',0,0,),
    Item(3, 20, 0, 0, 0, 0, 'Eyes', '3-6','',0,0,),
    Item(3, 20, 0, 0, 0, 0, 'Eyes', '3-7','',0,0,),
    Item(3, 20, 0, 0, 0, 0, 'Eyes', '3-8','',0,0,),
    Item(3, 20, 0, 0, 0, 0, 'Eyes', '3-9','',0,0,),
    Item(3, 20, 0, 0, 0, 0, 'Mouth', '0','',0,0,),
    Item(3, 20, 0, 0, 0, 0, 'Mouth', '1','',0,0,),
    Item(3, 20, 0, 0, 0, 0, 'Mouth', '2','',0,0,),
    Item(3, 20, 0, 0, 0, 0, 'Mouth', '3','',0,0,),
    Item(3, 20, 0, 0, 0, 0, 'Mouth', '4','',0,0,),
    //4:items
    Item(4, 10, 0, 0, 0, 0, 'Potions', '0','EXP + 5',5,0,),
    Item(4, 10, 0, 0, 0, 0, 'Potions', '1','MP + 5',0,5,),
  ];

  List<Item> bagItemsList= [];

  List<Map<String,dynamic>> monsterListMapList(){
    print('*****************');
    List<Map<String,dynamic>> result = [
      allMonsterList[0].toMap(),
      allMonsterList[1].toMap(),
      allMonsterList[2].toMap(),
    ];
    print(result[0]);
    return result;
  }

  List<Map<String,dynamic>> achievementListMapList(){
    List<Map<String,dynamic>> result = [];
    result.clear();
    for(int i=0;i<allAchievementList.length;i++){
      result.add(allAchievementList[i].toMap());
    }
    return result;
  }

  List<Map<String,dynamic>> logListMapList(){
    List<Map<String,dynamic>> result = [];
    result.clear();
    for(int i=0;i<allLogList.length;i++){
      result.add(allLogList[i].toMap());
    }
    return result;
  }

  List<Map<String,dynamic>> trainItemListMapList(){
    List<Map<String,dynamic>> result = [];
    result.clear();
    for(int i=0;i<trainItemList.length;i++){
      result.add(trainItemList[i].toMap());
    }
    return result;
  }

  List<Map<String,dynamic>> strSkillMapList(){
    List<Map<String,dynamic>> result = [
      skillModelList[0][0].toMap(),
      skillModelList[0][1].toMap(),
      skillModelList[0][2].toMap(),
    ];
    return result;
  }

  List<Map<String,dynamic>> intSkillMapList(){
    List<Map<String,dynamic>> result = [
      skillModelList[1][0].toMap(),
      skillModelList[1][1].toMap(),
      skillModelList[1][2].toMap(),
    ];
    return result;
  }

  List<Map<String,dynamic>> vitSkillMapList(){
    List<Map<String,dynamic>> result = [
      skillModelList[2][0].toMap(),
      skillModelList[2][1].toMap(),
      skillModelList[2][2].toMap(),
    ];
    return result;
  }

  List<Map<String,dynamic>> shopItemListMapList(){
    List<Map<String,dynamic>> result = [];
    result.clear();
    for(int i=0;i<shopItemsList.length;i++){
      result.add(shopItemsList[i].toMap());
    }
    return result;
  }

  List<Map<String,dynamic>> bagItemListMapList(){
    List<Map<String,dynamic>> result = [];
    result.clear();
    for(int i=0;i<bagItemsList.length;i++){
      result.add(bagItemsList[i].toMap());
    }
    return result;
  }

  Map<String,dynamic> monsterLevelToMap(){
    return {
      'strMonsterLevel':strMonsterLevel,
      'intMonsterLevel':intMonsterLevel,
      'vitMonsterLevel':vitMonsterLevel,
    };
  }

  void getDataFromFirebase(Map<String,dynamic> data){
    print(data);
    player.bodyIndex= data['bodyIndex'];
    player.earsTypeIndex= data['earsTypeIndex'];
    player.earsColorIndex= data['earsColorIndex'];
    player.clothesIndex= data['clothesIndex'];
    player.pantsIndex= data['pantsIndex'];
    player.shoesIndex= data['shoesIndex'];
    player.eyesTypeIndex= data['eyesTypeIndex'];
    player.eyesColorIndex= data['eyesColorIndex'];
    player.mouthIndex= data['mouthIndex'];
    player.backHairTypeIndex= data['backHairTypeIndex'];
    player.backHairColorIndex= data['backHairColorIndex'];
    player.foreHairTypeIndex= data['foreHairTypeIndex'];
    player.foreHairColorIndex= data['foreHairColorIndex'];
    player.backItemIndex= data['backItemIndex'];
    player.eyeDecorationIndex= data['eyeDecorationIndex'];
    player.heavyWeaponIndex= data['heavyWeaponIndex'];
    player.lightWeaponIndex= data['lightWeaponIndex'];
    player.name= data['name'];
    player.level= data['level'];
    player.ogSTR= data['ogSTR'];
    player.ogINT= data['ogINT'];
    player.ogVIT= data['ogVIT'];
    player.hp= data['hp'];
    player.mp= data['mp'];
    player.exp= data['exp'];
    player.maxMp= data['maxMp'];
    player.maxExp= data['maxExp'];
    player.coin= data['coin'];
    player.sp= data['sp'];
    strMonsterLevel= data['strMonsterLevel'];
    intMonsterLevel = data['intMonsterLevel'];
    vitMonsterLevel = data['vitMonsterLevel'];
    allMonsterList[0].fetch(data['monsterList'][0]);
    allMonsterList[1].fetch(data['monsterList'][1]);
    allMonsterList[2].fetch(data['monsterList'][2]);
    for(int i=0;i<data['achievementList'].lenth;i++){
      allAchievementList.clear();
      Achievement achievement = Achievement(type: 0, description: 'description', date: '');
      achievement.fetch(data['achievementList'][i]);
      allAchievementList.add(achievement);
    }
    for(int i=0;i<data['logListMapList'].lenth;i++){
      allLogList.clear();
      Log log = Log(logType: 0, playerName: 'playerName', monsterName: 'monsterName', attackPoint: 0, trainName: 'trainName', trainLevel: 0, trainAddSTR: 0, trainAddINT: 0, trainAddVIT: 0, trainAddEXP: 0, deadLoseSTR: 0, deadLoseINT: 0, deadLoseVIT: 0, deadLoseEXP: 0, date: 'date');
      log.fetch(data['logListMapList'][i]);
      allLogList.add(log);
    }
    for(int i=0;i<data['trainItemListMapList'].lenth;i++){
      allLogList.clear();
      TrainItem trainItem = TrainItem('trainName', 0, 0);
      trainItem.fetch(data['trainItemListMapList'][i]);
      trainItemList.add(trainItem);
    }
    for(int i=0;i<3;i++){
      for(int j=0;j<3;j++){
        if(i==0){
          skillModelList[0][j].fetch(data['strSkillMapList'][j]);
        }
        else if(i==1){
          skillModelList[1][j].fetch(data['intSkillMapList'][j]);
        }
        else{
          skillModelList[2][j].fetch(data['vitSkillMapList'][j]);
        }
      }
    }
    for(int i=0;i<data['shopItemListMapList'].lenth;i++){
      shopItemsList.clear();
      Item shopItem = Item(0, 0, 0, 0, 0, 0, 'whatItem', 'itemIndex', 'description', 0, 0);
      shopItem.fetch(data['shopItemListMapList'][i]);
      shopItemsList.add(shopItem);
    }
    for(int i=0;i<data['bagItemListMapList'].lenth;i++){
      bagItemsList.clear();
      Item bagItem = Item(0, 0, 0, 0, 0, 0, 'whatItem', 'itemIndex', 'description', 0, 0);
      bagItem.fetch(data['bagItemListMapList'][i]);
      print('bag: ${bagItem.whatItem} / ${bagItem.itemIndex}');
      bagItemsList.add(bagItem);
    }
    notifyListeners();
  }

  void setSTR(int STR){
    player.STR = STR;
    notifyListeners();
  }

  void setINT(int INT){
    player.INT = INT;
    notifyListeners();
  }

  void setVIT(int VIT){
    player.VIT = VIT;
    notifyListeners();
  }

  void addAchievementList(Achievement achievement){
    allAchievementList.add(achievement);
    notifyListeners();
  }

  void addLogList(Log log){
    allLogList.add(log);
    notifyListeners();
  }

  void addTrainList(TrainItem trainItem){
    trainItemList.add(trainItem);
    notifyListeners();
  }

  void levelUpSkill(int skillType,int skillIndex){
    if(skillModelList[skillType][skillIndex].skillLV<99){
      skillModelList[skillType][skillIndex].skillLV++;
      if(skillIndex==0){
        if(skillModelList[skillType][0].skillLV==30){
          skillModelList[skillType][1].canLearn = true;
        }
        else if(skillModelList[skillType][0].skillLV==50){
          skillModelList[skillType][2].canLearn = true;
        }
      }
      if(skillIndex==2){
        skillModelList[skillType][2].useConsumeMp = skillModelList[skillType][2].useConsumeMp - ((skillModelList[skillType][2].skillLV+1)*2);
      }
    }
    notifyListeners();
  }

  void updatePlayer(Player player){
    this.player = player;
    notifyListeners();
  }

  void completeTrain(TrainItem trainItem){
    if(trainItem.trainTypeIndex==0){
      player.STR += trainItem.getAddSTR();
    }
    else if(trainItem.trainTypeIndex==1){
      player.INT += trainItem.getAddINT();
    }
    else if(trainItem.trainTypeIndex==2){
      player.VIT += trainItem.getAddVIT();
    }
    getEXP(trainItem.getAddEXP());
    addLogList(Log(logType: 1, playerName: player.name, monsterName: 'monsterName', attackPoint: 0, trainName: trainItem.trainName, trainLevel: trainItem.trainLevel, trainAddSTR: trainItem.getAddSTR(), trainAddINT: trainItem.getAddINT(), trainAddVIT: trainItem.getAddVIT(), trainAddEXP: trainItem.getAddEXP(), deadLoseSTR: 0, deadLoseINT: 0, deadLoseVIT: 0, deadLoseEXP: 0, date: ''));
    notifyListeners();
  }

  void removeTrain(TrainItem trainItem){
    trainItemList.remove(trainItem);
    notifyListeners();
  }

  void createMonster(int type,String name){
    if(type == 0){
      allMonsterList[type] = Monster(monsterName: name, type: type, monsterLevel: strMonsterLevel);
      allMonsterList[type].initMonster();
    }
    else if(type==1){
      allMonsterList[type] = Monster(monsterName: name, type: type, monsterLevel: intMonsterLevel);
      allMonsterList[type].initMonster();
    }
    else{
      allMonsterList[type] = Monster(monsterName: name, type: type, monsterLevel: vitMonsterLevel);
      allMonsterList[type].initMonster();
    }
    notifyListeners();
  }

  void playerDead(String monsterName){
    if(skillModelList[1][2].hasUsed){
      print(allLogList.length);
      addLogList(Log(logType: 5, playerName: player.name, monsterName: monsterName, attackPoint: 99999, trainName: '', trainLevel: 0, trainAddSTR: 0, trainAddINT: 0, trainAddVIT: 0, trainAddEXP: 0, deadLoseSTR: 0, deadLoseINT: 0, deadLoseVIT: 0, deadLoseEXP: 0, date: '${DateTime.now().year} / ${DateTime.now().month} / ${DateTime.now().day}'));
      print(allLogList.length);
      skillModelList[1][2].hasUsed=false;
    }
    else{
      addLogList(Log(logType: 2, playerName: player.name, monsterName: monsterName, attackPoint: 99999, trainName: '', trainLevel: 0, trainAddSTR: 0, trainAddINT: 0, trainAddVIT: 0, trainAddEXP: 0, deadLoseSTR: player.deadLoseSTR(), deadLoseINT: player.deadLoseINT(), deadLoseVIT: player.deadLoseVIT(), deadLoseEXP: player.deadLoseExp(), date: '${DateTime.now().year} / ${DateTime.now().month} / ${DateTime.now().day}'));
      player.ogSTR -= player.deadLoseSTR();
      player.ogINT -= player.deadLoseINT();
      player.ogVIT -= player.deadLoseVIT();
      player.exp =0;
      player.mp=0;
      player.coin = player.coin~/2;
    }
    notifyListeners();
  }

  void checkMonsterAttacked(){
    DateTime now = DateTime.now();
    Duration difference ;
    for(int i=0;i<3;i++){
      if(allMonsterList[i].monsterHp>0){
        difference = now.difference(allMonsterList[i].lastBeAttackedTime);
        if(difference>=const Duration(seconds: 30) && difference<const Duration(seconds: 60)){
          for(int i=0;i<3;i++){
            if(allMonsterList[i].monsterHp>0 && allMonsterList[i].hasBeAttacked){
              allMonsterList[i].hasBeAttacked=false;
            }
          }
        }
        if(difference>=const Duration(seconds: 60)){
          allMonsterList[i].lastBeAttackedTime = DateTime.now();
          if(skillModelList[0][2].hasUsed){
            addLogList(Log(logType: 4, playerName: player.name, monsterName: allMonsterList[i].monsterName, attackPoint: 99999, trainName: '', trainLevel: 0, trainAddSTR: 0, trainAddINT: 0, trainAddVIT: 0, trainAddEXP: 0, deadLoseSTR: player.deadLoseSTR(), deadLoseINT: 0, deadLoseVIT: 0, deadLoseEXP: 0, date: '${DateTime.now().year} / ${DateTime.now().month} / ${DateTime.now().day}'));
            skillModelList[0][2].hasUsed=false;
          }
          else{
            playerDead(allMonsterList[i].monsterName);
          }
        }
      }
    }
    notifyListeners();
  }

  void attackMonster(int type){
    allMonsterList[type].hasBeAttacked= true;
    allMonsterList[type].lastBeAttackedTime = DateTime.now();
    int attackPoint = 0;
    int getExp = 0;
    int getCoin = 0;
    switch(type){
      case 0: attackPoint = player.STR;
      case 1: attackPoint = player.INT;
      case 2: attackPoint = player.VIT;
    }
    //skill use
    if(skillModelList[0][0].hasUsed){
      attackPoint = attackPoint + (attackPoint*(skillModelList[0][0].skillLV+1)~/100);
      skillModelList[0][0].hasUsed=false;
    }
    if(skillModelList[0][1].hasUsed){
      if((Random().nextInt(100)+1)<=(skillModelList[0][1].skillLV+1)){
        print('get random weapon');
      }
      else{
        print('bad luck for weapon');
      }
      skillModelList[0][1].hasUsed=false;
    }
    if(skillModelList[1][1].hasUsed){
      if((Random().nextInt(100)+1)<=(skillModelList[1][1].skillLV+1)){
        print('get random item');
      }
      else{
        print('bad luck for item');
      }
      skillModelList[1][1].hasUsed=false;
    }
    if(skillModelList[2][1].hasUsed){
      if((Random().nextInt(100)+1)<=(skillModelList[2][1].skillLV+1)){
        print('get random accessory');
      }
      else{
        print('bad luck for accessory');
      }
      skillModelList[2][1].hasUsed=false;
    }
    if(skillModelList[2][2].hasUsed){
      allMonsterList[type].hasBeAttacked= false;
      skillModelList[2][2].hasUsed=false;
    }
    //
    allMonsterList[type].monsterHp-=attackPoint;
    addLogList(Log(logType: 0, playerName: player.name, monsterName: allMonsterList[type].monsterName, attackPoint: attackPoint, trainName: 'trainName', trainLevel: 0, trainAddSTR: 0, trainAddINT: 0, trainAddVIT: 0, trainAddEXP: 0, deadLoseSTR: 0, deadLoseINT: 0, deadLoseVIT: 0, deadLoseEXP: 0, date: '${DateTime.now().year} / ${DateTime.now().month} / ${DateTime.now().day}'));
    if(allMonsterList[type].monsterHp<=0){
      allMonsterList[type].monsterHp=0;
      addLogList(Log(logType: 1, playerName: player.name, monsterName: '', attackPoint: 0, trainName: allMonsterList[type].monsterName, trainLevel: allMonsterList[type].monsterLevel, trainAddSTR: allMonsterList[type].getSTR, trainAddINT: allMonsterList[type].getINT, trainAddVIT: allMonsterList[type].getVIT, trainAddEXP: allMonsterList[type].getEXP, deadLoseSTR: 0, deadLoseINT: 0, deadLoseVIT: 0, deadLoseEXP: 0, date: '${DateTime.now().year} / ${DateTime.now().month} / ${DateTime.now().day}'));
      switch(type){
        case 0 : player.STR+=allMonsterList[0].getSTR;addAchievementList(Achievement(type: (strMonsterLevel>5?6:3), description: '$allMonsterList[type].monsterName', date: '${DateTime.now().year} / ${DateTime.now().month} / ${DateTime.now().day}'));strMonsterLevel++;
        case 1 : player.INT+=allMonsterList[1].getINT;addAchievementList(Achievement(type: (intMonsterLevel>5?4:1), description: '$allMonsterList[type].monsterName', date: '${DateTime.now().year} / ${DateTime.now().month} / ${DateTime.now().day}'));intMonsterLevel++;
        case 2 : player.VIT+=allMonsterList[2].getVIT;addAchievementList(Achievement(type: (vitMonsterLevel>5?5:2), description: '$allMonsterList[type].monsterName', date: '${DateTime.now().year} / ${DateTime.now().month} / ${DateTime.now().day}'));vitMonsterLevel++;
      }
      if(skillModelList[1][0].hasUsed){
        getExp = allMonsterList[type].getEXP + (allMonsterList[type].getEXP*(skillModelList[1][0].skillLV+1)~/100);
        skillModelList[1][0].hasUsed=false;
      }
      else{
        getExp = allMonsterList[type].getEXP;
      }
      if(skillModelList[2][0].hasUsed){
        getCoin = allMonsterList[type].getCoin + (allMonsterList[type].getCoin*(skillModelList[2][0].skillLV+1)~/100);
        skillModelList[2][0].hasUsed=false;
      }
      else{
        getCoin = allMonsterList[type].getCoin;
      }
      getEXP(getExp);
      player.coin += getCoin;
    }
    notifyListeners();
  }

  void getEXP(int getEXP){
    player.exp+=getEXP;
    if(player.exp>=player.maxExp){
      player.sp+=player.level;
      player.level++;
      player.exp -= player.maxExp;
      player.maxExp = player.level*15;
      player.STR += ((player.STR~/10)>1?player.STR~/10:1);
      player.INT += ((player.INT~/10)>1?player.INT~/10:1);
      player.VIT += ((player.VIT~/10)>1?player.VIT~/10:1);
      if(player.level == 5 ){
        addAchievementList(Achievement(
            type: 0, description: '達成 5 級', date: '${DateTime.now().year} / ${DateTime.now().month} / ${DateTime.now().day}'));
      }
      else if(player.level == 10 ) {
        addAchievementList(Achievement(
            type: 0, description: '達成 10 級', date: '${DateTime.now().year} / ${DateTime.now().month} / ${DateTime.now().day}'));
      }
      else if(player.level == 30 ) {
        addAchievementList(Achievement(
            type: 0, description: '達成 30 級', date: '${DateTime.now().year} / ${DateTime.now().month} / ${DateTime.now().day}'));
      }
      else if(player.level == 50 ) {
        addAchievementList(Achievement(
            type: 0, description: '達成 50 級', date: '${DateTime.now().year} / ${DateTime.now().month} / ${DateTime.now().day}'));
      }
      else if(player.level == 100 ) {
        addAchievementList(Achievement(
            type: 0, description: '達成 100 級', date: '${DateTime.now().year} / ${DateTime.now().month} / ${DateTime.now().day}'));
      }
      else if(player.level == 150 ) {
        addAchievementList(Achievement(
            type: 0, description: '達成 150 級', date: '${DateTime.now().year} / ${DateTime.now().month} / ${DateTime.now().day}'));
      }
      else if(player.level == 200 ) {
        addAchievementList(Achievement(
            type: 0, description: '達成 200 級', date: '${DateTime.now().year} / ${DateTime.now().month} / ${DateTime.now().day}'));
      }
    }
  }

  void getMP(int getMP){
    if(player.mp<player.maxMp){
      player.mp+=getMP;
      if(player.mp>player.maxMp){
        player.mp=player.maxMp;
      }
    }
    notifyListeners();
  }

  void consumeMp(int consumeMp){
    player.mp-=consumeMp;
    notifyListeners();
  }

  List<Item> getBagListByType(int type){
    List<Item> result = [];
    result.clear();
    for(int i=0;i<bagItemsList.length;i++){
      if(bagItemsList[i].type==type && bagItemsList[i].status!=0){
        result.add(bagItemsList[i]);
      }
    }
    return result;
  }

  void unloadTypeItem(String whatItem,Player player){
    for(int i=0;i<bagItemsList.length;i++){
      if(bagItemsList[i].whatItem==whatItem){
        bagItemsList[i].status=1;
      }
    }
  }

  void buyItem(int indexInList,int costCoin){
    player.coin-=costCoin;
    shopItemsList[indexInList].status=1;
    bagItemsList.add(shopItemsList[indexInList]);
    notifyListeners();
  }

  void buyPotions(int indexInList,int costCoin){
    player.coin-=costCoin;
    if(shopItemsList[indexInList].itemIndex=='0'){
      bagItemsList.add(Item(4, 10, 0, 0, 0, 1, 'Potions', '0','EXP + 5',5,0,),);
    }
    else{
      bagItemsList.add(Item(4, 10, 0, 0, 0, 1, 'Potions', '1','MP + 5',0,5,),);
    }

    notifyListeners();
  }

  void initShopItemList(){
    for(int i=0;i<shopItemsList.length;i++){
      shopItemsList[i].getIndexInList(i);
    }
    for(int i=0;i<shopItemsList.length;i++){
      if(shopItemsList[i].whatItem=='Head_Body' && shopItemsList[i].itemIndex==player.bodyIndex.toString()){
        shopItemsList[i].status=2;
        bagItemsList.add(shopItemsList[i]);
      }
      if(shopItemsList[i].whatItem=='Ears' && shopItemsList[i].itemIndex=='${player.earsTypeIndex}-${player.earsColorIndex}'){
        shopItemsList[i].status=2;
        bagItemsList.add(shopItemsList[i]);
      }
      if(shopItemsList[i].whatItem=='Eyes' && shopItemsList[i].itemIndex=='${player.eyesTypeIndex}-${player.eyesColorIndex}'){
        shopItemsList[i].status=2;
        bagItemsList.add(shopItemsList[i]);
      }
      if(shopItemsList[i].whatItem=='Clothes' && shopItemsList[i].itemIndex==player.clothesIndex.toString()){
        shopItemsList[i].status=2;
        bagItemsList.add(shopItemsList[i]);
      }
      if(shopItemsList[i].whatItem=='Pants' && shopItemsList[i].itemIndex==player.pantsIndex.toString()){
        shopItemsList[i].status=2;
        bagItemsList.add(shopItemsList[i]);
      }
      if(shopItemsList[i].whatItem=='Shoes' && shopItemsList[i].itemIndex==player.shoesIndex.toString()){
        shopItemsList[i].status=2;
        bagItemsList.add(shopItemsList[i]);
      }
      if(shopItemsList[i].whatItem=='Mouth' && shopItemsList[i].itemIndex==player.mouthIndex.toString()){
        shopItemsList[i].status=2;
        bagItemsList.add(shopItemsList[i]);
      }
      if(shopItemsList[i].whatItem=='ForeHair' && shopItemsList[i].itemIndex=='${player.foreHairTypeIndex}-${player.foreHairColorIndex}'){
        shopItemsList[i].status=2;
        bagItemsList.add(shopItemsList[i]);
      }
      if(shopItemsList[i].whatItem=='BackHair' && shopItemsList[i].itemIndex=='${player.backHairTypeIndex}-${player.backHairColorIndex}'){
        shopItemsList[i].status=2;
        bagItemsList.add(shopItemsList[i]);
      }
      notifyListeners();
    }
  }

  List<Item> getListByTypeAndStatus(int type,int status){
    List<Item> result = [];
    for(int i=0;i<shopItemsList.length;i++){
      if(shopItemsList[i].type==type && shopItemsList[i].status==status){
        result.add(shopItemsList[i]);
      }
    }
    return result;
  }

  void reFreshItemOnBodyWithStatus2(){
    int addSTR = 0;
    int addINT = 0;
    int addVIT = 0;
    int getTypeByItemIndex(String index){
      List<String> parts = index.split('-');
      String firstNumber = parts.first;
      int parsedNumber = int.parse(firstNumber);
      return parsedNumber;
    }

    int getColorByItemIndex(String index){
      List<String> parts = index.split('-');
      String firstNumber = parts.last;
      int parsedNumber = int.parse(firstNumber);
      return parsedNumber;
    }

    setSTR(player.ogSTR);
    setINT(player.ogINT);
    setVIT(player.ogVIT);

    for(int i=0;i<bagItemsList.length;i++){
      if(bagItemsList[i].status==2){
        if(bagItemsList[i].whatItem=='Head_Body'){
          player.bodyIndex = int.parse(bagItemsList[i].itemIndex);
        }
        if(bagItemsList[i].whatItem=='Ears'){
          player.earsTypeIndex = getTypeByItemIndex(bagItemsList[i].itemIndex);
          player.earsColorIndex = getColorByItemIndex(bagItemsList[i].itemIndex);
        }
        if(bagItemsList[i].whatItem=='Eyes'){
          player.eyesTypeIndex = getTypeByItemIndex(bagItemsList[i].itemIndex);
          player.eyesColorIndex = getColorByItemIndex(bagItemsList[i].itemIndex);
        }
        if(bagItemsList[i].whatItem=='Clothes'){
          player.clothesIndex = int.parse(bagItemsList[i].itemIndex);
        }
        if(bagItemsList[i].whatItem=='Pants'){
          player.pantsIndex = int.parse(bagItemsList[i].itemIndex);
        }
        if(bagItemsList[i].whatItem=='Shoes'){
          player.shoesIndex = int.parse(bagItemsList[i].itemIndex);
        }
        if(bagItemsList[i].whatItem=='Mouth'){
          player.mouthIndex = int.parse(bagItemsList[i].itemIndex);
        }
        if(bagItemsList[i].whatItem=='ForeHair'){
          player.foreHairTypeIndex = getTypeByItemIndex(bagItemsList[i].itemIndex);
          player.foreHairColorIndex = getColorByItemIndex(bagItemsList[i].itemIndex);
        }
        if(bagItemsList[i].whatItem=='BackHair'){
          player.backHairTypeIndex = getTypeByItemIndex(bagItemsList[i].itemIndex);
          player.backHairColorIndex = getColorByItemIndex(bagItemsList[i].itemIndex);
        }
        if(bagItemsList[i].whatItem=='HeavyWeapon'){
          player.heavyWeaponIndex = int.parse(bagItemsList[i].itemIndex);
          addSTR += bagItemsList[i].addSTR;
          addINT += bagItemsList[i].addINT;
          addVIT += bagItemsList[i].addVIT;
        }
        if(bagItemsList[i].whatItem=='LightWeapon'){
          player.lightWeaponIndex = int.parse(bagItemsList[i].itemIndex);
          addSTR += bagItemsList[i].addSTR;
          addINT += bagItemsList[i].addINT;
          addVIT += bagItemsList[i].addVIT;
        }
        if(bagItemsList[i].whatItem=='BackItem'){
          player.backItemIndex = int.parse(bagItemsList[i].itemIndex);
          addSTR += bagItemsList[i].addSTR;
          addINT += bagItemsList[i].addINT;
          addVIT += bagItemsList[i].addVIT;
        }
        if(bagItemsList[i].whatItem=='EyeDecoration'){
          player.eyeDecorationIndex = int.parse(bagItemsList[i].itemIndex);
          addSTR += bagItemsList[i].addSTR;
          addINT += bagItemsList[i].addINT;
          addVIT += bagItemsList[i].addVIT;
        }
      }
    }

    setSTR(player.ogSTR+addSTR);
    setINT(player.ogINT+addINT);
    setVIT(player.ogVIT+addVIT);

    notifyListeners();
  }
}