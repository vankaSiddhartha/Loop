
import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel{
  String name;
  String uid;
  String email;
  String profile;
  UserModel({required this.name, required this.uid, required this.email, required this.profile});
  Map<String, dynamic> toJson() =>{
    "name": name,
    "uid": uid,
    "email": email,
    "profile": profile,
  };
  UserModel fromSnap(DocumentSnapshot snap){
    var snapShot = snap.data() as Map<String, dynamic>;
    return UserModel(name: snapShot["name"], uid: snapShot["uid"], email: snapShot["email"], profile: snapShot["profile"]);
  }
}