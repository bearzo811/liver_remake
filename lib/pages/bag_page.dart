import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:liver_remake/PlayerData/playerData.dart';
import 'package:liver_remake/pages/info_page.dart';
import 'package:liver_remake/Model/Models.dart';
import 'package:provider/provider.dart';

import '../firebase/firebase_controller.dart';

class BagPage extends StatefulWidget{
  final Key? keyBagPage;
  const BagPage({this.keyBagPage}):super(key:keyBagPage);
  @override
  BagPageState createState() => BagPageState();
}

class BagPageState extends State<BagPage>{

  int _bagUITypeIndex=0;
  int _nowItemIndex = 0;
  Player playerTemp = Player(
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
                    builder: (context)=>const InfoPage()
                )
            );
          },
          child: SizedBox(
            width: 0.18*screenWidth,
            height: 0.08*screenHeight,
            child: Image.asset('assets/Info/Info_Button.png',fit: BoxFit.cover,),
          ),
        ),
      ],
    );
  }

  Widget useOrEquipButton(double screenWidth, double screenHeight,Item item,Player player){
    final playerData = Provider.of<PlayerData>(context);
    if(playerData.getBagListByType(_bagUITypeIndex).isNotEmpty){
      if(_bagUITypeIndex==4){
        return useButton(screenWidth, screenHeight, item, player);
      }
      else{
        return equipButton(screenWidth, screenHeight, item);
      }
    }
    else{
      return SizedBox(
        width: 0.3*screenWidth,
        height: 0.1*screenHeight,
      );
    }
  }

  Widget equipButton(double screenWidth, double screenHeight,Item item){
    final playerData = Provider.of<PlayerData>(context);
    final player = Provider.of<PlayerData>(context).player;
    return GestureDetector(
      onTap: (){
        if(item.status!=2){
          setState(() {
            playerData.unloadTypeItem(item.whatItem,player);
            playerData.bagItemsList[item.indexInList].status=2;
            playerData.reFreshItemOnBodyWithStatus2();
          });
        }
        else{
          setState(() {
            playerData.unloadTypeItem(item.whatItem,player);
            playerData.bagItemsList[item.indexInList].status=1;
            playerData.reFreshItemOnBodyWithStatus2();
          });
        }
        updateAllData(playerData);
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
    final playerData = Provider.of<PlayerData>(context);
    final player = Provider.of<PlayerData>(context).player;
    return GestureDetector(
      onTap: (){
        setState(() {
          if(item.addMp>0){
            playerData.getMP(item.addMp);
          }
          else{
            playerData.getEXP(item.addExp);
          }
          playerData.bagItemsList[item.indexInList].status=0;
          _nowItemIndex=0;
        });
        updateAllData(playerData);
      },
      child: Container(
        width: 0.3*screenWidth,
        height: 0.1*screenHeight,
        decoration: BoxDecoration(
            image: DecorationImage(
                image:(((item.addMp>0 && player.mp<player.maxMp) || (item.addExp>0)) ?AssetImage('assets/Info/Use_Button.png'):AssetImage('')),
                fit: BoxFit.contain
            )
        ),
      ),
    );
  }

  Widget bagItem(double screenWidth, double screenHeight,Item item,int index){
    final player = Provider.of<PlayerData>(context).player;
    return GestureDetector(
      onTap: (){
        setState(() {
          _nowItemIndex = index;
          //BackHair,BackItem,Clothes,Ears,EyeDecoration,Eyes,ForeHair,Head_Body,HeavyWeapon,LightWeapon,Mouth,Pants,Shoes
          if(item.whatItem == 'BackHair'){
            playerTemp.backHairTypeIndex = getItemType(item.itemIndex);
            playerTemp.backHairColorIndex = getItemIndex(item.itemIndex);
          }
          else if(item.whatItem == 'BackItem'){
            playerTemp.backItemIndex = int.parse(item.itemIndex);
          }
          else if(item.whatItem == 'Clothes'){
            playerTemp.clothesIndex = int.parse(item.itemIndex);
          }
          else if(item.whatItem == 'Ears'){
            playerTemp.earsTypeIndex = getItemType(item.itemIndex);
            playerTemp.earsColorIndex = getItemIndex(item.itemIndex);
          }
          else if(item.whatItem == 'EyeDecoration'){
            playerTemp.eyeDecorationIndex = int.parse(item.itemIndex);
          }
          else if(item.whatItem == 'Eyes'){
            playerTemp.eyesTypeIndex = getItemType(item.itemIndex);
            playerTemp.eyesColorIndex = getItemIndex(item.itemIndex);
          }
          else if(item.whatItem == 'ForeHair'){
            playerTemp.foreHairTypeIndex = getItemType(item.itemIndex);
            playerTemp.foreHairColorIndex = getItemIndex(item.itemIndex);
          }
          else if(item.whatItem == 'Head_Body'){
            playerTemp.bodyIndex = int.parse(item.itemIndex);
          }
          else if(item.whatItem == 'HeavyWeapon'){
            playerTemp.heavyWeaponIndex = int.parse(item.itemIndex);
          }
          else if(item.whatItem == 'LightWeapon'){
            playerTemp.lightWeaponIndex = int.parse(item.itemIndex);
          }
          else if(item.whatItem == 'Mouth'){
            playerTemp.mouthIndex = int.parse(item.itemIndex);
          }
          else if(item.whatItem == 'Pants'){
            playerTemp.pantsIndex = int.parse(item.itemIndex);
          }
          else if(item.whatItem == 'Shoes'){
            playerTemp.shoesIndex = int.parse(item.itemIndex);
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
    final playerData = Provider.of<PlayerData>(context);
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
                  itemCount: playerData.getBagListByType(_bagUITypeIndex).length,
                  itemBuilder: (BuildContext context,int index){
                    return ListTile(
                      title: bagItem(screenWidth, screenHeight, playerData.getBagListByType(_bagUITypeIndex)[index],index),
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
                    SizedBox(height: 0.015*screenHeight,),
                    (playerData.getBagListByType(_bagUITypeIndex).isNotEmpty?useOrEquipButton(screenWidth, screenHeight, playerData.getBagListByType(_bagUITypeIndex)[_nowItemIndex], player):Container())
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Player copyPlayer(Player player){
    Player playerTemp = Player(
        bodyIndex: player.bodyIndex,
        earsTypeIndex: player.earsTypeIndex,
        earsColorIndex: player.earsColorIndex,
        clothesIndex: player.clothesIndex,
        pantsIndex: player.pantsIndex,
        shoesIndex: player.shoesIndex,
        eyesTypeIndex: player.eyesTypeIndex,
        eyesColorIndex: player.eyesColorIndex,
        mouthIndex: player.mouthIndex,
        backHairTypeIndex: player.backHairTypeIndex,
        backHairColorIndex: player.backHairColorIndex,
        foreHairTypeIndex: player.foreHairTypeIndex,
        foreHairColorIndex: player.foreHairColorIndex,
        backItemIndex: player.backItemIndex,
        eyeDecorationIndex: player.eyeDecorationIndex,
        heavyWeaponIndex: player.heavyWeaponIndex,
        lightWeaponIndex: player.lightWeaponIndex,
        name: player.name,
        level: player.level,
        ogSTR: player.STR,
        ogINT: player.INT,
        ogVIT: player.VIT,
        hp: player.hp,
        mp: player.mp,
        exp: player.exp,
        maxMp: player.maxMp,
        maxExp: player.maxExp,
        coin: player.coin,
        sp: player.sp
    );
    return playerTemp;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final playerData = Provider.of<PlayerData>(context);
    playerTemp = copyPlayer(playerData.player);
  }

  @override
  Widget build(BuildContext context){
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final playerData = Provider.of<PlayerData>(context);
    final player = Provider.of<PlayerData>(context).player;
    Provider.of<PlayerData>(context).checkMonsterAttacked();
    for(int i=0;i<playerData.bagItemsList.length;i++){
      playerData.bagItemsList[i].getIndexInList(i);
    }
    return Scaffold(
      backgroundColor: const Color(0xFFE2C799),
      body: SafeArea(
        child: Column(
          children: [
            characterStatusBlockWithHomeButton(screenWidth, screenHeight,player,context),
            SizedBox(height: 0.03*screenHeight,),
            bagUIScene(screenWidth, screenHeight,playerTemp),
            arrowAndMenuBar(screenWidth, screenHeight),
          ],
        ),
      ),
    );
  }
}