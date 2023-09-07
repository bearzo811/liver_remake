import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:liver_remake/pages/main_page.dart';

class TrainItem{
  int trainTypeIndex = 0;
  int trainLevel = 0;
  String trainName = '';

  TrainItem(this.trainName,this.trainTypeIndex,this.trainLevel);
}

class TrainPage extends StatefulWidget{
  @override
  _TrainPage createState() => _TrainPage();
}

class _TrainPage extends State<TrainPage>{

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
  TrainItem _trainItem = TrainItem('',0,0);
  List<TrainItem> _trainItemList = [];

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
      height: 0.28*screenHeight,
      width: 0.35*screenWidth,
      child: Column(
        children: [
          SizedBox(height: 0.03*screenHeight),
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
    );
  }

  Widget NumberBlock(double screenWidth, double screenHeight,int number){

    List<ImageProvider> _numberList =[
      AssetImage('assets/CharacterStatus/New_CharacterStatus_LV_Number_0.png'),
      AssetImage('assets/CharacterStatus/New_CharacterStatus_LV_Number_1.png'),
      AssetImage('assets/CharacterStatus/New_CharacterStatus_LV_Number_2.png'),
      AssetImage('assets/CharacterStatus/New_CharacterStatus_LV_Number_3.png'),
      AssetImage('assets/CharacterStatus/New_CharacterStatus_LV_Number_4.png'),
      AssetImage('assets/CharacterStatus/New_CharacterStatus_LV_Number_5.png'),
      AssetImage('assets/CharacterStatus/New_CharacterStatus_LV_Number_6.png'),
      AssetImage('assets/CharacterStatus/New_CharacterStatus_LV_Number_7.png'),
      AssetImage('assets/CharacterStatus/New_CharacterStatus_LV_Number_8.png'),
      AssetImage('assets/CharacterStatus/New_CharacterStatus_LV_Number_9.png'),
    ];
    return Container(
      height: 0.03*screenHeight,
      width: 0.35*screenWidth,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image(image: _numberList[(number/10000).toInt()%10]),
          Image(image: _numberList[(number/1000).toInt()%10]),
          Image(image: _numberList[(number/100).toInt()%10]),
          Image(image: _numberList[(number/10).toInt()%10]),
          Image(image: _numberList[number%10]),
        ],
      ),
    );
  }

  Widget MpBarBlock(double screenWidth, double screenHeight,double mpRatio){
    return Container(
        height: 0.03*screenHeight,
        width: 0.35*screenWidth,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/CharacterStatus/Groove/MP_Groove.png'),
            fit: BoxFit.contain,
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(40.0),
          child: LinearProgressIndicator(
            value: mpRatio,
            valueColor: AlwaysStoppedAnimation<Color>(Color.fromRGBO(0, 140, 215, 1),),
            backgroundColor: Color.fromRGBO(0, 0, 0, 0),
          ),

        )
    );
  }

  Widget EXPBarBlock(double screenWidth, double screenHeight,double expRatio){
    return Container(
        height: 0.03*screenHeight,
        width: 0.35*screenWidth,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/CharacterStatus/Groove/EXP1_Groove.png'),
            fit: BoxFit.contain,
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(40.0),
          child: LinearProgressIndicator(
            value: expRatio,
            valueColor: AlwaysStoppedAnimation<Color>(Color.fromRGBO(0, 193, 0, 1),),
            backgroundColor: Color.fromRGBO(0, 0, 0, 0),
          ),

        )
    );
  }

  Widget CharacterStatusBlock(double screenWidth, double screenHeight){
    return Container(
      width: screenWidth,
      height: 0.2*screenHeight,
      decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/CharacterStatus/CharacterStatus_All.png'),
            fit: BoxFit.cover,
          )
      ),
      child: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Stack(
                children: [
                  character(screenWidth, screenHeight, _bodyIndex, _earsTypeIndex, _earsColorIndex, _eyesTypeIndex, _eyesColorIndex, _mouthIndex, _backHairTypeIndex, _backHairColorIndex, _foreHairTypeIndex, _foreHairColorIndex),
                  Column(
                    children: [
                      SizedBox(height: 0.165*screenHeight,),
                      SizedBox(
                          width: 0.35*screenWidth,
                          child: AutoSizeText(
                            '測試玩家',
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.black54,
                                fontWeight: FontWeight.bold
                            ),
                            maxLines: 1,
                            textAlign: TextAlign.center,
                          )
                      )
                    ],
                  )
                ],
              ), //角色外觀 & 名稱
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 0.03*screenHeight,
                    width: 0.12*screenWidth,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/CharacterStatus/New_CharacterStatus_LV_Text.png'),
                          fit: BoxFit.contain,
                        )
                    ),
                  ),
                  Container(
                    height: 0.03*screenHeight,
                    width: 0.12*screenWidth,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/CharacterStatus/New_CharacterStatus_MP_Text.png'),
                          fit: BoxFit.contain,
                        )
                    ),
                  ),
                  Container(
                    height: 0.03*screenHeight,
                    width: 0.12*screenWidth,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/CharacterStatus/New_CharacterStatus_EXP_Text.png'),
                          fit: BoxFit.contain,
                        )
                    ),
                  ),
                  Container(
                    height: 0.03*screenHeight,
                    width: 0.12*screenWidth,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/CharacterStatus/CharacterStatus_Coin.png'),
                          fit: BoxFit.contain,
                        )
                    ),
                  ),
                ],
              ), // LV MP EXP Coin標題
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 0.03*screenHeight,
                    width: 0.35*screenWidth,
                    child: NumberBlock(screenWidth, screenHeight, 1),
                  ),
                  MpBarBlock(screenWidth, screenHeight,0.7),
                  EXPBarBlock(screenWidth, screenHeight,0.65),
                  Container(
                    height: 0.03*screenHeight,
                    width: 0.35*screenWidth,
                    child: NumberBlock(screenWidth, screenHeight, 100),
                  ),
                ],
              ), //LV Coin number & mp exp值
              Column(
                children: [
                  SizedBox(height: 0.15*screenHeight,),
                  GestureDetector(
                      onTap: (){},
                      child: Container(
                        width: 0.11*screenWidth,
                        height: 0.05*screenHeight,
                        child: Image.asset('assets/CharacterStatus/CharacterStatus_Info_Button.png',fit: BoxFit.fill,),
                      )
                  ),
                ],
              )
            ],
          )

        ],
      ),
    );
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
                  builder: (context) => MainPage()
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
              Navigator.of(context).pop();
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

  Widget createMenuBar(double screenWidth, double screenHeight){
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(left:0.41*screenWidth,right: 0.22*screenWidth),
          child: GestureDetector(
              onTap: () async {
                _trainItem = await showDialog(
                    context: context,
                    barrierDismissible: true,
                    builder: (BuildContext context){
                      return AlertDialog(
                        backgroundColor: Color.fromRGBO(0, 0, 0, 0),
                        content: SingleChildScrollView(
                          child: CreateTrainBlock(),
                        ),
                      );
                    }
                );
                _trainItemList.add(_trainItem);
              },
              child: Container(
                width: 0.18*screenWidth,
                height: 0.08*screenHeight,
                child: Image.asset('assets/Train_Add_Button.png',fit: BoxFit.cover,),
              )
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

  Widget TrainItemBar(double screenWidth, double screenHeight,int trainItemType,int trainLevel,String trainName,int index){
    
    List<ImageProvider> _trainItemTypeList = [
      const AssetImage('assets/Train/Train_Item_S.png'),
      const AssetImage('assets/Train/Train_Item_I.png'),
      const AssetImage('assets/Train/Train_Item_V.png'),
    ];
    
    return GestureDetector(
      onTap: (){
        print('${_trainItemList[index].trainName} / ${_trainItemList[index].trainLevel}');
        if(_trainItemList[index].trainLevel<99){
          setState(() {
            _trainItemList[index].trainLevel++;
          });
        }
      },
      child: Container(
        height: 0.1*screenHeight,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: _trainItemTypeList[trainItemType],
                fit: BoxFit.contain
            )
        ),
        child: Row(
          children: [
            SizedBox(
              width: 0.04*screenWidth,
            ),
            Container(
              width: 0.4*screenWidth,
              child: AutoSizeText(
                trainName,
                style: TextStyle(
                    fontSize: 25,
                    color: Color(0xFFFFB170),
                    fontWeight: FontWeight.bold
                ),
                maxLines: 1,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              width: 0.175*screenWidth,
            ),
            Container(
              width: 0.1*screenWidth,
              child: AutoSizeText(
                _trainItemList[index].trainLevel.toString(),
                style: const TextStyle(
                    fontSize: 25,
                    color: Color(0xFF924101),
                    fontWeight: FontWeight.bold
                ),
                maxLines: 1,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              width: 0.02*screenWidth,
            ),
            GestureDetector(
                onTap: (){
                  print('delete');
                  setState(() {
                    _trainItemList.removeAt(index);
                  });
                },
                child: Container(
                  width: 0.11*screenWidth,
                  height: 0.05*screenHeight,
                  child: Image.asset('assets/Train/Train_Delete_Button.png',fit: BoxFit.fill,),
                )
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context){
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xFFE2C799),
      body: SingleChildScrollView(
        child: SafeArea(
          child:Stack(
            children: [
              Container(
                  width: screenWidth,
                  height: screenHeight,
                  decoration:const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/Train/Train_UI.png'),
                        fit: BoxFit.contain
                    ),
                  )
              ),
              Column(
                children: [
                  CharacterStatusBlock(screenWidth, screenHeight),
                  SizedBox(height: 0.14*screenHeight,),
                  Center(
                    child: Container(
                      width: 0.95*screenWidth,
                      height: 0.43*screenHeight,
                      child: ListView.builder(
                        itemCount: _trainItemList.length,
                        itemBuilder: (BuildContext context,int index){
                          return ListTile(
                            title: TrainItemBar(screenWidth, screenHeight,_trainItemList[index].trainTypeIndex,1,_trainItemList[index].trainName,index),
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 0.075*screenHeight,),
                  createMenuBar(screenWidth, screenHeight),
                ],
              )
            ],
          ),
        )
      ),
    );
  }
}

class CreateTrainBlock extends StatefulWidget {
  @override
  _CreateTrainBlockState createState() => _CreateTrainBlockState();
}

class _CreateTrainBlockState extends State<CreateTrainBlock>{
  double _STRopacity = 0.0;
  double _INTopacity = 0.0;
  double _VITopacity = 0.0;
  TrainItem _trainItem = TrainItem('每天訓練', 1,0);
  TextEditingController _trainNameTextController = TextEditingController();

  @override
  Widget build(BuildContext context){
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      width: 0.9*screenWidth,
      height: 0.25*screenHeight,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/Train/Train_Add_Windows.png'),
              fit: BoxFit.fill
          )
      ),
      child: Column(
        children: [
          SizedBox(height: 0.065*screenHeight,),
          Container(
            height: 0.05*screenHeight,
            width: 0.6*screenWidth,
            child: TextField(
              controller: _trainNameTextController,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: '請輸入訓練名稱',
              ),
            ),
          ),
          SizedBox(height: 0.01*screenHeight,),
          Row(
            children: [
              SizedBox(width: 0.035*screenWidth,),
              Column(
                children: [
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        (_STRopacity == 0 ? _STRopacity = 1.0 : _STRopacity = 0.0);
                        _INTopacity = 0.0;
                        _VITopacity = 0.0;
                      });
                    },
                    child: Container(
                      width: 0.4*screenWidth,
                      height: 0.03*screenHeight,
                      color: Color.fromRGBO(255, 255, 255, _STRopacity),
                      child: Image(
                        image: AssetImage('assets/Train/Train_Add_Option_Exercise.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 0.01*screenHeight,),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        (_INTopacity == 0 ? _INTopacity = 1.0 : _INTopacity = 0.0);
                        _STRopacity = 0.0;
                        _VITopacity = 0.0;
                      });
                    },
                    child: Container(
                      width: 0.4*screenWidth,
                      height: 0.03*screenHeight,
                      color: Color.fromRGBO(255, 255, 255, _INTopacity),
                      child: Image(
                        image: AssetImage('assets/Train/Train_Add_Option_Learning.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 0.01*screenHeight,),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        (_VITopacity == 0 ? _VITopacity = 1.0 : _VITopacity = 0.0);
                        _STRopacity = 0.0;
                        _INTopacity = 0.0;
                      });
                    },
                    child: Container(
                      width: 0.4*screenWidth,
                      height: 0.03*screenHeight,
                      color: Color.fromRGBO(255, 255, 255, _VITopacity),
                      child: Image(
                        image: AssetImage('assets/Train/Train_Add_Option_Life.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(width: 0.0005*screenWidth,),
              Column(
                children: [
                  SizedBox(height: 0.075*screenHeight,),
                  GestureDetector(
                      onTap: (){
                        _trainItem.trainName = _trainNameTextController.text;
                        _trainNameTextController.clear();
                        if(_STRopacity==1.0){
                          _trainItem.trainTypeIndex=0;
                        }
                        else if(_INTopacity==1.0){
                          _trainItem.trainTypeIndex=1;
                        }
                        else if(_VITopacity==1.0){
                          _trainItem.trainTypeIndex=2;
                        }
                        Navigator.of(context).pop(_trainItem);
                      },
                      child: Container(
                        width: 0.25*screenWidth,
                        height: 0.035*screenHeight,
                        child: Image.asset('assets/OKButton.png',fit: BoxFit.fill,),
                      )
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}