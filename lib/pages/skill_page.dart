import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:liver_remake/pages/main_page.dart';
import 'package:liver_remake/pages/train_page.dart';
import 'package:liver_remake/widget/characterStatusBlock.dart';

class SkillModel{
  int _skillLV = 1;
  bool _canLearn = false; //是否可以學習
  bool _hasLearned = true; //是否已學習
  bool _canUse = true; //是否可使用
  int _useConsumeMp = 1;
  int _levelUpConsumeMp = 1;
  SkillModel(this._skillLV,this._canLearn,this._hasLearned,this._canUse,this._useConsumeMp,this._levelUpConsumeMp);
}

class SkillPage extends StatefulWidget{
  @override
  _SkillPage createState() => _SkillPage();
}

class _SkillPage extends State<SkillPage>{

  int _skillUITypeIndex = 0 ;
  int _sp = 99;
  Player _player = Player(2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, '測試玩家', 99, 95, 101, 100, 150, 195);
  List<List<SkillModel>> _skillModelList = [
    [
      SkillModel(1,true, false, true,5,1),
      SkillModel(1,false, false, true,10,3),
      SkillModel(1,false, false, false,200,0),
    ],
    [
      SkillModel(1,true, false, true,5,1),
      SkillModel(1,false, false, true,10,3),
      SkillModel(1,false, false, false,200,0),
    ],
    [
      SkillModel(1,true, false, true,5,1),
      SkillModel(1,false, false, true,10,3),
      SkillModel(1,false, false, false,200,0),
    ]
  ];

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
                      if(_skillUITypeIndex>0){
                        _skillUITypeIndex--;
                      }
                      else{
                        _skillUITypeIndex=2;
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
                      if(_skillUITypeIndex<2){
                        _skillUITypeIndex++;
                      }
                      else{
                        _skillUITypeIndex=0;
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
  
  Widget SkillUIScence(double screenWidth, double screenHeight){

    List<ImageProvider> _skillUIList = [
      AssetImage('assets/Skill/Skill_UI_STR.png'),
      AssetImage('assets/Skill/Skill_UI_INT.png'),
      AssetImage('assets/Skill/Skill_UI_VIT.png'),
    ];

    return Container(
      width: 0.9*screenWidth,
      height: 0.62*screenHeight,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: _skillUIList[_skillUITypeIndex],
              fit: BoxFit.contain
          )
      ),
      child: Column(
        children: [
          SizedBox(height: 0.06*screenHeight,),
          Row(
            children: [
              SizedBox(height: 0.045*screenHeight,width: 0.75*screenWidth,),
              Container(
                height: 0.045*screenHeight,
                width: 0.12*screenWidth,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/Skill/Skill_SP_TextBox.png'),
                    fit: BoxFit.fill
                  )
                ),
                child: AutoSizeText(
                  _sp.toString(),
                  style: TextStyle(
                    fontSize: 34,
                    color: Color(0xFF924101),
                    fontWeight: FontWeight.bold
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          SizedBox(height: 0.0125*screenHeight,),
          SkillItem(screenWidth, screenHeight,_skillUITypeIndex,0),
          SizedBox(height: 0.0055*screenHeight,),
          SkillItem(screenWidth, screenHeight,_skillUITypeIndex,1),
          SizedBox(height: 0.0055*screenHeight,),
          SkillItem(screenWidth, screenHeight,_skillUITypeIndex,2),
        ],
      ),
    );
  }
  
  Widget useOrGetButton(double screenWidth, double screenHeight,int _skillType,int _skillIndex){
    if(_skillModelList[_skillType][_skillIndex]._hasLearned){
      return GestureDetector(
        onTap: (){
          print('get');
          if(_skillModelList[_skillType][_skillIndex]._canUse){
            setState(() {
              _skillModelList[_skillType][_skillIndex]._canUse = false;
            });
          }
        },
        child: Container(
          height: 0.035*screenHeight,
          width: 0.15*screenWidth,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: (_skillModelList[_skillType][_skillIndex]._canUse ? const AssetImage('assets/Skill/Skill_SkillUI_UseButton.png'):const AssetImage('assets/Skill/Skill_SkillUI_UseButton_inCD.png') ),
                  fit: BoxFit.cover
              )
          ),
        ),
      );
    }
    else{
      if(_skillModelList[_skillType][_skillIndex]._canLearn){
        return GestureDetector(
          onTap: (){
            print('Learned');
            setState(() {
              _skillModelList[_skillType][_skillIndex]._hasLearned=true;
            });
          },
          child: Container(
            height: 0.035*screenHeight,
            width: 0.15*screenWidth,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image:  AssetImage('assets/Skill/Skill_SkillUI_GetButton.png'),
                    fit: BoxFit.cover
                )
            ),
          ),
        );
      }
      else{
        return GestureDetector(
          onTap: (){
            print("You can't Learned");
            if(_skillModelList[_skillType][_skillIndex]._canUse){
              setState(() {
                _skillModelList[_skillType][_skillIndex]._canUse = false;
              });
            }
          },
          child: Container(
            height: 0.035*screenHeight,
            width: 0.15*screenWidth,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image:  AssetImage('assets/Skill/Skill_SkillUI_GetButton_Unavailable.png'),
                    fit: BoxFit.cover
                )
            ),
          ),
        );
      }
    }

  }

  Widget SkillItem(double screenWidth, double screenHeight,int _skillType,int _skillIndex){
    List<List<ImageProvider>> _skillIconList = [
      [
        const AssetImage('assets/Skill/Skill_Icon_STR_0_Primary.png'),
        const AssetImage('assets/Skill/Skill_Icon_STR_1_Intermediate.png'),
        const AssetImage('assets/Skill/Skill_Icon_STR_2_Advance.png'),
      ],
      [
        const AssetImage('assets/Skill/Skill_Icon_INT_0_Primary.png'),
        const AssetImage('assets/Skill/Skill_Icon_INT_1_Intermediate.png'),
        const AssetImage('assets/Skill/Skill_Icon_INT_2_Advance.png'),
      ],
      [
        const AssetImage('assets/Skill/Skill_Icon_VIT_0_Primary.png'),
        const AssetImage('assets/Skill/Skill_Icon_VIT_1_Intermediate.png'),
        const AssetImage('assets/Skill/Skill_Icon_VIT_2_Advance.png'),
      ]
    ];

    List<List<String>> _skillDescription =[
      [
        '消耗${_skillModelList[_skillType][_skillIndex]._useConsumeMp.toString()}點 MP\n下次攻擊傷害+ ${(_skillModelList[_skillType][_skillIndex]._skillLV+1).toString()}%\n升級所需點數： ${_skillModelList[_skillType][_skillIndex]._levelUpConsumeMp.toString()} SP\n',
        '消耗${_skillModelList[_skillType][_skillIndex]._useConsumeMp.toString()}點 MP\n下次攻擊以 ${(_skillModelList[_skillType][_skillIndex]._skillLV+1).toString()}% 機率獲得隨機武器\n升級所需點數： ${_skillModelList[_skillType][_skillIndex]._levelUpConsumeMp.toString()} SP\n',
        '消耗${_skillModelList[_skillType][_skillIndex]._useConsumeMp.toString()}點 MP\n\n格檔一次魔物的傷害\n',
      ],
      [
        '消耗${_skillModelList[_skillType][_skillIndex]._useConsumeMp.toString()}點 MP\n下次獲得經驗值+ ${(_skillModelList[_skillType][_skillIndex]._skillLV+1).toString()}%\n升級所需點數： ${_skillModelList[_skillType][_skillIndex]._levelUpConsumeMp.toString()} SP\n',
        '消耗${_skillModelList[_skillType][_skillIndex]._useConsumeMp.toString()}點 MP\n下次攻擊以 ${(_skillModelList[_skillType][_skillIndex]._skillLV+1).toString()}% 機率獲得隨機道具\n升級所需點數： ${_skillModelList[_skillType][_skillIndex]._levelUpConsumeMp.toString()} SP\n',
        '消耗${_skillModelList[_skillType][_skillIndex]._useConsumeMp.toString()}點 MP\n\n下次死亡不會受到懲罰\n',
      ],
      [
        '消耗${_skillModelList[_skillType][_skillIndex]._useConsumeMp.toString()}點 MP\n下次獲得金幣+ ${(_skillModelList[_skillType][_skillIndex]._skillLV+1).toString()}%\n升級所需點數： ${_skillModelList[_skillType][_skillIndex]._levelUpConsumeMp.toString()} SP\n',
        '消耗${_skillModelList[_skillType][_skillIndex]._useConsumeMp.toString()}點 MP\n下次攻擊以 ${(_skillModelList[_skillType][_skillIndex]._skillLV+1).toString()}% 機率獲得隨機飾品\n升級所需點數： ${_skillModelList[_skillType][_skillIndex]._levelUpConsumeMp.toString()} SP\n',
        '消耗${_skillModelList[_skillType][_skillIndex]._useConsumeMp.toString()}點 MP\n\n獲得一次額外攻擊機會\n',
      ]
    ];

    return Container(
      width: 0.83*screenWidth,
      height: 0.135*screenHeight,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/Skill/Skill_SkillUI.png'),
          fit: BoxFit.contain
        )
      ),
      child: Row(
        children: [
          SizedBox(width:0.0675*screenWidth),
          Container(
            width: 0.2*screenWidth,
            height: 0.09*screenHeight,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: _skillIconList[_skillType][_skillIndex],
                fit: BoxFit.fill
              )
            ),
          ),
          SizedBox(width: 0.025*screenWidth,),
          Column(
            children: [
              SizedBox(height: 0.015*screenHeight,),
              Container(
                width: 0.5*screenWidth,
                height: 0.06*screenHeight,
                child: AutoSizeText(
                  _skillDescription[_skillType][_skillIndex],
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
              SizedBox(height: 0.0125*screenHeight,),
              Container(
                height: 0.035*screenHeight,
                width: 0.5*screenWidth,
                child: (_skillModelList[_skillType][_skillIndex]._hasLearned? Row(
                  children: [
                    Container(
                      height: 0.035*screenHeight,
                      width: 0.08*screenWidth,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/Skill/Skill_SkillUI_LV_Text.png'),
                              fit: BoxFit.contain
                          )
                      ),
                    ),
                    SizedBox(width: 0.02*screenWidth,),
                    Container(
                      height: 0.035*screenHeight,
                      width: 0.12*screenWidth,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/Skill/Skill_SP_TextBox.png'),
                              fit: BoxFit.fill
                          )
                      ),
                      child: AutoSizeText(
                        _skillModelList[_skillType][_skillIndex]._skillLV.toString(),
                        style: const TextStyle(
                            fontSize: 34,
                            color: Color(0xFF924101),
                            fontWeight: FontWeight.bold
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(width: 0.02*screenWidth,),
                    GestureDetector(
                      onTap: (){
                        print('level Up');
                        if(_skillModelList[_skillType][_skillIndex]._skillLV<99 && _sp >= _skillModelList[_skillType][_skillIndex]._levelUpConsumeMp){
                          setState(() {
                            _sp -= _skillModelList[_skillType][_skillIndex]._levelUpConsumeMp;
                            _skillModelList[_skillType][_skillIndex]._skillLV++;
                          });
                        }
                      },
                      child: Container(
                        height: 0.035*screenHeight,
                        width: 0.08*screenWidth,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: (_skillModelList[_skillType][_skillIndex]._skillLV<99 ? const AssetImage('assets/Skill/Skill_SkillUI_LVUpButton.png'): const AssetImage('assets/Skill/Skill_SkillUI_LVUpButton_Unavailable.png') ),
                                fit: BoxFit.contain
                            )
                        ),
                      ),
                    ),
                    SizedBox(width: 0.02*screenWidth,),
                    useOrGetButton(screenWidth, screenHeight,_skillType,_skillIndex)
                  ],
                ): Row(
                  children: [
                    SizedBox(width: 0.34*screenWidth,),
                    useOrGetButton(screenWidth, screenHeight,_skillType,_skillIndex)
                  ],
                ))
              )
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
            SkillUIScence(screenWidth, screenHeight),
            arrowAndMenuBar(screenWidth, screenHeight),
          ],
        ),
      ),
    );
  }
}