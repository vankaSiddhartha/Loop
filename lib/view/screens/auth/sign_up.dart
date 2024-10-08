import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import '../../../constants.dart';
import '../../wedgets/TextInputField.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  late Rx<String?> profileLink;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 40),
              Text(
                "Loop.",
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 35,
                  color: kTextColorPrimary,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Welcome back",
                style: TextStyle(
                  fontSize: 25,
                  color: kTextColorSecondary,
                ),
              ),
              SizedBox(height: 25),
              Stack(
                children: [
                  const CircleAvatar(
                    radius: 64,
                    backgroundImage: NetworkImage(  'https://www.pngall.com/wp-content/uploads/5/Profile-PNG-Photo.png' ),
                    backgroundColor: kBackgroundColor,
                  ),
                  Positioned(
                    bottom: -10,
                    left: 80,
                    child: IconButton(onPressed: (){
                      authController.pickImg();
                    }, icon: const Icon(Icons.add_a_photo)),
                  )
                ],
              ),
              SizedBox(height: 25),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Textinputfield(controller: nameController, labelText: "name", icon: Icons.account_circle),
              ),
              SizedBox(height: 17),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Textinputfield(controller: emailController, labelText: "email", icon: Icons.email),
              ),
              SizedBox(height: 17),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Textinputfield(controller: passController, labelText: "password", icon: Icons.lock, isPass: true),
              ),
              SizedBox(height: 20),
              Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  height: 50,
                  color: kIconColorActive,
                  child: InkWell(
                    onTap: () {
                       authController.signUp(nameController.text, emailController.text, passController.text, authController.profile);
                       Rx<String>(authController.profileLink.toString());
                    },
                    child: Center(
                      child: Text(
                        "Sign Up",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: kBackgroundColor),
                      ),
                    ),
                  )
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("If you don't have an account?", style: TextStyle(color: kTextColorSecondary)),
                  SizedBox(width: 10),
                  Text("Sign Up", style: TextStyle(color: kIconColorActive))
                ],
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}