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
  Player _player = Player(2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, '測試玩家', 99, 95, 101, 100, 150, 195);
  TextEditingController _nameController = TextEditingController();
  String _name = '';

  Widget character(double screenWidth, double screenHeight,Player _player){
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

    List<ImageProvider> _clothesList = [
      AssetImage('assets/Clothes/0.png'),
      AssetImage('assets/Clothes/1.png'),
      AssetImage('assets/Clothes/2.png'),
      AssetImage('assets/Clothes/3.png'),
      AssetImage('assets/Clothes/4.png'),
      AssetImage('assets/Clothes/5.png'),
      AssetImage('assets/Clothes/6.png'),
      AssetImage('assets/Clothes/7.png'),
    ];

    List<ImageProvider> _pantsList = [
      AssetImage('assets/Pants/0.png'),
      AssetImage('assets/Pants/1.png'),
      AssetImage('assets/Pants/2.png'),
      AssetImage('assets/Pants/3.png'),
      AssetImage('assets/Pants/4.png'),
      AssetImage('assets/Pants/5.png'),
      AssetImage('assets/Pants/6.png'),
      AssetImage('assets/Pants/7.png'),
      AssetImage('assets/Pants/8.png'),
      AssetImage('assets/Pants/9.png'),
      AssetImage('assets/Pants/10.png'),
      AssetImage('assets/Pants/11.png'),
    ];

    List<ImageProvider> _shoesList = [
      AssetImage('assets/Shoes/0.png'),
      AssetImage('assets/Shoes/1.png'),
      AssetImage('assets/Shoes/2.png'),
      AssetImage('assets/Shoes/3.png'),
      AssetImage('assets/Shoes/4.png'),
      AssetImage('assets/Shoes/5.png'),
    ];

    List<List<ImageProvider>> _eyesList =[
      [
        AssetImage('assets/Eyes/0-0.png'),
        AssetImage('assets/Eyes/0-1.png'),
        AssetImage('assets/Eyes/0-2.png'),
        AssetImage('assets/Eyes/0-3.png'),
        AssetImage('assets/Eyes/0-4.png'),
        AssetImage('assets/Eyes/0-5.png'),
        AssetImage('assets/Eyes/0-6.png'),
        AssetImage('assets/Eyes/0-7.png'),
        AssetImage('assets/Eyes/0-8.png'),
        AssetImage('assets/Eyes/0-9.png'),
      ],
      [
        AssetImage('assets/Eyes/1-0.png'),
        AssetImage('assets/Eyes/1-1.png'),
        AssetImage('assets/Eyes/1-2.png'),
        AssetImage('assets/Eyes/1-3.png'),
        AssetImage('assets/Eyes/1-4.png'),
        AssetImage('assets/Eyes/1-5.png'),
        AssetImage('assets/Eyes/1-6.png'),
        AssetImage('assets/Eyes/1-7.png'),
        AssetImage('assets/Eyes/1-8.png'),
        AssetImage('assets/Eyes/1-9.png'),
      ],
      [
        AssetImage('assets/Eyes/2-0.png'),
        AssetImage('assets/Eyes/2-1.png'),
        AssetImage('assets/Eyes/2-2.png'),
        AssetImage('assets/Eyes/2-3.png'),
        AssetImage('assets/Eyes/2-4.png'),
        AssetImage('assets/Eyes/2-5.png'),
        AssetImage('assets/Eyes/2-6.png'),
        AssetImage('assets/Eyes/2-7.png'),
        AssetImage('assets/Eyes/2-8.png'),
        AssetImage('assets/Eyes/2-9.png'),
      ],
      [
        AssetImage('assets/Eyes/3-0.png'),
        AssetImage('assets/Eyes/3-1.png'),
        AssetImage('assets/Eyes/3-2.png'),
        AssetImage('assets/Eyes/3-3.png'),
        AssetImage('assets/Eyes/3-4.png'),
        AssetImage('assets/Eyes/3-5.png'),
        AssetImage('assets/Eyes/3-6.png'),
        AssetImage('assets/Eyes/3-7.png'),
        AssetImage('assets/Eyes/3-8.png'),
        AssetImage('assets/Eyes/3-9.png'),
      ],
    ];

    List<ImageProvider> _mouthList = [
      AssetImage('assets/Mouth/0.png'),
      AssetImage('assets/Mouth/1.png'),
      AssetImage('assets/Mouth/2.png'),
      AssetImage('assets/Mouth/3.png'),
      AssetImage('assets/Mouth/4.png'),
    ];

    List<List<ImageProvider>> _backHairList =[
      [
        AssetImage('assets/BackHair/0-0.png'),
        AssetImage('assets/BackHair/0-1.png'),
        AssetImage('assets/BackHair/0-2.png'),
        AssetImage('assets/BackHair/0-3.png'),
        AssetImage('assets/BackHair/0-4.png'),
        AssetImage('assets/BackHair/0-5.png'),
        AssetImage('assets/BackHair/0-6.png'),
        AssetImage('assets/BackHair/0-7.png'),
        AssetImage('assets/BackHair/0-8.png'),
      ],
      [
        AssetImage('assets/BackHair/1-0.png'),
        AssetImage('assets/BackHair/1-1.png'),
        AssetImage('assets/BackHair/1-2.png'),
        AssetImage('assets/BackHair/1-3.png'),
        AssetImage('assets/BackHair/1-4.png'),
        AssetImage('assets/BackHair/1-5.png'),
        AssetImage('assets/BackHair/1-6.png'),
        AssetImage('assets/BackHair/1-7.png'),
        AssetImage('assets/BackHair/1-8.png'),
      ],
      [
        AssetImage('assets/BackHair/2.png'),
      ],
    ];

    List<List<ImageProvider>> _foreHairList =[
      [
        AssetImage('assets/ForeHair/0.png'),
      ],
      [
        AssetImage('assets/ForeHair/1-0.png'),
        AssetImage('assets/ForeHair/1-1.png'),
        AssetImage('assets/ForeHair/1-2.png'),
        AssetImage('assets/ForeHair/1-3.png'),
        AssetImage('assets/ForeHair/1-4.png'),
        AssetImage('assets/ForeHair/1-5.png'),
        AssetImage('assets/ForeHair/1-6.png'),
        AssetImage('assets/ForeHair/1-7.png'),
        AssetImage('assets/ForeHair/1-8.png'),
      ],
      [
        AssetImage('assets/ForeHair/2-0.png'),
        AssetImage('assets/ForeHair/2-1.png'),
        AssetImage('assets/ForeHair/2-2.png'),
        AssetImage('assets/ForeHair/2-3.png'),
        AssetImage('assets/ForeHair/2-4.png'),
        AssetImage('assets/ForeHair/2-5.png'),
        AssetImage('assets/ForeHair/2-6.png'),
        AssetImage('assets/ForeHair/2-7.png'),
        AssetImage('assets/ForeHair/2-8.png'),
      ],
      [
        AssetImage('assets/ForeHair/3-0.png'),
        AssetImage('assets/ForeHair/3-1.png'),
        AssetImage('assets/ForeHair/3-2.png'),
        AssetImage('assets/ForeHair/3-3.png'),
        AssetImage('assets/ForeHair/3-4.png'),
        AssetImage('assets/ForeHair/3-5.png'),
        AssetImage('assets/ForeHair/3-6.png'),
        AssetImage('assets/ForeHair/3-7.png'),
        AssetImage('assets/ForeHair/3-8.png'),
      ],
    ];

    return Container(
      height: 0.25*screenHeight,
      width: 0.5*screenWidth,
      child: Stack(
        children: [
          Column(
            children: [
              SizedBox(height: 0.08*screenHeight),
              Stack(
                children: [
                  Image(image:_backHairList[_player.backHairTypeIndex][_player.backHairColorIndex],fit: BoxFit.cover),
                  Image(image:_bodyList[_player.bodyIndex],fit: BoxFit.cover),
                  Image(image:_foreHairList[_player.foreHairTypeIndex][_player.foreHairColorIndex],fit: BoxFit.cover),
                  Image(image:_clothesList[_player.clothesIndex],fit: BoxFit.cover),
                  Image(image:_earsList[_player.earsTypeIndex][_player.earsColorIndex],fit: BoxFit.cover),
                  Image(image:_eyesList[_player.eyesTypeIndex][_player.eyesColorIndex],fit: BoxFit.cover),
                  Image(image:_mouthList[_player.mouthIndex],fit: BoxFit.cover),
                  Image(image:_pantsList[_player.pantsIndex],fit: BoxFit.cover),
                  Image(image:_shoesList[_player.shoesIndex],fit: BoxFit.cover),
                ],
              )
            ],
          ),
          Column(
            children: [
              SizedBox(height: 0.025*screenHeight,),
              Stack(
                children: [
                  const Image(image: AssetImage('assets/Name_TextBar.png'),fit: BoxFit.cover,),
                  Container(
                    height: 0.05*screenHeight,
                    width: 0.5*screenWidth,
                    child: TextField(
                      controller: _nameController,
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: '請輸入您的名稱',
                      ),
                    ),
                  )
                ],
              ),
            ],
          )
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
                _player.bodyIndex =i;
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
                _player.earsColorIndex =i;
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
                    _player.eyesColorIndex =i;
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
                    _player.eyesColorIndex =i+5;
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
                    _player.backHairColorIndex =i;
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
                    _player.backHairColorIndex =i+5;
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
                    _player.foreHairColorIndex =i;
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
                    _player.foreHairColorIndex =i+5;
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
                    if(_player.earsTypeIndex==1){
                      _player.earsTypeIndex=0;
                    }
                    else{
                      _player.earsTypeIndex=1;
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
                    if(_player.earsTypeIndex==0){
                      _player.earsTypeIndex=1;
                    }
                    else{
                      _player.earsTypeIndex=0;
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
                    if(_player.clothesIndex>0){
                      _player.clothesIndex--;
                    }
                    else{
                      _player.clothesIndex=7;
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
                    if(_player.clothesIndex<7){
                      _player.clothesIndex++;
                    }
                    else{
                      _player.clothesIndex=0;
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
                    if(_player.pantsIndex>0){
                      _player.pantsIndex--;
                    }
                    else{
                      _player.pantsIndex=11;
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
                    if(_player.pantsIndex<11){
                      _player.pantsIndex++;
                    }
                    else{
                      _player.pantsIndex=0;
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
                    if(_player.shoesIndex>0){
                      _player.shoesIndex--;
                    }
                    else{
                      _player.shoesIndex=5;
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
                    if(_player.shoesIndex<5){
                      _player.shoesIndex++;
                    }
                    else{
                      _player.shoesIndex=0;
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
                    if(_player.eyesTypeIndex>0){
                      _player.eyesTypeIndex--;
                    }
                    else{
                      _player.eyesTypeIndex=3;
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
                    if(_player.eyesTypeIndex<3){
                      _player.eyesTypeIndex++;
                    }
                    else{
                      _player.eyesTypeIndex=0;
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
                    if(_player.mouthIndex>0){
                      _player.mouthIndex--;
                    }
                    else{
                      _player.mouthIndex=4;
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
                    if(_player.mouthIndex<4){
                      _player.mouthIndex++;
                    }
                    else{
                      _player.mouthIndex=0;
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
                    if(_player.backHairTypeIndex>0){
                      _player.backHairTypeIndex--;
                    }
                    else{
                      _player.backHairTypeIndex=2;
                      _player.backHairColorIndex=0;
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
                    if(_player.backHairTypeIndex<2){
                      _player.backHairTypeIndex++;
                      if(_player.backHairTypeIndex==2){
                        _player.backHairColorIndex=0;
                      }
                    }
                    else{
                      _player.backHairTypeIndex=0;
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
          (_player.backHairTypeIndex==2?
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
          (_player.backHairTypeIndex == 2? SizedBox(height: 0.07*screenHeight) : SizedBox(height: 0.025*screenHeight)),
          Row(
            children: [
              SizedBox(width: 0.35*screenWidth,),
              GestureDetector(
                onTap: (){
                  setState(() {
                    if(_player.foreHairTypeIndex>0){
                      _player.foreHairTypeIndex--;
                      if(_player.foreHairTypeIndex==0){
                        _player.foreHairColorIndex=0;
                      }
                    }
                    else{
                      _player.foreHairTypeIndex=3;
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
                    if(_player.foreHairTypeIndex<3){
                      _player.foreHairTypeIndex++;
                    }
                    else{
                      _player.foreHairTypeIndex=0;
                      _player.foreHairColorIndex=0;
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
          (_player.foreHairTypeIndex==0?
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
                _name = _nameController.text;
                _player.name = _name;
                print(_player.name);
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
                      character(screenWidth, screenHeight,_player),
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