import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:liver_remake/PlayerData/playerData.dart';
import 'package:liver_remake/pages/bag_page.dart';
import 'package:liver_remake/Model/Models.dart';
import 'package:provider/provider.dart';

class InfoPage extends StatefulWidget{
  final Key? keyInfoPage;
  const InfoPage({this.keyInfoPage}):super(key:keyInfoPage);
  @override
  InfoPageState createState() => InfoPageState();
}

class InfoPageState extends State<InfoPage>{

  Widget infoBlock(double screenWidth,double screenHeight,Player player){
    return Container(
      width: 0.9*screenWidth,
      height: 0.7*screenHeight,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/Info/CharacterInfo_UI.png'),
          fit: BoxFit.contain
        )
      ),
      child: Row(
        children: [
          SizedBox(
            width: 0.5*screenWidth,
            height: 0.55*screenHeight,
            child: Column(
              children: [
                SizedBox(height: 0.1*screenHeight,),
                SizedBox(
                  width: 0.5*screenWidth,
                  height: 0.05*screenHeight,
                  child: AutoSizeText(
                    player.name,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Row(
                  children: [
                    SizedBox(width: 0.35*screenWidth,),
                    SizedBox(
                      width: 0.15*screenWidth,
                      height: 0.05*screenHeight,
                      child: AutoSizeText(
                        player.level.toString(),
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    SizedBox(width: 0.2*screenWidth,),
                    SizedBox(
                      width: 0.15*screenWidth,
                      height: 0.05*screenHeight,
                      child: AutoSizeText(
                        player.hp.toString(),
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      width: 0.15*screenWidth,
                      height: 0.05*screenHeight,
                      child: const AutoSizeText(
                        '1',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 0.01*screenHeight,),
                Row(
                  children: [
                    SizedBox(width: 0.2*screenWidth,),
                    SizedBox(
                      width: 0.15*screenWidth,
                      height: 0.05*screenHeight,
                      child: AutoSizeText(
                        player.mp.toString(),
                        style: const TextStyle(
                          fontSize: 28,
                           fontWeight: FontWeight.bold,
                          color: Colors.black54,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      width: 0.15*screenWidth,
                      height: 0.05*screenHeight,
                      child: AutoSizeText(
                        player.maxMp.toString(),
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 0.005*screenHeight,),
                Row(
                  children: [
                    SizedBox(width: 0.2*screenWidth,),
                    SizedBox(
                      width: 0.15*screenWidth,
                      height: 0.05*screenHeight,
                      child: AutoSizeText(
                        player.exp.toString(),
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      width: 0.15*screenWidth,
                      height: 0.05*screenHeight,
                      child: AutoSizeText(
                        player.maxExp.toString(),
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 0.006*screenHeight,),
                Row(
                  children: [
                    SizedBox(width: 0.35*screenWidth,),
                    SizedBox(
                      width: 0.15*screenWidth,
                      height: 0.05*screenHeight,
                      child: AutoSizeText(
                        player.STR.toString(),
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 0.007*screenHeight,),
                Row(
                  children: [
                    SizedBox(width: 0.35*screenWidth,),
                    SizedBox(
                      width: 0.15*screenWidth,
                      height: 0.05*screenHeight,
                      child: AutoSizeText(
                        player.INT.toString(),
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 0.007*screenHeight,),
                Row(
                  children: [
                    SizedBox(width: 0.35*screenWidth,),
                    SizedBox(
                      width: 0.15*screenWidth,
                      height: 0.05*screenHeight,
                      child: AutoSizeText(
                        player.VIT.toString(),
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            width: 0.4*screenWidth,
            height: 0.55*screenHeight,
            child: Column(
              children: [
                SizedBox(height: 0.07*screenHeight,),
                character(screenWidth, screenHeight, player),
                SizedBox(height: 0.15*screenHeight,),
                GestureDetector(
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context)=>const BagPage()
                        )
                    );
                  },
                  child: Container(
                    width: 0.25*screenWidth,
                    height: 0.1*screenHeight,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/Info/Backpack_Button.png'),
                        fit: BoxFit.contain
                      )
                    ),
                  ),
                )
              ],
            ),
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
    return Scaffold(
      backgroundColor: const Color(0xFFE2C799),
      body: SafeArea(
        child: Column(
          children: [
            characterStatusBlockWithHomeButton(screenWidth, screenHeight,player,context),
            SizedBox(height: 0.03*screenHeight,),
            infoBlock(screenWidth, screenHeight, player)
          ],
        ),
      ),
    );
  }
}