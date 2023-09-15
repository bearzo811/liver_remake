import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:liver_remake/Model/Models.dart';
import 'package:liver_remake/PlayerData/playerData.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();
final FirebaseFirestore fireStore = FirebaseFirestore.instance;

Future<User?> loginGoogleAccount() async {
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

Future<void> logOutGoogleAccount() async {
  try {
    await googleSignIn.signOut();
    // 成功登出 Google 帐户
  } catch (e) {
    // 处理错误
    print("无法登出 Google 帐户: $e");
  }
}

Future<void> addUser(String uid,Player player,PlayerData playerData) async {
  final playerDataList = {
    ...player.toMap(),
    ...playerData.monsterLevelToMap(),
    'monsterList' : playerData.monsterListMapList(),
    'achievementList' : playerData.achievementListMapList(),
    'logListMapList':playerData.logListMapList(),
    'trainItemListMapList':playerData.trainItemListMapList(),
    'strSkillMapList':playerData.strSkillMapList(),
    'intSkillMapList':playerData.intSkillMapList(),
    'vitSkillMapList':playerData.vitSkillMapList(),
    'shopItemListMapList':playerData.shopItemListMapList(),
    'bagItemListMapList':playerData.bagItemListMapList(),
  };

  try {
    await fireStore.collection('userData').doc(uid).set(
        playerDataList
    );
  } catch (e) {
    print('Error adding data: $e');
  }
}

FutureOr<bool?> checkUidInUserDataOrNot(String uid) async {
  try {
    final QuerySnapshot querySnapshot =
    await FirebaseFirestore.instance.collection('userData')
        .where(FieldPath.documentId, isEqualTo: uid)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      print('user found');
      return true;
    } else {
      print('user not found');
      return false;
    }
  } catch (e) {
    print('Error searching document by name: $e');
    return null;
  }
}

Future<void> getUserData(String uid,PlayerData playerData) async {
  try {
    final DocumentSnapshot documentSnapshot = await fireStore.collection('userData').doc(uid).get();
    if (documentSnapshot.exists) {
      final Map<String, dynamic> data = documentSnapshot.data() as Map<String, dynamic>;
      print('${data['shopItemListMapList']}');
      playerData.getDataFromFirebase(data);
    } else {
      print('Document does not exist.');
    }
  } catch (e) {
    print('Error getting user data: $e');
  }
}

Future<void> updatePlayer(String uid,PlayerData playerData) async {
  try {
    await fireStore.collection('userData').doc(uid).update(
    playerData.player.toMap()
    );
  } catch (e) {
    print('Error adding data: $e');
  }
}

Future<void> updateMonster(PlayerData playerData) async {
  try {
    DocumentReference userDocRef = FirebaseFirestore.instance.collection('userData').doc(playerData.uid);
    DocumentSnapshot userSnapshot = await userDocRef.get();
    Map<String, dynamic> updatedData = {
      'monsterList': playerData.monsterListMapList(),
    };

    await userDocRef.update(updatedData);

  } catch (e) {
    print('Error adding data: $e');
  }
}

Future<void> updateAllData(PlayerData playerData) async{
  final playerDataList = {
    ...playerData.player.toMap(),
    ...playerData.monsterLevelToMap(),
    'monsterList' : playerData.monsterListMapList(),
    'achievementList' : playerData.achievementListMapList(),
    'logListMapList':playerData.logListMapList(),
    'trainItemListMapList':playerData.trainItemListMapList(),
    'strSkillMapList':playerData.strSkillMapList(),
    'intSkillMapList':playerData.intSkillMapList(),
    'vitSkillMapList':playerData.vitSkillMapList(),
    'shopItemListMapList':playerData.shopItemListMapList(),
    'bagItemListMapList':playerData.bagItemListMapList(),
  };
  try {
    await fireStore.collection('userData').doc(playerData.uid).update(
        playerDataList
    ).then((_) => print('all update done'));
  } catch (e) {
    print('Error adding data: $e');
  }
}