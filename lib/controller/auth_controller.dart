import 'dart:io';
import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loop/constants.dart';
import 'package:loop/model/userModel.dart';

class AuthController extends GetxController{
  static AuthController instance = Get.find();
  late Rx<File?> img;
  late Rx<String?> imgUrl;
  //pick image
  File? get profile{
    return img.value;
  }
  String? get profileLink{
    return imgUrl.value;
  }
  void login(String email, String password){
     try{
        firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
     }catch(e){
       Get.snackbar("Error", e.toString());

     }
  }
  void pickImg() async{
    var pick = await ImagePicker().pickImage(source: ImageSource.gallery);

    if(pick != null){
      Get.snackbar("Select Image", "Profile");
    }
    img = Rx<File?>(File(pick!.path));


  }
  // to upload img
  Future<String> uploadImg(File img) async{
    Reference ref = firebaseStorage.ref().child("profile").child(firebaseAuth.currentUser!.uid);
    UploadTask task = ref.putFile(img);
    TaskSnapshot snap = await task;
    String imgLink = await snap.ref.getDownloadURL();
    imgUrl = Rx<String?>(imgLink);
    return imgLink;
  }
  //login  user


  // to create user
 void signUp(String userName, String email, String password, File? img) async{
   try{

     if(userName.isNotEmpty&&email.isNotEmpty&&password.isNotEmpty && img != null){
       UserCredential userCred = await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      String imgLink = await uploadImg(img);
      UserModel user = UserModel(name: userName, uid: userCred.user!.uid, email: email, profile: imgLink);
      await firebaseFireStore.collection("users").doc(userCred.user!.uid).set(user.toJson());
     }else{
       Get.snackbar("We are community upload image","no profile image");
     }
   }catch(e){
     print(email);
       Get.snackbar("Auth error", e.toString());
   }

 }

}