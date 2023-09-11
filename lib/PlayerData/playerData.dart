import 'package:liver_remake/Model/Models.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
      coin: 20
  );

  int strMonsterLevel = 1;
  int intMonsterLevel = 1;
  int vitMonsterLevel = 1;

  List<Monster> allMonsterList = [
    Monster(monsterName: '每日晨跑', type: 0,monsterLevel:1),
    Monster(monsterName: '每日讀書', type: 1,monsterLevel:1),
    Monster(monsterName: '每日下廚', type: 2,monsterLevel:1)
  ];

  void updatePlayer(Player player){
    this.player = player;
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
      case 0 : allMonsterList[0].monsterHp-=player.STR;
      case 1 : allMonsterList[1].monsterHp-=player.INT;
      case 2 : allMonsterList[2].monsterHp-=player.VIT;
      default: allMonsterList[0].monsterHp-=player.STR;
    }
    if(allMonsterList[type].monsterHp<=0){
      allMonsterList[type].monsterHp=0;
      switch(type){
        case 0 : player.STR+=allMonsterList[0].getSTR;
        case 1 : player.INT+=allMonsterList[1].getINT;
        case 2 : player.VIT+=allMonsterList[2].getVIT;
      }
      getEXP(allMonsterList[type].getEXP);
    }
    notifyListeners();
  }

  void getEXP(int getEXP){
    player.exp+=getEXP;
    if(player.exp>=player.maxExp){
      player.level++;
      player.exp -= player.maxExp;
      player.maxExp = player.level*10;
    }
  }
}