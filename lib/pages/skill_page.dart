import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:liver_remake/PlayerData/playerData.dart';
import 'package:liver_remake/pages/main_page.dart';
import 'package:liver_remake/pages/shop_page.dart';
import 'package:liver_remake/pages/train_page.dart';
import 'package:liver_remake/Model/Models.dart';
import 'log_page.dart';
import 'package:provider/provider.dart';


class SkillPage extends StatefulWidget{
  final Key? keySkillPage;
  const SkillPage({this.keySkillPage}):super(key: keySkillPage);
  @override
  SkillPageState createState() => SkillPageState();
}

class SkillPageState extends State<SkillPage>{

  int _skillUITypeIndex = 0 ;

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
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const TrainPage()
                  )
              );
            },
            child: SizedBox(
              width: 0.6*screenWidth,
              height: 0.065*screenHeight,
              child: Image.asset('assets/New_Train_Button.png',fit: BoxFit.contain,),
            ),
          ),
          GestureDetector(
            onTap: (){
              Navigator.of(context).pop();
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
                    setState(() {
                      if(_skillUITypeIndex>0){
                        _skillUITypeIndex--;
                      }
                      else{
                        _skillUITypeIndex=2;
                      }
                    });
                  },
                  child: SizedBox(
                    width: 0.18*screenWidth,
                    height: 0.08*screenHeight,
                    child: Image.asset('assets/Left_Arrow.png',fit: BoxFit.cover,),
                  )
              ),
              SizedBox(width: 0.1*screenWidth),
              GestureDetector(
                  onTap: (){
                    setState(() {
                      if(_skillUITypeIndex<2){
                        _skillUITypeIndex++;
                      }
                      else{
                        _skillUITypeIndex=0;
                      }
                    });

                  },
                  child: SizedBox(
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
  
  Widget skillUIScene(double screenWidth, double screenHeight){
    final player = Provider.of<PlayerData>(context).player;
    List<ImageProvider> skillUIList = [
      const AssetImage('assets/Skill/Skill_UI_STR.png'),
      const AssetImage('assets/Skill/Skill_UI_INT.png'),
      const AssetImage('assets/Skill/Skill_UI_VIT.png'),
    ];

    return Container(
      width: 0.9*screenWidth,
      height: 0.5*screenHeight,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: skillUIList[_skillUITypeIndex],
              fit: BoxFit.contain
          )
      ),
     child: Column(
        children: [
          SizedBox(
            height: 0.06*screenHeight,
            child: Row(
              children: [
                SizedBox(height: 0.045*screenHeight,width: 0.735*screenWidth,),
                Container(
                  height: 0.045*screenHeight,
                  width: 0.1*screenWidth,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/Skill/Skill_SP_TextBox.png'),
                          fit: BoxFit.fill
                      )
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 0.0055*screenHeight,),
                      AutoSizeText(
                        player.sp.toString(),
                        style: const TextStyle(
                            fontSize: 26,
                            color: Color(0xFF924101),
                            fontWeight: FontWeight.bold
                        ),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 0.001*screenHeight,),
          skillItem(screenWidth, screenHeight,_skillUITypeIndex,0),
          SizedBox(height: 0.0055*screenHeight,),
          skillItem(screenWidth, screenHeight,_skillUITypeIndex,1),
          SizedBox(height: 0.0055*screenHeight,),
          skillItem(screenWidth, screenHeight,_skillUITypeIndex,2),
        ],
      ),
    );
  }
  
  Widget useOrGetButton(double screenWidth, double screenHeight,int skillType,int skillIndex){
    final List<List<SkillModel>> skillModelList = Provider.of<PlayerData>(context).skillModelList;
    final playerData = Provider.of<PlayerData>(context);
    if(skillModelList[skillType][skillIndex].hasLearned){
      return GestureDetector(
        onTap: (){
          if(!skillModelList[skillType][skillIndex].hasUsed && playerData.player.mp>=skillModelList[skillType][skillIndex].useConsumeMp){
            setState(() {
              playerData.consumeMp(skillModelList[skillType][skillIndex].useConsumeMp);
              skillModelList[skillType][skillIndex].hasUsed = true;
            });
          }
        },
        child: Container(
          height: 0.035*screenHeight,
          width: 0.15*screenWidth,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: ((!skillModelList[skillType][skillIndex].hasUsed && playerData.player.mp>=skillModelList[skillType][skillIndex].useConsumeMp) ? const AssetImage('assets/Skill/Skill_SkillUI_UseButton.png'):const AssetImage('assets/Skill/Skill_SkillUI_UseButton_inCD.png') ),
                  fit: BoxFit.cover
              )
          ),
        ),
      );
    }
    else{
      if(skillModelList[skillType][skillIndex].canLearn){
        return GestureDetector(
          onTap: (){
            setState(() {
              skillModelList[skillType][skillIndex].hasLearned=true;
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
            if(skillModelList[skillType][skillIndex].canUse){
              setState(() {
                skillModelList[skillType][skillIndex].canUse = false;
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

  Widget skillItem(double screenWidth, double screenHeight,int skillType,int skillIndex){
    final List<List<SkillModel>> skillModelList = Provider.of<PlayerData>(context).skillModelList;
    final playerData = Provider.of<PlayerData>(context);
    List<List<ImageProvider>> skillIconList = [
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

    List<List<String>> skillDescription =[
      [
        '消耗${skillModelList[skillType][skillIndex].useConsumeMp.toString()}點 MP\n下次攻擊傷害+ ${(skillModelList[skillType][skillIndex].skillLV+1).toString()}%\n升級所需點數： ${skillModelList[skillType][skillIndex].levelUpConsumeMp.toString()} SP\n',
        '消耗${skillModelList[skillType][skillIndex].useConsumeMp.toString()}點 MP\n下次攻擊以 ${(skillModelList[skillType][skillIndex].skillLV+1).toString()}% 機率獲得隨機武器\n升級所需點數： ${skillModelList[skillType][skillIndex].levelUpConsumeMp.toString()} SP\n',
        '消耗${skillModelList[skillType][skillIndex].useConsumeMp.toString()}點 MP\n格檔一次魔物的傷害\n升級所需點數： ${skillModelList[skillType][skillIndex].levelUpConsumeMp.toString()} SP\n',
      ],
      [
        '消耗${skillModelList[skillType][skillIndex].useConsumeMp.toString()}點 MP\n下次獲得經驗值+ ${(skillModelList[skillType][skillIndex].skillLV+1).toString()}%\n升級所需點數： ${skillModelList[skillType][skillIndex].levelUpConsumeMp.toString()} SP\n',
        '消耗${skillModelList[skillType][skillIndex].useConsumeMp.toString()}點 MP\n下次攻擊以 ${(skillModelList[skillType][skillIndex].skillLV+1).toString()}% 機率獲得隨機道具\n升級所需點數： ${skillModelList[skillType][skillIndex].levelUpConsumeMp.toString()} SP\n',
        '消耗${skillModelList[skillType][skillIndex].useConsumeMp.toString()}點 MP\n下次死亡不會受到懲罰\n升級所需點數： ${skillModelList[skillType][skillIndex].levelUpConsumeMp.toString()} SP\n',
      ],
      [
        '消耗${skillModelList[skillType][skillIndex].useConsumeMp.toString()}點 MP\n下次獲得金幣+ ${(skillModelList[skillType][skillIndex].skillLV+1).toString()}%\n升級所需點數： ${skillModelList[skillType][skillIndex].levelUpConsumeMp.toString()} SP\n',
        '消耗${skillModelList[skillType][skillIndex].useConsumeMp.toString()}點 MP\n下次攻擊以 ${(skillModelList[skillType][skillIndex].skillLV+1).toString()}% 機率獲得隨機飾品\n升級所需點數： ${skillModelList[skillType][skillIndex].levelUpConsumeMp.toString()} SP\n',
        '消耗${skillModelList[skillType][skillIndex].useConsumeMp.toString()}點 MP\n獲得一次額外攻擊機會\n升級所需點數： ${skillModelList[skillType][skillIndex].levelUpConsumeMp.toString()} SP\n',
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
                image: skillIconList[skillType][skillIndex],
                fit: BoxFit.fill
              )
            ),
          ),
          SizedBox(width: 0.025*screenWidth,),
          Column(
            children: [
              SizedBox(height: 0.015*screenHeight,),
              SizedBox(
                width: 0.5*screenWidth,
                height: 0.06*screenHeight,
                child: AutoSizeText(
                  skillDescription[skillType][skillIndex],
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
              SizedBox(height: 0.0125*screenHeight,),
              SizedBox(
                height: 0.035*screenHeight,
                width: 0.5*screenWidth,
                child: (skillModelList[skillType][skillIndex].hasLearned? Row(
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
                        skillModelList[skillType][skillIndex].skillLV.toString(),
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
                        if(skillModelList[skillType][skillIndex].skillLV<99 && playerData.player.sp >= skillModelList[skillType][skillIndex].levelUpConsumeMp){
                          setState(() {
                            playerData.player.sp -= skillModelList[skillType][skillIndex].levelUpConsumeMp;
                            playerData.levelUpSkill(skillType, skillIndex);
                            //skillModelList[skillType][skillIndex].skillLV++;
                          });
                        }
                      },
                      child: Container(
                        height: 0.035*screenHeight,
                        width: 0.08*screenWidth,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: ((skillModelList[skillType][skillIndex].skillLV<99 && skillModelList[skillType][skillIndex].levelUpConsumeMp<=playerData.player.sp) ?
                                const AssetImage('assets/Skill/Skill_SkillUI_LVUpButton.png'):
                                const AssetImage('assets/Skill/Skill_SkillUI_LVUpButton_Unavailable.png') ),
                                fit: BoxFit.contain
                            )
                        ),
                      ),
                    ),
                    SizedBox(width: 0.02*screenWidth,),
                    useOrGetButton(screenWidth, screenHeight,skillType,skillIndex)
                  ],
                ): Row(
                  children: [
                    SizedBox(width: 0.34*screenWidth,),
                    useOrGetButton(screenWidth, screenHeight,skillType,skillIndex)
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
    final player = Provider.of<PlayerData>(context).player;
    Provider.of<PlayerData>(context).checkMonsterAttacked();
    return Scaffold(
      backgroundColor: const Color(0xFFE2C799),
      body: SafeArea(
        child: Column(
          children: [
            characterStatusBlockWithInfoButton(screenWidth, screenHeight,player,context),
            SizedBox(height: 0.08*screenHeight,),
            skillUIScene(screenWidth, screenHeight),
            SizedBox(height: 0.07*screenHeight,),
            arrowAndMenuBar(screenWidth, screenHeight),
          ],
        ),
      ),
    );
  }
}