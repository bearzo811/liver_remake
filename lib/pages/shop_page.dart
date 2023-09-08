import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:liver_remake/pages/main_page.dart';
import 'package:liver_remake/pages/train_page.dart';
import 'package:liver_remake/widget/characterStatusBlock.dart';

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
      this.addMp
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
}

class ShopPage extends StatefulWidget{
  @override
  _ShopPage createState() => _ShopPage();
}

class _ShopPage extends State<ShopPage>{

  int _shopUITypeIndex=0;
  Player _player = Player(2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, '測試玩家', 99, 95, 101, 100, 150, 195);

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

  List<Item> getListByTypeAndStatus(int type,int status){
    List<Item> _result = [];
    for(int i=0;i<allItemsList.length;i++){
      if(allItemsList[i].type==type && allItemsList[i].status==status){
        _result.add(allItemsList[i]);
      }
    }
    return _result;
  }

  int getItemType(String itemIndex){
    return int.parse(itemIndex.split("-")[0]);
  }

  int getItemIndex(String itemIndex){
    return int.parse(itemIndex.split("-")[1]);
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
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context)=>MainPage()
                  )
              );
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
              Navigator.of(context).pop();
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
                    print('Left');
                    setState(() {
                      if(_shopUITypeIndex>0){
                        _shopUITypeIndex--;
                      }
                      else{
                        _shopUITypeIndex=4;
                      }
                    });
                  },
                  child: Container(
                    width: 0.18*screenWidth,
                    height: 0.08*screenHeight,
                    child: Image.asset('assets/Left_Arrow.png',fit: BoxFit.cover,),
                  )
              ),
              SizedBox(width: 0.1*screenWidth),
              GestureDetector(
                  onTap: (){
                    print('Right');
                    setState(() {
                      if(_shopUITypeIndex<4){
                        _shopUITypeIndex++;
                      }
                      else{
                        _shopUITypeIndex=0;
                      }
                    });

                  },
                  child: Container(
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

  Widget shopItem(double screenWidth, double screenHeight,Item item){
    return GestureDetector(
      onTap: (){
        setState(() {
          //BackHair,BackItem,Clothes,Ears,EyeDecoration,Eyes,ForeHair,Head_Body,HeavyWeapon,LightWeapon,Mouth,Pants,Shoes
          if(item.whatItem == 'BackHair'){
            _player.backHairTypeIndex = getItemType(item.itemIndex);
            _player.backHairColorIndex = getItemIndex(item.itemIndex);
          }
          else if(item.whatItem == 'BackItem'){
            _player.backItemIndex = int.parse(item.itemIndex);
          }
          else if(item.whatItem == 'Clothes'){
            _player.clothesIndex = int.parse(item.itemIndex);
          }
          else if(item.whatItem == 'Ears'){
            _player.earsTypeIndex = getItemType(item.itemIndex);
            _player.earsColorIndex = getItemIndex(item.itemIndex);
          }
          else if(item.whatItem == 'EyeDecoration'){
            _player.eyeDecorationIndex = int.parse(item.itemIndex);
          }
          else if(item.whatItem == 'Eyes'){
            _player.eyesTypeIndex = getItemType(item.itemIndex);
            _player.eyesColorIndex = getItemIndex(item.itemIndex);
          }
          else if(item.whatItem == 'ForeHair'){
            _player.foreHairTypeIndex = getItemType(item.itemIndex);
            _player.foreHairColorIndex = getItemIndex(item.itemIndex);
          }
          else if(item.whatItem == 'Head_Body'){
            _player.bodyIndex = int.parse(item.itemIndex);
          }
          else if(item.whatItem == 'HeavyWeapon'){
            _player.heavyWeaponIndex = int.parse(item.itemIndex);
          }
          else if(item.whatItem == 'LightWeapon'){
            _player.lightWeaponIndex = int.parse(item.itemIndex);
          }
          else if(item.whatItem == 'Mouth'){
            _player.mouthIndex = int.parse(item.itemIndex);
          }
          else if(item.whatItem == 'Pants'){
            _player.pantsIndex = int.parse(item.itemIndex);
          }
          else if(item.whatItem == 'Shoes'){
            _player.shoesIndex = int.parse(item.itemIndex);
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
                  width: 0.1*screenWidth,
                  height: 0.03*screenHeight,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/CharacterStatus/CharacterStatus_Coin.png'),
                          fit: BoxFit.contain
                      )
                  ),
                ),
                Column(
                  children: [
                    SizedBox(height:0.01*screenHeight),
                    Container(
                      width: 0.1*screenWidth,
                      height: 0.05*screenHeight,
                      child: AutoSizeText(
                        item.coin.toString(),
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFE3A16D),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                )
              ],
            ),
            SizedBox(height:0.008*screenHeight),
            Container(
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

  Widget ShopUIScence(double screenWidth, double screenHeight,Player player){

    List<ImageProvider> _shopUIList = [
      AssetImage('assets/Shop/Shop_UI_Weapons.png'),
      AssetImage('assets/Shop/Shop_UI_Armors.png'),
      AssetImage('assets/Shop/Shop_UI_Accessories.png'),
      AssetImage('assets/Shop/Shop_UI_Body.png'),
      AssetImage('assets/Shop/Shop_UI_Items.png'),
    ];

    return Container(
      width: 0.9*screenWidth,
      height: 0.62*screenHeight,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: _shopUIList[_shopUITypeIndex],
              fit: BoxFit.contain
          )
      ),
      child: Column(
        children: [
          SizedBox(height: 0.145*screenHeight,),
          Row(
            children: [
              SizedBox(width: 0.01*screenWidth,),
              Container(
                width: 0.5*screenWidth,
                height: 0.375*screenHeight,
                child: ListView.builder(
                  itemCount: getListByTypeAndStatus(_shopUITypeIndex, 0).length,
                  itemBuilder: (BuildContext context,int index){
                    return ListTile(
                      title: shopItem(screenWidth, screenHeight, getListByTypeAndStatus(_shopUITypeIndex,0)[index]),
                    );
                  },
                ),
              ),
              SizedBox(width: 0.01*screenWidth,),
              Container(
                width: 0.35*screenWidth,
                height: 0.375*screenHeight,
                child: Column(
                  children: [
                    SizedBox(height: 0.08*screenHeight,),
                    character(screenWidth, screenHeight, player),
                    SizedBox(height: 0.045*screenHeight,),
                    GestureDetector(
                      onTap: (){},
                      child: Container(
                        width: 0.3*screenWidth,
                        height: 0.1*screenHeight,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/Shop/Shop_BuyButton.png'),
                            fit: BoxFit.contain
                          )
                        ),
                      ),
                    )
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
    return Scaffold(
      backgroundColor: const Color(0xFFE2C799),
      body: SafeArea(
        child: Column(
          children: [
            CharacterStatusBlock(screenWidth, screenHeight,_player),
            SizedBox(height: 0.03*screenHeight,),
            ShopUIScence(screenWidth, screenHeight,_player),
            arrowAndMenuBar(screenWidth, screenHeight),
          ],
        ),
      ),
    );
  }
}