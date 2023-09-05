import 'package:flutter/material.dart';

class CreateCharacterPage extends StatefulWidget{
  @override
  _CreateCharacterPage createState() => _CreateCharacterPage();
}

class _CreateCharacterPage extends State<CreateCharacterPage>{

  int _selectBoxIndex = 0;
  final List<String> _selectBoxTitleList = ['身體 & 耳朵','服裝','眼睛 & 嘴吧','髮型'];
  int _bodyIndex = 2;
  int _earsTypeIndex = 1;
  int _earsColorIndex = 0;
  int _clothesIndex = 0;
  int _pantsIndex = 0;
  int _shoesIndex = 0;
  int _eyesTypeIndex = 0;
  int _eyesColorIndex = 0;
  int _mouthIndex = 0;
  int _backHairTypeIndex = 0;
  int _backHairColorIndex = 1;
  int _foreHairTypeIndex = 2;
  int _foreHairColorIndex = 1;
  TextEditingController _nameController = TextEditingController();
  String _name = '';

  Widget character(double screenWidth, double screenHeight,int _bodyIndex,int _earsTypeIndex,
      int _earsColorIndex,int _eyesTypeIndex, int _eyesColorIndex,int _mouthIndex,
      int _backHairTypeIndex, int _backHairColorIndex,int _foreHairTypeIndex, int _foreHairColorIndex,){
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
                  Image(image:_backHairList[_backHairTypeIndex][_backHairColorIndex],fit: BoxFit.cover),
                  Image(image:_bodyList[_bodyIndex],fit: BoxFit.cover),
                  Image(image:_foreHairList[_foreHairTypeIndex][_foreHairColorIndex],fit: BoxFit.cover),
                  Image(image:_clothesList[_clothesIndex],fit: BoxFit.cover),
                  Image(image:_earsList[_earsTypeIndex][_earsColorIndex],fit: BoxFit.cover),
                  Image(image:_eyesList[_eyesTypeIndex][_eyesColorIndex],fit: BoxFit.cover),
                  Image(image:_mouthList[_mouthIndex],fit: BoxFit.cover),
                  Image(image:_pantsList[_pantsIndex],fit: BoxFit.cover),
                  Image(image:_shoesList[_shoesIndex],fit: BoxFit.cover),
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
                    //color: Colors.amber,
                    child: TextField(
                      controller: _nameController,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
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
                    _eyesColorIndex =i;
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
                    _eyesColorIndex =i+5;
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
                    _backHairColorIndex =i;
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
                    _backHairColorIndex =i+5;
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
                    _foreHairColorIndex =i;
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
                    _foreHairColorIndex =i+5;
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
      child: Column(
        children: [
          SizedBox(height: 0.14*screenHeight,),
          Row(
            children: [
              SizedBox(width: 0.35*screenWidth,),
              GestureDetector(
                onTap: (){
                  setState(() {
                    if(_clothesIndex>0){
                      _clothesIndex--;
                    }
                    else{
                      _clothesIndex=7;
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
                    if(_clothesIndex<7){
                      _clothesIndex++;
                    }
                    else{
                      _clothesIndex=0;
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
                    if(_pantsIndex>0){
                      _pantsIndex--;
                    }
                    else{
                      _pantsIndex=11;
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
                    if(_pantsIndex<11){
                      _pantsIndex++;
                    }
                    else{
                      _pantsIndex=0;
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
                    if(_shoesIndex>0){
                      _shoesIndex--;
                    }
                    else{
                      _shoesIndex=5;
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
                    if(_shoesIndex<5){
                      _shoesIndex++;
                    }
                    else{
                      _shoesIndex=0;
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
                    if(_eyesTypeIndex>0){
                      _eyesTypeIndex--;
                    }
                    else{
                      _eyesTypeIndex=3;
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
                    if(_eyesTypeIndex<3){
                      _eyesTypeIndex++;
                    }
                    else{
                      _eyesTypeIndex=0;
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
                    if(_mouthIndex>0){
                      _mouthIndex--;
                    }
                    else{
                      _mouthIndex=4;
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
                    if(_mouthIndex<4){
                      _mouthIndex++;
                    }
                    else{
                      _mouthIndex=0;
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
                    if(_backHairTypeIndex>0){
                      _backHairTypeIndex--;
                    }
                    else{
                      _backHairTypeIndex=2;
                      _backHairColorIndex=0;
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
                    if(_backHairTypeIndex<2){
                      _backHairTypeIndex++;
                      if(_backHairTypeIndex==2){
                        _backHairColorIndex=0;
                      }
                    }
                    else{
                      _backHairTypeIndex=0;
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
          (_backHairTypeIndex==2?
              Container(
                child: Column(
                  children: [
                    SizedBox(height: 0.03*screenHeight,),
                    SizedBox(
                      child: Text('無後髮',style: TextStyle(fontSize: 30,color: Colors.white,)),
                    ),
                  ],
                ),
              ):
              _buildBackHairSkinBlock(screenWidth, screenHeight)),
          (_backHairTypeIndex == 2? SizedBox(height: 0.07*screenHeight) : SizedBox(height: 0.025*screenHeight)),
          Row(
            children: [
              SizedBox(width: 0.35*screenWidth,),
              GestureDetector(
                onTap: (){
                  setState(() {
                    if(_foreHairTypeIndex>0){
                      _foreHairTypeIndex--;
                      if(_foreHairTypeIndex==0){
                        _foreHairColorIndex=0;
                      }
                    }
                    else{
                      _foreHairTypeIndex=3;
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
                    if(_foreHairTypeIndex<3){
                      _foreHairTypeIndex++;
                    }
                    else{
                      _foreHairTypeIndex=0;
                      _foreHairColorIndex=0;
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
          (_foreHairTypeIndex==0?
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
                print(_name);
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
                      character(screenWidth, screenHeight,_bodyIndex,_earsTypeIndex,_earsColorIndex,_eyesTypeIndex,_eyesColorIndex,_mouthIndex,_backHairTypeIndex,_backHairColorIndex,_foreHairTypeIndex,_foreHairColorIndex),
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