import 'package:flutter/material.dart';
import 'package:liver_remake/pages/create_character_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class IndexPage extends StatelessWidget{
  final Key? keyIndexPage;
  IndexPage({this.keyIndexPage}):super(key:keyIndexPage);

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  Future<User?> _handleSignIn() async {
    try {
      final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      final UserCredential authResult = await _auth.signInWithCredential(credential);
      final User? user = authResult.user;

      return user;
    } catch (error) {
      print(error);
      return null;
    }
  }

  @override
  Widget build(BuildContext context){
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(102, 214, 255, 100),
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/ThemePage_Background.png'),
                  fit: BoxFit.cover
              )
          ),
          child: Center(
            child: Column(
              children: [
                SizedBox(height: screenHeight * 0.3),
                Image.asset('assets/Logo.png'),
                SizedBox(height: screenHeight * 0.2),
                GestureDetector(
                    onTap: () async{
                      User? user = await _handleSignIn();
                      if(user!=null){
                        print('登錄成功:${user.uid}');
                        Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const CreateCharacterPage(),
                            )
                        );
                      }
                      else{
                        print('登錄失敗');
                      }
                    },
                    child: SizedBox(
                      width: 0.4*screenWidth,
                      height: 0.05*screenHeight,
                      child: Image.asset('assets/LoginButton.png',fit: BoxFit.cover,),
                    )
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}