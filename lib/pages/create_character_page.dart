import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:liver_remake/PlayerData/playerData.dart';
import 'package:liver_remake/pages/index_page.dart';
import 'package:liver_remake/pages/main_page.dart';
import 'package:liver_remake/Model/Models.dart';
import 'package:provider/provider.dart';
import 'package:liver_remake/firebase/firebase_controller.dart';

class CreateCharacterPage extends StatefulWidget{
  final Key? keyCreateCharacterPage;
  const CreateCharacterPage({this.keyCreateCharacterPage}) : super(key: keyCreateCharacterPage);
  @override
  CreateCharacterPageState createState() => CreateCharacterPageState();
}

class CreateCharacterPageState extends State<CreateCharacterPage>{

  int _selectBoxIndex = 0;
  final List<String> _selectBoxTitleList = ['身體 & 耳朵','服裝','眼睛 & 嘴吧','髮型'];
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
      exp: 5,
      maxMp: 10,
      maxExp: 10,
      coin: 10000,
      sp:99
  );
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
          child: SizedBox(
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
              child: Text(_selectBoxTitleList[_selectBoxIndex],style: const TextStyle(fontSize: 20,color: Colors.white)),
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
          child: SizedBox(
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
            child: SizedBox(
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
            child: SizedBox(
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
                child: SizedBox(
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
                child: SizedBox(
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
                child: SizedBox(
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
                child: SizedBox(
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
                child: SizedBox(
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
                child: SizedBox(
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
                child: SizedBox(
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
                child: SizedBox(
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
                child: SizedBox(
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
                child: SizedBox(
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
                child: SizedBox(
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
                child: SizedBox(
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
                child: SizedBox(
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
                child: SizedBox(
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
                child: SizedBox(
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
                child: SizedBox(
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
                child: SizedBox(
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
                child: SizedBox(
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
                child: SizedBox(
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
                child: SizedBox(
                  height: 0.0625*screenHeight,
                  width: 0.125*screenWidth,
                  child: Image.asset('assets/NextButton.png',fit: BoxFit.cover,),
                ),
              ),
            ],
          ),
          SizedBox(height: 0.005*screenHeight,),
          (player.backHairTypeIndex==2?
              Column(
                children: [
                  SizedBox(height: 0.03*screenHeight,),
                  const SizedBox(
                    child: Text('無後髮',style: TextStyle(fontSize: 30,color: Colors.white,)),
                  ),
                ],
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
                child: SizedBox(
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
                child: SizedBox(
                  height: 0.0625*screenHeight,
                  width: 0.125*screenWidth,
                  child: Image.asset('assets/NextButton.png',fit: BoxFit.cover,),
                ),
              ),
            ],
          ),
          SizedBox(height: 0.005*screenHeight,),
          (player.foreHairTypeIndex==0?
          Column(
            children: [
              SizedBox(height: 0.03*screenHeight,),
              const SizedBox(
                child: Text('無前髮',style: TextStyle(fontSize: 30,color: Colors.white,)),
              )
            ],
          ):
          _buildForeHairSkinBlock(screenWidth, screenHeight)),
        ],
      ),
    );
  }

  Widget selectBox(double screenWidth, double screenHeight,int selectBoxIndex){
    switch(selectBoxIndex){
      case 0: return selectBody(screenWidth,screenHeight);
      case 1: return selectEquipment(screenWidth,screenHeight);
      case 2: return selectFace(screenWidth,screenHeight);
      case 3: return selectHair(screenWidth,screenHeight);
      default: return Container();
    }
  }

  @override
  Widget build(BuildContext context){

    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final playerData = Provider.of<PlayerData>(context);
    return Scaffold(
      backgroundColor: const Color.fromRGBO(146, 65, 1, 100),
      body: SafeArea(
        child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Container(
                height: screenHeight,
                width: screenWidth,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/SelectBG.png'),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 0.25*screenHeight,
                        width: 0.5*screenWidth,
                        child: Stack(
                          children: [
                            SizedBox(
                                height: 0.25*screenHeight,
                                width: 0.5*screenWidth,
                                child: Column(
                                  children: [
                                    SizedBox(height: 0.033*screenHeight,),
                                    Row(
                                      children: [
                                        SizedBox(width: 0.05*screenWidth,),
                                        character(screenWidth, screenHeight,player),
                                      ],
                                    )
                                  ],
                                )
                            ),
                            Column(
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
                                      SizedBox(
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
                              ],
                            )
                          ],
                        ),
                      ),
                      arrowBar(screenWidth, screenHeight),
                      SizedBox(height: 0.01*screenHeight,),
                      selectBox(screenWidth, screenHeight,_selectBoxIndex),
                      SizedBox(height: 0.01*screenHeight,),
                      Row(
                        //mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left:0.3*screenWidth,right: 0.13*screenWidth),
                            child: GestureDetector(
                                onTap: () async{
                                  _name = nameController.text;
                                  player.name = _name;
                                  playerData.updatePlayer(player);
                                  playerData.setSTR(player.ogSTR);
                                  playerData.setINT(player.ogINT);
                                  playerData.setVIT(player.ogVIT);
                                  playerData.initShopItemList();
                                  User? user = await loginGoogleAccount();
                                  await addUser(user!.uid,playerData.player,playerData);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context)=>const MainPage()
                                      )
                                  );
                                },
                                child: SizedBox(
                                  width: 0.4*screenWidth,
                                  height: 0.05*screenHeight,
                                  child: Image.asset('assets/OKButton.png',fit: BoxFit.cover,),
                                )
                            ),
                          ),
                          GestureDetector(
                            onTap: ()async{
                              logOutGoogleAccount();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context)=>IndexPage()
                                  )
                              );
                            },
                            child: SizedBox(
                              width: 0.125*screenWidth,
                              height: 0.05*screenHeight,
                              child: Image.asset('assets/LogOutButton.png',fit: BoxFit.cover,),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
            )
        ),
      )
    );
  }
}
