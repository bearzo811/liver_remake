import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:liver_remake/pages/info_page.dart';
import 'package:liver_remake/pages/main_page.dart';
import 'package:liver_remake/pages/train_page.dart';
import 'package:liver_remake/widget/characterStatusBlock.dart';

class BagPage extends StatefulWidget{
  @override
  _BagPage createState() => _BagPage();
}

class _BagPage extends State<BagPage>{

  int _bagUITypeIndex=0;
  int _nowItemIndex = 0;

  Player player = Player(
      bodyIndex: 2, earsTypeIndex: 0, earsColorIndex: 0, clothesIndex: 0, pantsIndex: 0, shoesIndex: 0,
      eyesTypeIndex: 0, eyesColorIndex: 0, mouthIndex: 0, backHairTypeIndex: 1, backHairColorIndex: 0,
      foreHairTypeIndex: 1, foreHairColorIndex: 0, backItemIndex: 0, eyeDecorationIndex: 0, heavyWeaponIndex: 0, lightWeaponIndex: 0,
      name: 'name', level: 99, STR:0,INT:0,VIT:0,hp:1,mp: 1, exp: 8, maxMp: 10, maxExp: 10, coin: 93);
  List<Item> allItemsList= [
    //0: weapon
    Item(0, 50, 10, 0, 0, 0, 'HeavyWeapon', '0','',0,0,),
    Item(0, 60, 15, 0, 0, 0, 'HeavyWeapon', '1','',0,0,),
    Item(0, 20, 5, 0, 0, 0, 'LightWeapon', '0','',0,0,),
    Item(0, 20, 5, 0, 0, 0, 'LightWeapon', '1','',0,0,),
    Item(0, 20, 5, 0, 0, 0, 'LightWeapon', '2','',0,0,),
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
    Item(4, 10, 0, 0, 0, 0, 'Potions', '0','EXP + 10',10,0,),
    Item(4, 10, 0, 0, 0, 0, 'Potions', '1','MP + 10',0,10,),
  ];
  List<Item> bagItemList= [
    //0: weapon
    Item(0, 50, 10, 0, 0, 0, 'HeavyWeapon', '0','',0,0,),
    Item(0, 60, 15, 0, 0, 0, 'HeavyWeapon', '1','',0,0,),
    Item(0, 20, 5, 0, 0, 0, 'LightWeapon', '0','',0,0,),
    Item(0, 20, 5, 0, 0, 0, 'LightWeapon', '2','',0,0,),
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
    Item(4, 10, 0, 0, 0, 0, 'Potions', '0','EXP + 10',1,0,),
    Item(4, 10, 0, 0, 0, 0, 'Potions', '1','MP + 10',0,1,),
    Item(4, 10, 0, 0, 0, 0, 'Potions', '0','EXP + 10',1,0,),
    Item(4, 10, 0, 0, 0, 0, 'Potions', '1','MP + 10',0,1,),
    Item(4, 10, 0, 0, 0, 0, 'Potions', '0','EXP + 10',1,0,),
    Item(4, 10, 0, 0, 0, 0, 'Potions', '1','MP + 10',0,1,),
    Item(4, 10, 0, 0, 0, 0, 'Potions', '0','EXP + 10',1,0,),
    Item(4, 10, 0, 0, 0, 0, 'Potions', '1','MP + 10',0,1,),
  ];

  List<Item> getBagListByType(int type){
    List<Item> result = [];
    for(int i=0;i<bagItemList.length;i++){
      if(bagItemList[i].type==type){
        result.add(bagItemList[i]);
      }
    }
    return result;
  }

  void unloadTypeItem(String whatItem){
    for(int i=0;i<bagItemList.length;i++){
      if(bagItemList[i].whatItem==whatItem){
        if(bagItemList[i].status==2){
          player.STR-=bagItemList[i].addSTR;
          player.INT-=bagItemList[i].addINT;
          player.VIT-=bagItemList[i].addVIT;
        }
        bagItemList[i].status=1;
      }
    }
  }

  int getItemType(String itemIndex){
    return int.parse(itemIndex.split("-")[0]);
  }

  int getItemIndex(String itemIndex){
    return int.parse(itemIndex.split("-")[1]);
  }

  Widget arrowAndMenuBar(double screenWidth, double screenHeight){
    return Row(
      //mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(left:0.25*screenWidth,right: 0.1*screenWidth),
          child: Row(
            children: [
              GestureDetector(
                  onTap: (){
                    setState(() {
                      _nowItemIndex=0;
                      if(_bagUITypeIndex>0){
                        _bagUITypeIndex--;
                      }
                      else{
                        _bagUITypeIndex=4;
                      }
                    });
                  },
                  child: SizedBox(
                    width: 0.18*screenWidth,
                    height: 0.08*screenHeight,
                    child: Image.asset('assets/Left_Arrow.png',fit: BoxFit.cover,),
                  )
              ),
              SizedBox(width: 0.1*screenWidth),
              GestureDetector(
                  onTap: (){
                    setState(() {
                      _nowItemIndex=0;
                      if(_bagUITypeIndex<4){
                        _bagUITypeIndex++;
                      }
                      else{
                        _bagUITypeIndex=0;
                      }
                    });

                  },
                  child: SizedBox(
                    width: 0.18*screenWidth,
                    height: 0.08*screenHeight,
                    child: Image.asset('assets/Right_Arrow.png',fit: BoxFit.cover,),
                  )
              )
            ],
          ),
        ),
        GestureDetector(
          onTap: (){
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context)=>InfoPage()
                )
            );
          },
          child: Container(
            width: 0.18*screenWidth,
            height: 0.08*screenHeight,
            child: Image.asset('assets/Info/Info_Button.png',fit: BoxFit.cover,),
          ),
        ),
      ],
    );
  }

  Widget equipButton(double screenWidth, double screenHeight,Item item,Player player){
    return GestureDetector(
      onTap: (){
        if(item.status!=2){
          setState(() {
            player.STR += item.addSTR;
            player.INT += item.addINT;
            player.VIT += item.addVIT;
            unloadTypeItem(item.whatItem);
            bagItemList[item.indexInList].status=2;
          });
        }
        else{
          setState(() {
            player.STR -= item.addSTR;
            player.INT -= item.addINT;
            player.VIT -= item.addVIT;
            unloadTypeItem(item.whatItem);
            bagItemList[item.indexInList].status=1;
          });
        }
      },
      child: Container(
        width: 0.3*screenWidth,
        height: 0.1*screenHeight,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: (item.status==2?const AssetImage('assets/Info/Unload_Button.png'):const AssetImage('assets/Info/Equip_Button.png')),
                fit: BoxFit.contain
            )
        ),
      ),
    );
  }

  Widget useButton(double screenWidth, double screenHeight,Item item,Player player){
    return GestureDetector(
      onTap: (){
        setState(() {
          if(item.addMp>0){
            if(player.mp<player.maxMp){
              player.mp+=item.addMp;
              if(player.mp>player.maxMp){
                player.mp=player.maxMp;
              }
            }
          }
          else{
            player.exp+=item.addExp;
            if(player.exp>player.maxExp){
              player.exp-=player.maxExp;
              player.level++;
            }
          }
          print(item.indexInList);
          bagItemList.removeAt(item.indexInList);
          print(bagItemList.length);
          for(int bagIndex=0;bagIndex<bagItemList.length;bagIndex++){
            //bagItemList[bagIndex].getIndexInList(bagIndex);
          }
        });
      },
      child: Container(
        width: 0.3*screenWidth,
        height: 0.1*screenHeight,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image:AssetImage('assets/Info/Use_Button.png'),
                fit: BoxFit.contain
            )
        ),
      ),
    );
  }

  Widget bagItem(double screenWidth, double screenHeight,Item item,int index){
    return GestureDetector(
      onTap: (){
        setState(() {
          _nowItemIndex = index;
          //BackHair,BackItem,Clothes,Ears,EyeDecoration,Eyes,ForeHair,Head_Body,HeavyWeapon,LightWeapon,Mouth,Pants,Shoes
          if(item.whatItem == 'BackHair'){
            player.backHairTypeIndex = getItemType(item.itemIndex);
            player.backHairColorIndex = getItemIndex(item.itemIndex);
          }
          else if(item.whatItem == 'BackItem'){
            player.backItemIndex = int.parse(item.itemIndex);
          }
          else if(item.whatItem == 'Clothes'){
            player.clothesIndex = int.parse(item.itemIndex);
          }
          else if(item.whatItem == 'Ears'){
            player.earsTypeIndex = getItemType(item.itemIndex);
            player.earsColorIndex = getItemIndex(item.itemIndex);
          }
          else if(item.whatItem == 'EyeDecoration'){
            player.eyeDecorationIndex = int.parse(item.itemIndex);
          }
          else if(item.whatItem == 'Eyes'){
            player.eyesTypeIndex = getItemType(item.itemIndex);
            player.eyesColorIndex = getItemIndex(item.itemIndex);
          }
          else if(item.whatItem == 'ForeHair'){
            player.foreHairTypeIndex = getItemType(item.itemIndex);
            player.foreHairColorIndex = getItemIndex(item.itemIndex);
          }
          else if(item.whatItem == 'Head_Body'){
            player.bodyIndex = int.parse(item.itemIndex);
          }
          else if(item.whatItem == 'HeavyWeapon'){
            player.heavyWeaponIndex = int.parse(item.itemIndex);
          }
          else if(item.whatItem == 'LightWeapon'){
            player.lightWeaponIndex = int.parse(item.itemIndex);
          }
          else if(item.whatItem == 'Mouth'){
            player.mouthIndex = int.parse(item.itemIndex);
          }
          else if(item.whatItem == 'Pants'){
            player.pantsIndex = int.parse(item.itemIndex);
          }
          else if(item.whatItem == 'Shoes'){
            player.shoesIndex = int.parse(item.itemIndex);
          }
        });
      },
      child: Container(
        height: 0.125*screenHeight,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/Shop/Shop_Item.png'),
                fit: BoxFit.contain
            )
        ),
        child: Column(
          children: [
            SizedBox(height: 0.015*screenHeight,),
            Row(
              children: [
                SizedBox(width: 0.03*screenWidth,),
                Container(
                  width: 0.11*screenWidth,
                  height: 0.052*screenHeight,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/Thumbnail/${item.whatItem}/${item.itemIndex}.png'),
                          fit: BoxFit.cover
                      )
                  ),
                ),
                SizedBox(width: 0.03*screenWidth,),
                Container(
                  width: 0.2*screenWidth,
                  height: 0.03*screenHeight,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: (item.status==2 ? const AssetImage('assets/Info/Backpack_ItemUI_EquippedMark.png'):const AssetImage('')),
                          fit: BoxFit.contain
                      )
                  ),
                ),
              ],
            ),
            SizedBox(height:0.015*screenHeight),
            SizedBox(
              width: 0.35*screenWidth,
              height: 0.04*screenHeight,
              child: AutoSizeText(
                (item.type!=4? item.getDescription():item.description),
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFE3A16D),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget bagUIScene(double screenWidth, double screenHeight,Player player){

    List<ImageProvider> shopUIList = [
      const AssetImage('assets/Shop/Shop_UI_Weapons.png'),
      const AssetImage('assets/Shop/Shop_UI_Armors.png'),
      const AssetImage('assets/Shop/Shop_UI_Accessories.png'),
      const AssetImage('assets/Shop/Shop_UI_Body.png'),
      const AssetImage('assets/Shop/Shop_UI_Items.png'),
    ];

    return Container(
      width: 0.9*screenWidth,
      height: 0.62*screenHeight,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: shopUIList[_bagUITypeIndex],
              fit: BoxFit.contain
          )
      ),
      child: Column(
        children: [
          SizedBox(height: 0.145*screenHeight,),
          Row(
            children: [
              SizedBox(width: 0.01*screenWidth,),
              SizedBox(
                width: 0.5*screenWidth,
                height: 0.375*screenHeight,
                child: ListView.builder(
                  itemCount: getBagListByType(_bagUITypeIndex).length,
                  itemBuilder: (BuildContext context,int index){
                    return ListTile(
                      title: bagItem(screenWidth, screenHeight, getBagListByType(_bagUITypeIndex)[index],index),
                    );
                  },
                ),
              ),
              SizedBox(width: 0.01*screenWidth,),
              SizedBox(
                width: 0.35*screenWidth,
                height: 0.375*screenHeight,
                child: Column(
                  children: [
                    SizedBox(height: 0.08*screenHeight,),
                    character(screenWidth, screenHeight, player),
                    SizedBox(height: 0.025*screenHeight,),
                    (_bagUITypeIndex==4?useButton(screenWidth, screenHeight, getBagListByType(_bagUITypeIndex)[_nowItemIndex], player):equipButton(screenWidth, screenHeight, getBagListByType(_bagUITypeIndex)[_nowItemIndex], player))
                  ],
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
    for(int i=0;i<bagItemList.length;i++){
      bagItemList[i].getIndexInList(i);
    }
    return Scaffold(
      backgroundColor: const Color(0xFFE2C799),
      body: SafeArea(
        child: Column(
          children: [
            characterStatusBlockWithHomeButton(screenWidth, screenHeight,player,context),
            SizedBox(height: 0.03*screenHeight,),
            bagUIScene(screenWidth, screenHeight,player),
            arrowAndMenuBar(screenWidth, screenHeight),
          ],
        ),
      ),
    );
  }
}