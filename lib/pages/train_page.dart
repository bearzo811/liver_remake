import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:liver_remake/pages/main_page.dart';
import 'package:liver_remake/pages/skill_page.dart';
import 'package:liver_remake/widget/characterStatusBlock.dart';

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

  Player _player = Player(
      bodyIndex: 2, earsTypeIndex: 0, earsColorIndex: 0, clothesIndex: 0, pantsIndex: 0, shoesIndex: 0,
      eyesTypeIndex: 0, eyesColorIndex: 0, mouthIndex: 0, backHairTypeIndex: 1, backHairColorIndex: 0,
      foreHairTypeIndex: 1, foreHairColorIndex: 0, backItemIndex: 0, eyeDecorationIndex: 0, heavyWeaponIndex: 0, lightWeaponIndex: 0,
      name: 'name', level: 2, mp: 10, exp: 8, maxMp: 10, maxExp: 10, coin: 93);
  TrainItem _trainItem = TrainItem('',0,0);
  List<TrainItem> _trainItemList = [];

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
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context)=>SkillPage()
                  )
              );
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
                  characterStatusBlock(screenWidth, screenHeight,_player),
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