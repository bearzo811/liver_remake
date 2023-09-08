import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:liver_remake/pages/main_page.dart';
import 'package:liver_remake/pages/train_page.dart';
import 'package:liver_remake/widget/characterStatusBlock.dart';

class ShopPage extends StatefulWidget{
  @override
  _ShopPage createState() => _ShopPage();
}

class _ShopPage extends State<ShopPage>{

  int _shopUITypeIndex=0;
  Player _player = Player(2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0);

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
              SizedBox(width: 0.05*screenWidth,),
              Container(
                width: 0.45*screenWidth,
                height: 0.375*screenHeight,
                color: Colors.amber,
              ),
              SizedBox(width: 0.01*screenWidth,),
              Container(
                width: 0.35*screenWidth,
                height: 0.375*screenHeight,
                color: Colors.deepOrange,
                child: Column(
                  children: [
                    character(screenWidth, screenHeight, player),
                    GestureDetector(
                      onTap: (){},
                      child: Container(
                        width: 0.3*screenWidth,
                        height: 0.075*screenHeight,
                        //color: Colors.amber,
                        decoration: BoxDecoration(
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