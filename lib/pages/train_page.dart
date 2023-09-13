import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:liver_remake/PlayerData/playerData.dart';
import 'package:liver_remake/pages/main_page.dart';
import 'package:liver_remake/pages/shop_page.dart';
import 'package:liver_remake/pages/skill_page.dart';
import 'package:liver_remake/Model/Models.dart';
import 'log_page.dart';
import 'package:provider/provider.dart';

class TrainPage extends StatefulWidget{
  final Key? keyTrainPage;
  const TrainPage({this.keyTrainPage}):super(key:keyTrainPage);

  @override
  TrainPageState createState() => TrainPageState();
}

class TrainPageState extends State<TrainPage>{

  TrainItem _trainItem = TrainItem('',0,0);

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
              Navigator.of(context).pop();
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
                      builder: (context)=>const SkillPage()
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
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context)=>const ShopPage()
                  )
              );
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

  Widget createMenuBar(double screenWidth, double screenHeight){
    List<TrainItem> trainItemList = Provider.of<PlayerData>(context).trainItemList;
    final playerData = Provider.of<PlayerData>(context);
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
                      return const AlertDialog(
                        backgroundColor: Color.fromRGBO(0, 0, 0, 0),
                        content: SingleChildScrollView(
                          child: CreateTrainBlock(),
                        ),
                      );
                    }
                );
                playerData.addTrainList(_trainItem);
              },
              child: SizedBox(
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

  Widget trainItemBar(double screenWidth, double screenHeight,int trainItemType,int trainLevel,String trainName,int index){
    final trainItemList = Provider.of<PlayerData>(context).trainItemList;
    final playerData = Provider.of<PlayerData>(context);
    List<ImageProvider> trainItemTypeList = [
      const AssetImage('assets/Train/Train_Item_S.png'),
      const AssetImage('assets/Train/Train_Item_I.png'),
      const AssetImage('assets/Train/Train_Item_V.png'),
    ];
    
    return GestureDetector(
      onTap: (){
        if(trainItemList[index].trainLevel<99){
          setState(() {
            playerData.completeTrain(trainItemList[index]);
            trainItemList[index].trainLevel++;
          });
        }
      },
      child: Container(
        height: 0.1*screenHeight,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: trainItemTypeList[trainItemType],
                fit: BoxFit.contain
            )
        ),
        child: Row(
          children: [
            SizedBox(
              width: 0.04*screenWidth,
            ),
            SizedBox(
              width: 0.4*screenWidth,
              child: AutoSizeText(
                trainName,
                style: const TextStyle(
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
            SizedBox(
              width: 0.1*screenWidth,
              child: AutoSizeText(
                trainItemList[index].trainLevel.toString(),
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
                  setState(() {
                    //trainItemList.removeAt(index);
                    playerData.removeTrain(trainItemList[index]);
                  });
                },
                child: SizedBox(
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
    final player = Provider.of<PlayerData>(context).player;
    final trainItemList = Provider.of<PlayerData>(context).trainItemList;
    Provider.of<PlayerData>(context).checkMonsterAttacked();
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
                  characterStatusBlockWithInfoButton(screenWidth, screenHeight,player,context),
                  SizedBox(height: 0.14*screenHeight,),
                  Center(
                    child: SizedBox(
                      width: 0.95*screenWidth,
                      height: 0.43*screenHeight,
                      child: ListView.builder(
                        itemCount: trainItemList.length,
                        itemBuilder: (BuildContext context,int index){
                          return ListTile(
                            title: trainItemBar(screenWidth, screenHeight,trainItemList[index].trainTypeIndex,1,trainItemList[index].trainName,index),
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
  
  final Key? keyCreateTrainClock;
  const CreateTrainBlock({this.keyCreateTrainClock}):super(key:keyCreateTrainClock);
  @override
  CreateTrainBlockState createState() => CreateTrainBlockState();
}

class CreateTrainBlockState extends State<CreateTrainBlock>{
  double sTROpacity = 0.0;
  double iNTOpacity = 0.0;
  double vITOpacity = 0.0;
  TrainItem trainItem = TrainItem('每天訓練', 1,0);
  TextEditingController trainNameTextController = TextEditingController();

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
          SizedBox(
            height: 0.05*screenHeight,
            width: 0.6*screenWidth,
            child: TextField(
              controller: trainNameTextController,
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
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
                        (sTROpacity == 0 ? sTROpacity = 1.0 : sTROpacity = 0.0);
                        iNTOpacity = 0.0;
                        vITOpacity = 0.0;
                      });
                    },
                    child: Container(
                      width: 0.4*screenWidth,
                      height: 0.03*screenHeight,
                      color: Color.fromRGBO(255, 255, 255, sTROpacity),
                      child: const Image(
                        image: AssetImage('assets/Train/Train_Add_Option_Exercise.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 0.01*screenHeight,),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        (iNTOpacity == 0 ? iNTOpacity = 1.0 : iNTOpacity = 0.0);
                        sTROpacity = 0.0;
                        vITOpacity = 0.0;
                      });
                    },
                    child: Container(
                      width: 0.4*screenWidth,
                      height: 0.03*screenHeight,
                      color: Color.fromRGBO(255, 255, 255, iNTOpacity),
                      child: const Image(
                        image: AssetImage('assets/Train/Train_Add_Option_Learning.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 0.01*screenHeight,),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        (vITOpacity == 0 ? vITOpacity = 1.0 : vITOpacity = 0.0);
                        sTROpacity = 0.0;
                        iNTOpacity = 0.0;
                      });
                    },
                    child: Container(
                      width: 0.4*screenWidth,
                      height: 0.03*screenHeight,
                      color: Color.fromRGBO(255, 255, 255, vITOpacity),
                      child: const Image(
                        image: AssetImage('assets/Train/Train_Add_Option_Life.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
              //SizedBox(width: 0.0001*screenWidth,),
              Column(
                children: [
                  SizedBox(height: 0.075*screenHeight,),
                  GestureDetector(
                      onTap: (){
                        trainItem.trainName = trainNameTextController.text;
                        trainNameTextController.clear();
                        if(sTROpacity==1.0){
                          trainItem.trainTypeIndex=0;
                        }
                        else if(iNTOpacity==1.0){
                          trainItem.trainTypeIndex=1;
                        }
                        else if(vITOpacity==1.0){
                          trainItem.trainTypeIndex=2;
                        }
                        Navigator.of(context).pop(trainItem);
                      },
                      child: Container(
                        width: 0.22*screenWidth,
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