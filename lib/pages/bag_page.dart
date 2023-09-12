import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:liver_remake/PlayerData/playerData.dart';
import 'package:liver_remake/pages/info_page.dart';
import 'package:liver_remake/Model/Models.dart';
import 'package:provider/provider.dart';

class BagPage extends StatefulWidget{
  final Key? keyBagPage;
  const BagPage({this.keyBagPage}):super(key:keyBagPage);
  @override
  BagPageState createState() => BagPageState();
}

class BagPageState extends State<BagPage>{

  int _bagUITypeIndex=0;
  int _nowItemIndex = 0;

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
        return equipButton(screenWidth, screenHeight, item, player);
      }
    }
    else{
      return SizedBox(
        width: 0.3*screenWidth,
        height: 0.1*screenHeight,
      );
    }
  }

  Widget equipButton(double screenWidth, double screenHeight,Item item,Player player){
    final playerData = Provider.of<PlayerData>(context);
    return GestureDetector(
      onTap: (){
        if(item.status!=2){
          setState(() {
            player.STR += item.addSTR;
            player.INT += item.addINT;
            player.VIT += item.addVIT;
            playerData.unloadTypeItem(item.whatItem,player);
            playerData.bagItemsList[item.indexInList].status=2;
          });
        }
        else{
          setState(() {
            player.STR -= item.addSTR;
            player.INT -= item.addINT;
            player.VIT -= item.addVIT;
            playerData.unloadTypeItem(item.whatItem,player);
            playerData.bagItemsList[item.indexInList].status=1;
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
    final playerData = Provider.of<PlayerData>(context);
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
          playerData.bagItemsList[item.indexInList].status=0;
          _nowItemIndex=0;
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
    final player = Provider.of<PlayerData>(context).player;
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

  @override
  Widget build(BuildContext context){
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final playerData = Provider.of<PlayerData>(context);
    final player = Provider.of<PlayerData>(context).player;
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
            bagUIScene(screenWidth, screenHeight,player),
            arrowAndMenuBar(screenWidth, screenHeight),
          ],
        ),
      ),
    );
  }
}