import 'package:liver_remake/Model/Models.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

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
      STR: 1,
      INT: 1,
      VIT: 1,
      hp: 1,
      mp: 10,
      exp: 0,
      maxMp: 10,
      maxExp: 10,
      coin: 20,
      sp: 0
  );

  int strMonsterLevel = 1;
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

  void addAchievementList(Achievement achievement){
    allAchievementList.add(achievement);
    notifyListeners();
  }

  List<Log> allLogList = [
    Log(logType: 3, playerName: '', monsterName: '', attackPoint: 0, trainName: '', trainLevel: 0, trainAddSTR: 0, trainAddINT: 0, trainAddVIT: 0, trainAddEXP: 0, deadLoseSTR: 0, deadLoseINT: 0, deadLoseVIT: 0, deadLoseEXP: 0, date: '2023 / 09 /11'),
  ];

  void addLogList(Log log){
    allLogList.add(log);
    notifyListeners();
  }

  List<TrainItem> trainItemList = [];

  void addTrainList(TrainItem trainItem){
    trainItemList.add(trainItem);
    notifyListeners();
  }

  List<List<SkillModel>> skillModelList = [
    [
      SkillModel(1,true, false, true,5,1),
      SkillModel(1,false, false, true,10,3),
      SkillModel(1,false, false, false,200,10),
    ],
    [
      SkillModel(1,true, false, true,5,1),
      SkillModel(1,false, false, true,10,3),
      SkillModel(1,false, false, false,200,10),
    ],
    [
      SkillModel(1,true, false, true,5,1),
      SkillModel(1,false, false, true,10,3),
      SkillModel(1,false, false, false,200,10),
    ]
  ];

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

  void attackMonster(int type){
    allMonsterList[type].hasBeAttacked= true;
    switch(type){
      case 0 : allMonsterList[0].monsterHp-=player.STR;addLogList(Log(logType: 0, playerName: player.name, monsterName: allMonsterList[type].monsterName, attackPoint: player.STR, trainName: 'trainName', trainLevel: 0, trainAddSTR: 0, trainAddINT: 0, trainAddVIT: 0, trainAddEXP: 0, deadLoseSTR: 0, deadLoseINT: 0, deadLoseVIT: 0, deadLoseEXP: 0, date: '${DateTime.now().year} / ${DateTime.now().month} / ${DateTime.now().day}'));
      case 1 : allMonsterList[1].monsterHp-=player.INT;addLogList(Log(logType: 0, playerName: player.name, monsterName: allMonsterList[type].monsterName, attackPoint: player.INT, trainName: 'trainName', trainLevel: 0, trainAddSTR: 0, trainAddINT: 0, trainAddVIT: 0, trainAddEXP: 0, deadLoseSTR: 0, deadLoseINT: 0, deadLoseVIT: 0, deadLoseEXP: 0, date: '${DateTime.now().year} / ${DateTime.now().month} / ${DateTime.now().day}'));
      case 2 : allMonsterList[2].monsterHp-=player.VIT;addLogList(Log(logType: 0, playerName: player.name, monsterName: allMonsterList[type].monsterName, attackPoint: player.VIT, trainName: 'trainName', trainLevel: 0, trainAddSTR: 0, trainAddINT: 0, trainAddVIT: 0, trainAddEXP: 0, deadLoseSTR: 0, deadLoseINT: 0, deadLoseVIT: 0, deadLoseEXP: 0, date: '${DateTime.now().year} / ${DateTime.now().month} / ${DateTime.now().day}'));
      default: allMonsterList[0].monsterHp-=player.STR;
    }
    if(allMonsterList[type].monsterHp<=0){
      allMonsterList[type].monsterHp=0;
      addLogList(Log(logType: 1, playerName: player.name, monsterName: '', attackPoint: 0, trainName: allMonsterList[type].monsterName, trainLevel: allMonsterList[type].monsterLevel, trainAddSTR: allMonsterList[type].getSTR, trainAddINT: allMonsterList[type].getINT, trainAddVIT: allMonsterList[type].getVIT, trainAddEXP: allMonsterList[type].getEXP, deadLoseSTR: 0, deadLoseINT: 0, deadLoseVIT: 0, deadLoseEXP: 0, date: '${DateTime.now().year} / ${DateTime.now().month} / ${DateTime.now().day}'));
      switch(type){
        case 0 : player.STR+=allMonsterList[0].getSTR;addAchievementList(Achievement(type: (strMonsterLevel>5?6:3), description: '$allMonsterList[type].monsterName', date: '${DateTime.now().year} / ${DateTime.now().month} / ${DateTime.now().day}'));strMonsterLevel++;
        case 1 : player.INT+=allMonsterList[1].getINT;addAchievementList(Achievement(type: (intMonsterLevel>5?4:1), description: '$allMonsterList[type].monsterName', date: '${DateTime.now().year} / ${DateTime.now().month} / ${DateTime.now().day}'));intMonsterLevel++;
        case 2 : player.VIT+=allMonsterList[2].getVIT;addAchievementList(Achievement(type: (vitMonsterLevel>5?5:2), description: '$allMonsterList[type].monsterName', date: '${DateTime.now().year} / ${DateTime.now().month} / ${DateTime.now().day}'));vitMonsterLevel++;
      }
      getEXP(allMonsterList[type].getEXP);
      player.coin += allMonsterList[type].getCoin;
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
}