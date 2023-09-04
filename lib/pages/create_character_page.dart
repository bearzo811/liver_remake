import 'package:flutter/material.dart';

class CreateCharacterPage extends StatefulWidget{
  @override
  _CreateCharacterPage createState() => _CreateCharacterPage();
}

class _CreateCharacterPage extends State<CreateCharacterPage>{
  Widget character(double screenWidth, double screenHeight,int _bodyIndex,int _earsTypeIndex, int _earsColorIndex){
    List<ImageProvider> _bodyList = [
      AssetImage('assets/Head_Body/0.png'),
      AssetImage('assets/Head_Body/1.png'),
      AssetImage('assets/Head_Body/2.png'),
      AssetImage('assets/Head_Body/3.png'),
      AssetImage('assets/Head_Body/4.png')
    ];

    List<List<ImageProvider>> _earsList =[
      [
        AssetImage('assets/Ears/0-0.png'),
        AssetImage('assets/Ears/0-1.png'),
        AssetImage('assets/Ears/0-2.png'),
        AssetImage('assets/Ears/0-3.png'),
        AssetImage('assets/Ears/0-4.png'),
      ],
      [
        AssetImage('assets/Ears/1-0.png'),
        AssetImage('assets/Ears/1-1.png'),
        AssetImage('assets/Ears/1-2.png'),
        AssetImage('assets/Ears/1-3.png'),
        AssetImage('assets/Ears/1-4.png'),
      ],
    ];

    return Container(
      height: 0.25*screenHeight,
      width: 0.5*screenWidth,
      child: Stack(
        children: [
          Image.asset('assets/BackHair/0-7.png',fit: BoxFit.cover),
          Image(image:_bodyList[_bodyIndex],fit: BoxFit.cover),
          Image.asset('assets/ForeHair/3-7.png',fit: BoxFit.cover),
          Image.asset('assets/Clothes/7.png',fit: BoxFit.cover),
          Image(image:_earsList[_earsTypeIndex][_earsColorIndex],fit: BoxFit.cover),
          Image.asset('assets/Eyes/0-9.png',fit: BoxFit.cover),
          Image.asset('assets/Mouth/0-3.png',fit: BoxFit.cover),
          Image.asset('assets/Pants/4.png',fit: BoxFit.cover),
          Image.asset('assets/Shoes/3.png',fit: BoxFit.cover),
        ],
      ),
    );
  }

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
                _bodyIndex =i;
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
                _earsColorIndex =i;
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
                    if(_earsTypeIndex==1){
                      _earsTypeIndex=0;
                    }
                    else{
                      _earsTypeIndex=1;
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
                    if(_earsTypeIndex==0){
                      _earsTypeIndex=1;
                    }
                    else{
                      _earsTypeIndex=0;
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
              onTap: (){print('Tap ${screenWidth} ${screenHeight}');},
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

  int _selectBoxIndex = 0;
  final List<String> _selectBoxTitleList = ['身體 & 耳朵','服裝','眼睛 & 嘴吧','髮型'];
  int _bodyIndex = 2;
  int _earsTypeIndex = 0;
  int _earsColorIndex = 0;

  @override
  Widget build(BuildContext context){
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(146, 65, 1, 100),
      body: SafeArea(
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
                character(screenWidth, screenHeight,_bodyIndex,_earsTypeIndex,_earsColorIndex),
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
    );
  }
}