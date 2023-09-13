import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:liver_remake/PlayerData/playerData.dart';
import 'package:liver_remake/pages/main_page.dart';
import 'package:liver_remake/pages/skill_page.dart';
import 'package:liver_remake/pages/train_page.dart';
import 'package:liver_remake/Model/Models.dart';
import 'log_page.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget{
  final Key? keyShopPage;
  const ShopPage({this.keyShopPage}):super(key:keyShopPage);

  @override
  ShopPageState createState() => ShopPageState();
}

class ShopPageState extends State<ShopPage>{

  int _shopUITypeIndex=0;
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

  Widget menuBlock(double screenWidth, double screenHeight){
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
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MainPage()
                  )
              );
            },
            child: SizedBox(
              width: 0.6*screenWidth,
              height: 0.065*screenHeight,
              child: Image.asset('assets/New_Battle_Button.png',fit: BoxFit.contain,),
            ),
          ),
          GestureDetector(
            onTap: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const TrainPage()
                  )
              );
            },
            child: SizedBox(
              width: 0.6*screenWidth,
              height: 0.065*screenHeight,
              child: Image.asset('assets/New_Train_Button.png',fit: BoxFit.contain,),
            ),
          ),
          GestureDetector(
            onTap: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SkillPage()
                  )
              );
            },
            child: SizedBox(
              width: 0.6*screenWidth,
              height: 0.065*screenHeight,
              child: Image.asset('assets/New_Skill_Button.png',fit: BoxFit.contain,),
            ),
          ),
          GestureDetector(
            onTap: (){
              Navigator.of(context).pop();
            },
            child: SizedBox(
              width: 0.6*screenWidth,
              height: 0.065*screenHeight,
              child: Image.asset('assets/New_Shop_Button.png',fit: BoxFit.contain,),
            ),
          ),
          GestureDetector(
            onTap: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context)=>const LogPage()
                  )
              );
            },
            child: SizedBox(
              width: 0.6*screenWidth,
              height: 0.065*screenHeight,
              child: Image.asset('assets/New_Log_Button.png',fit: BoxFit.contain,),
            ),
          ),
          GestureDetector(
            onTap: (){
            },
            child: SizedBox(
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
                    setState(() {
                      _nowItemIndex=0;
                      if(_shopUITypeIndex>0){
                        _shopUITypeIndex--;
                      }
                      else{
                        _shopUITypeIndex=4;
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
                      if(_shopUITypeIndex<4){
                        _shopUITypeIndex++;
                      }
                      else{
                        _shopUITypeIndex=0;
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
            showDialog(
                context: context,
                barrierDismissible: true,
                builder: (BuildContext context){
                  return AlertDialog(
                    backgroundColor: const Color.fromRGBO(0, 0, 0, 0),
                    content: menuBlock(screenWidth, screenHeight),
                  );
                }
            );
          },
          child: SizedBox(
            width: 0.18*screenWidth,
            height: 0.08*screenHeight,
            child: Image.asset('assets/Menu_Button.png',fit: BoxFit.cover,),
          ),
        ),
      ],
    );
  }

  Widget buyButton(double screenWidth, double screenHeight,Item item,Player player){
    final shopItemsList = Provider.of<PlayerData>(context).shopItemsList;
    final playerData = Provider.of<PlayerData>(context);
    return GestureDetector(
      onTap: (){
        if(player.coin>=item.coin){
          if(item.whatItem=='Potions'){
            setState(() {
              playerData.buyPotions(item.indexInList, item.coin);
            });
          }
          else{
            setState(() {
              playerData.buyItem(item.indexInList, item.coin);
              _nowItemIndex=0;
            });
          }
        }
      },
      child: Container(
        width: 0.3*screenWidth,
        height: 0.1*screenHeight,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: (player.coin>=item.coin?const AssetImage('assets/Shop/Shop_BuyButton.png'):const AssetImage('assets/Shop/Shop_BuyButton_Unvailable.png')),
                fit: BoxFit.contain
            )
        ),
      ),
    );
  }

  Widget shopItem(double screenWidth, double screenHeight,Item item,int index,Player player){
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
                    SizedBox(
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

  Widget shopUIScene(double screenWidth, double screenHeight,Player playerTemp){
    final playerData = Provider.of<PlayerData>(context);
    List<ImageProvider> shopUIList = [
      const AssetImage('assets/Shop/Shop_UI_Weapons.png'),
      const AssetImage('assets/Shop/Shop_UI_Armors.png'),
      const AssetImage('assets/Shop/Shop_UI_Accessories.png'),
      const AssetImage('assets/Shop/Shop_UI_Body.png'),
      const AssetImage('assets/Shop/Shop_UI_Items.png'),
    ];
    //print('*** ${playerData.getListByTypeAndStatus(_shopUITypeIndex, 0).length}');
    return Container(
      width: 0.9*screenWidth,
      height: 0.62*screenHeight,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: shopUIList[_shopUITypeIndex],
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
                  itemCount: playerData.getListByTypeAndStatus(_shopUITypeIndex, 0).length,
                  itemBuilder: (BuildContext context,int index){
                    return ListTile(
                      title: shopItem(screenWidth, screenHeight, playerData.getListByTypeAndStatus(_shopUITypeIndex,0)[index],index,playerTemp),
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
                    character(screenWidth, screenHeight, playerTemp),
                    SizedBox(height: 0.015*screenHeight,),
                    (playerData.getListByTypeAndStatus(_shopUITypeIndex,0).isNotEmpty?buyButton(screenWidth, screenHeight, playerData.getListByTypeAndStatus(_shopUITypeIndex,0)[_nowItemIndex], playerData.player):Container())
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
    Provider.of<PlayerData>(context).checkMonsterAttacked();
    return Scaffold(
      backgroundColor: const Color(0xFFE2C799),
      body: SafeArea(
        child: Column(
          children: [
            characterStatusBlockWithInfoButton(screenWidth, screenHeight,playerData.player,context),
            SizedBox(height: 0.03*screenHeight,),
            shopUIScene(screenWidth, screenHeight,playerTemp),
            arrowAndMenuBar(screenWidth, screenHeight),
          ],
        ),
      ),
    );
  }
}