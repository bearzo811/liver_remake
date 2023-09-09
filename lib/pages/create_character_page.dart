import 'package:flutter/material.dart';
import 'package:liver_remake/pages/main_page.dart';
import 'package:liver_remake/widget/characterStatusBlock.dart';

class CreateCharacterPage extends StatefulWidget{
  @override
  _CreateCharacterPage createState() => _CreateCharacterPage();
}

class _CreateCharacterPage extends State<CreateCharacterPage>{

  int _selectBoxIndex = 0;
  final List<String> _selectBoxTitleList = ['身體 & 耳朵','服裝','眼睛 & 嘴吧','髮型'];
  Player player = Player(
      bodyIndex: 2, earsTypeIndex: 0, earsColorIndex: 0, clothesIndex: 0, pantsIndex: 0, shoesIndex: 0,
      eyesTypeIndex: 0, eyesColorIndex: 0, mouthIndex: 0, backHairTypeIndex: 1, backHairColorIndex: 0,
      foreHairTypeIndex: 1, foreHairColorIndex: 0, backItemIndex: 0, eyeDecorationIndex: 0, heavyWeaponIndex: 0, lightWeaponIndex: 0,
      name: 'name', level: 99, STR:0,INT:0,VIT:0,hp:1,mp: 10, exp: 8, maxMp: 10, maxExp: 10, coin: 93);
  TextEditingController nameController = TextEditingController();
  String _name = '';

  Widget arrowBar(double screenWidth, double screenHeight){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: (){
            setState(() {
              if (_selectBoxIndex > 0) {
                _selectBoxIndex--;
              }
              else{
                _selectBoxIndex=3;
              }
            });
          },
          child: Container(
            height: 0.0625*screenHeight,
            width: 0.125*screenWidth,
            child: Image.asset('assets/PrevButton.png',fit: BoxFit.cover,),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 0.2*screenWidth),
          child: SizedBox(
            width: 0.27*screenWidth,
            child: Center(
              child: Text(_selectBoxTitleList[_selectBoxIndex],style: TextStyle(fontSize: 20,color: Colors.white)),
            )
          )
        ),
        GestureDetector(
          onTap: (){
            setState(() {
              if (_selectBoxIndex < 3) {
                _selectBoxIndex++;
              }
              else{
                _selectBoxIndex=0;
              }
            });
          },
          child: Container(
            height: 0.0625*screenHeight,
            width: 0.125*screenWidth,
            child: Image.asset('assets/NextButton.png',fit: BoxFit.cover,),
          ),
        )
      ],
    );
  }

  Widget _buildBodySkinBlock(double screenWidth, double screenHeight) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        for (int i = 0; i < 5; i++)
          GestureDetector(
            onTap: () {
              setState(() {
                player.bodyIndex =i;
              });
            },
            child: Container(
              height: 0.05 * screenHeight,
              width: 0.1 * screenWidth,
              child: Image.asset(
                'assets/Skin_Block/$i.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildEarsSkinBlock(double screenWidth, double screenHeight) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        for (int i = 0; i < 5; i++)
          GestureDetector(
            onTap: () {
              setState(() {
                player.earsColorIndex =i;
              });
            },
            child: Container(
              height: 0.05 * screenHeight,
              width: 0.1 * screenWidth,
              child: Image.asset(
                'assets/Skin_Block/$i.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildEyesSkinBlock(double screenWidth, double screenHeight) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            for (int i = 0; i < 5; i++)
              GestureDetector(
                onTap: () {
                  setState(() {
                    player.eyesColorIndex =i;
                  });
                },
                child: Container(
                  height: 0.05 * screenHeight,
                  width: 0.1 * screenWidth,
                  child: Image.asset(
                    'assets/Eyes_Block/$i.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
          ],
        ),
        SizedBox(height: 0.01*screenHeight,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            for (int i = 0; i < 5; i++)
              GestureDetector(
                onTap: () {
                  setState(() {
                    player.eyesColorIndex =i+5;
                  });
                },
                child: Container(
                  height: 0.05 * screenHeight,
                  width: 0.1 * screenWidth,
                  child: Image.asset(
                    'assets/Eyes_Block/${i+5}.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }

  Widget _buildBackHairSkinBlock(double screenWidth, double screenHeight) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            for (int i = 0; i < 5; i++)
              GestureDetector(
                onTap: () {
                  setState(() {
                    player.backHairColorIndex =i;
                  });
                },
                child: Container(
                  height: 0.05 * screenHeight,
                  width: 0.1 * screenWidth,
                  child: Image.asset(
                    'assets/Eyes_Block/$i.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
          ],
        ),
        SizedBox(height: 0.01*screenHeight,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            for (int i = 0; i < 4; i++)
              GestureDetector(
                onTap: () {
                  setState(() {
                    player.backHairColorIndex =i+5;
                  });
                },
                child: Container(
                  height: 0.05 * screenHeight,
                  width: 0.1 * screenWidth,
                  child: Image.asset(
                    'assets/Eyes_Block/${i+5}.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }

  Widget _buildForeHairSkinBlock(double screenWidth, double screenHeight) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            for (int i = 0; i < 5; i++)
              GestureDetector(
                onTap: () {
                  setState(() {
                    player.foreHairColorIndex =i;
                  });
                },
                child: Container(
                  height: 0.05 * screenHeight,
                  width: 0.1 * screenWidth,
                  child: Image.asset(
                    'assets/Eyes_Block/$i.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
          ],
        ),
        SizedBox(height: 0.01*screenHeight,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            for (int i = 0; i < 4; i++)
              GestureDetector(
                onTap: () {
                  setState(() {
                    player.foreHairColorIndex =i+5;
                  });
                },
                child: Container(
                  height: 0.05 * screenHeight,
                  width: 0.1 * screenWidth,
                  child: Image.asset(
                    'assets/Eyes_Block/${i+5}.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }

  Widget selectBody(double screenWidth, double screenHeight){
    return Container(
      width: 0.8*screenWidth,
      height: 0.55*screenHeight,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/Select_Body.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        children: [
          SizedBox(height: 0.23*screenHeight),
          _buildBodySkinBlock(screenWidth, screenHeight),
          SizedBox(height: 0.075*screenHeight,),
          Row(
            children: [
              SizedBox(width: 0.35*screenWidth,),
              GestureDetector(
                onTap: (){
                  setState(() {
                    if(player.earsTypeIndex==1){
                      player.earsTypeIndex=0;
                    }
                    else{
                      player.earsTypeIndex=1;
                    }
                  });
                },
                child: Container(
                  height: 0.0625*screenHeight,
                  width: 0.125*screenWidth,
                  child: Image.asset('assets/PrevButton.png',fit: BoxFit.cover,),
                ),
              ),
              SizedBox(width: 0.1*screenWidth,),
              GestureDetector(
                onTap: (){
                  setState(() {
                    if(player.earsTypeIndex==0){
                      player.earsTypeIndex=1;
                    }
                    else{
                      player.earsTypeIndex=0;
                    }
                  });
                },
                child: Container(
                  height: 0.0625*screenHeight,
                  width: 0.125*screenWidth,
                  child: Image.asset('assets/NextButton.png',fit: BoxFit.cover,),
                ),
              ),
            ],
          ),
          SizedBox(height: 0.04*screenHeight,),
          _buildEarsSkinBlock(screenWidth, screenHeight),
        ],
      ),
    );
  }

  Widget selectEquipment(double screenWidth, double screenHeight){
    return Container(
      width: 0.8*screenWidth,
      height: 0.55*screenHeight,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/Select_Equipment.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        children: [
          SizedBox(height: 0.14*screenHeight,),
          Row(
            children: [
              SizedBox(width: 0.35*screenWidth,),
              GestureDetector(
                onTap: (){
                  setState(() {
                    if(player.clothesIndex>0){
                      player.clothesIndex--;
                    }
                    else{
                      player.clothesIndex=7;
                    }
                  });
                },
                child: Container(
                  height: 0.0625*screenHeight,
                  width: 0.125*screenWidth,
                  child: Image.asset('assets/PrevButton.png',fit: BoxFit.cover,),
                ),
              ),
              SizedBox(width: 0.1*screenWidth,),
              GestureDetector(
                onTap: (){
                  setState(() {
                    if(player.clothesIndex<7){
                      player.clothesIndex++;
                    }
                    else{
                      player.clothesIndex=0;
                    }
                  });
                },
                child: Container(
                  height: 0.0625*screenHeight,
                  width: 0.125*screenWidth,
                  child: Image.asset('assets/NextButton.png',fit: BoxFit.cover,),
                ),
              ),
            ],
          ),
          SizedBox(height: 0.04*screenHeight,),
          Row(
            children: [
              SizedBox(width: 0.35*screenWidth,),
              GestureDetector(
                onTap: (){
                  setState(() {
                    if(player.pantsIndex>0){
                      player.pantsIndex--;
                    }
                    else{
                      player.pantsIndex=11;
                    }
                  });
                },
                child: Container(
                  height: 0.0625*screenHeight,
                  width: 0.125*screenWidth,
                  child: Image.asset('assets/PrevButton.png',fit: BoxFit.cover,),
                ),
              ),
              SizedBox(width: 0.1*screenWidth,),
              GestureDetector(
                onTap: (){
                  setState(() {
                    if(player.pantsIndex<11){
                      player.pantsIndex++;
                    }
                    else{
                      player.pantsIndex=0;
                    }
                  });
                },
                child: Container(
                  height: 0.0625*screenHeight,
                  width: 0.125*screenWidth,
                  child: Image.asset('assets/NextButton.png',fit: BoxFit.cover,),
                ),
              ),
            ],
          ),
          SizedBox(height: 0.045*screenHeight,),
          Row(
            children: [
              SizedBox(width: 0.35*screenWidth,),
              GestureDetector(
                onTap: (){
                  setState(() {
                    if(player.shoesIndex>0){
                      player.shoesIndex--;
                    }
                    else{
                      player.shoesIndex=5;
                    }
                  });
                },
                child: Container(
                  height: 0.0625*screenHeight,
                  width: 0.125*screenWidth,
                  child: Image.asset('assets/PrevButton.png',fit: BoxFit.cover,),
                ),
              ),
              SizedBox(width: 0.1*screenWidth,),
              GestureDetector(
                onTap: (){
                  setState(() {
                    if(player.shoesIndex<5){
                      player.shoesIndex++;
                    }
                    else{
                      player.shoesIndex=0;
                    }
                  });
                },
                child: Container(
                  height: 0.0625*screenHeight,
                  width: 0.125*screenWidth,
                  child: Image.asset('assets/NextButton.png',fit: BoxFit.cover,),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget selectFace(double screenWidth, double screenHeight){
    return Container(
      width: 0.8*screenWidth,
      height: 0.55*screenHeight,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/Select_Face.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        children: [
          SizedBox(height: 0.14*screenHeight,),
          Row(
            children: [
              SizedBox(width: 0.35*screenWidth,),
              GestureDetector(
                onTap: (){
                  setState(() {
                    if(player.eyesTypeIndex>0){
                      player.eyesTypeIndex--;
                    }
                    else{
                      player.eyesTypeIndex=3;
                    }
                  });
                },
                child: Container(
                  height: 0.0625*screenHeight,
                  width: 0.125*screenWidth,
                  child: Image.asset('assets/PrevButton.png',fit: BoxFit.cover,),
                ),
              ),
              SizedBox(width: 0.1*screenWidth,),
              GestureDetector(
                onTap: (){
                  setState(() {
                    if(player.eyesTypeIndex<3){
                      player.eyesTypeIndex++;
                    }
                    else{
                      player.eyesTypeIndex=0;
                    }
                  });
                },
                child: Container(
                  height: 0.0625*screenHeight,
                  width: 0.125*screenWidth,
                  child: Image.asset('assets/NextButton.png',fit: BoxFit.cover,),
                ),
              ),
            ],
          ),
          SizedBox(height: 0.005*screenHeight,),
          _buildEyesSkinBlock(screenWidth, screenHeight),
          SizedBox(height: 0.03*screenHeight,),
          Row(
            children: [
              SizedBox(width: 0.35*screenWidth,),
              GestureDetector(
                onTap: (){
                  setState(() {
                    if(player.mouthIndex>0){
                      player.mouthIndex--;
                    }
                    else{
                      player.mouthIndex=4;
                    }
                  });
                },
                child: Container(
                  height: 0.0625*screenHeight,
                  width: 0.125*screenWidth,
                  child: Image.asset('assets/PrevButton.png',fit: BoxFit.cover,),
                ),
              ),
              SizedBox(width: 0.1*screenWidth,),
              GestureDetector(
                onTap: (){
                  setState(() {
                    if(player.mouthIndex<4){
                      player.mouthIndex++;
                    }
                    else{
                      player.mouthIndex=0;
                    }
                  });
                },
                child: Container(
                  height: 0.0625*screenHeight,
                  width: 0.125*screenWidth,
                  child: Image.asset('assets/NextButton.png',fit: BoxFit.cover,),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget selectHair(double screenWidth, double screenHeight){
    return Container(
      width: 0.8*screenWidth,
      height: 0.55*screenHeight,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/Select_Hair.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        children: [
          SizedBox(height: 0.14*screenHeight,),
          Row(
            children: [
              SizedBox(width: 0.35*screenWidth,),
              GestureDetector(
                onTap: (){
                  setState(() {
                    if(player.backHairTypeIndex>0){
                      player.backHairTypeIndex--;
                    }
                    else{
                      player.backHairTypeIndex=2;
                      player.backHairColorIndex=0;
                    }
                  });
                },
                child: Container(
                  height: 0.0625*screenHeight,
                  width: 0.125*screenWidth,
                  child: Image.asset('assets/PrevButton.png',fit: BoxFit.cover,),
                ),
              ),
              SizedBox(width: 0.1*screenWidth,),
              GestureDetector(
                onTap: (){
                  setState(() {
                    if(player.backHairTypeIndex<2){
                      player.backHairTypeIndex++;
                      if(player.backHairTypeIndex==2){
                        player.backHairColorIndex=0;
                      }
                    }
                    else{
                      player.backHairTypeIndex=0;
                    }
                  });
                },
                child: Container(
                  height: 0.0625*screenHeight,
                  width: 0.125*screenWidth,
                  child: Image.asset('assets/NextButton.png',fit: BoxFit.cover,),
                ),
              ),
            ],
          ),
          SizedBox(height: 0.005*screenHeight,),
          (player.backHairTypeIndex==2?
              Container(
                child: Column(
                  children: [
                    SizedBox(height: 0.03*screenHeight,),
                    const SizedBox(
                      child: Text('無後髮',style: TextStyle(fontSize: 30,color: Colors.white,)),
                    ),
                  ],
                ),
              ):
              _buildBackHairSkinBlock(screenWidth, screenHeight)),
          (player.backHairTypeIndex == 2? SizedBox(height: 0.07*screenHeight) : SizedBox(height: 0.025*screenHeight)),
          Row(
            children: [
              SizedBox(width: 0.35*screenWidth,),
              GestureDetector(
                onTap: (){
                  setState(() {
                    if(player.foreHairTypeIndex>0){
                      player.foreHairTypeIndex--;
                      if(player.foreHairTypeIndex==0){
                        player.foreHairColorIndex=0;
                      }
                    }
                    else{
                      player.foreHairTypeIndex=3;
                    }
                  });
                },
                child: Container(
                  height: 0.0625*screenHeight,
                  width: 0.125*screenWidth,
                  child: Image.asset('assets/PrevButton.png',fit: BoxFit.cover,),
                ),
              ),
              SizedBox(width: 0.1*screenWidth,),
              GestureDetector(
                onTap: (){
                  setState(() {
                    if(player.foreHairTypeIndex<3){
                      player.foreHairTypeIndex++;
                    }
                    else{
                      player.foreHairTypeIndex=0;
                      player.foreHairColorIndex=0;
                    }
                  });
                },
                child: Container(
                  height: 0.0625*screenHeight,
                  width: 0.125*screenWidth,
                  child: Image.asset('assets/NextButton.png',fit: BoxFit.cover,),
                ),
              ),
            ],
          ),
          SizedBox(height: 0.005*screenHeight,),
          (player.foreHairTypeIndex==0?
          Container(
            child: Column(
              children: [
                SizedBox(height: 0.03*screenHeight,),
                SizedBox(
                  child: Text('無前髮',style: TextStyle(fontSize: 30,color: Colors.white,)),
                )
              ],
            ),
          ):
          _buildForeHairSkinBlock(screenWidth, screenHeight)),
        ],
      ),
    );
  }

  Widget selectBox(double screenWidth, double screenHeight,int _selectBoxIndex){
    switch(_selectBoxIndex){
      case 0: return selectBody(screenWidth,screenHeight);
      case 1: return selectEquipment(screenWidth,screenHeight);
      case 2: return selectFace(screenWidth,screenHeight);
      case 3: return selectHair(screenWidth,screenHeight);
      default: return Container();
    }
  }

  Widget okLogoutBar(double screenWidth, double screenHeight){
    return Row(
      //mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(left:0.3*screenWidth,right: 0.13*screenWidth),
          child: GestureDetector(
              onTap: (){
                _name = nameController.text;
                player.name = _name;
                print(player.name);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context)=>MainPage()
                    )
                );
              },
              child: Container(
                width: 0.4*screenWidth,
                height: 0.05*screenHeight,
                child: Image.asset('assets/OKButton.png',fit: BoxFit.cover,),
              )
          ),
        ),
        GestureDetector(
          onTap: (){},
          child: Container(
            width: 0.125*screenWidth,
            height: 0.05*screenHeight,
            child: Image.asset('assets/LogOutButton.png',fit: BoxFit.cover,),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context){
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(146, 65, 1, 100),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/SelectBG.png'),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(height: 0.02*screenHeight,),
                      Container(
                        height: 0.04*screenHeight,
                        width: 0.5*screenWidth,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/Name_TextBar.png'),
                            fit: BoxFit.contain
                          )
                        ),
                        child: Column(
                          children: [
                            SizedBox(height: 0.015*screenHeight,),
                            Container(
                              width: 0.5*screenWidth,
                              height: 0.025*screenHeight,
                              child: TextField(
                                controller: nameController,
                                textAlign: TextAlign.center,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: '請輸入您的名稱',
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      character(screenWidth, screenHeight,player),
                      arrowBar(screenWidth, screenHeight),
                      SizedBox(height: 0.01*screenHeight,),
                      selectBox(screenWidth, screenHeight,_selectBoxIndex),
                      SizedBox(height: 0.01*screenHeight,),
                      okLogoutBar(screenWidth, screenHeight)
                    ],
                  ),
                )
            )
        ),
      )
    );
  }
}
/*
Stack(
children: [
const Image(image: AssetImage('assets/Name_TextBar.png'),fit: BoxFit.cover,),
Container(
color: Colors.amber,
height: 0.05*screenHeight,
width: 0.5*screenWidth,
child: TextField(
controller: nameController,
textAlign: TextAlign.center,
decoration: const InputDecoration(
border: InputBorder.none,
hintText: '請輸入您的名稱',
),
),
),
*/