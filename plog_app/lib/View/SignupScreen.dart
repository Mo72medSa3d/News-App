import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Components.dart';

class SignupScreen extends StatefulWidget {

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  bool _obsecure=true;
  bool _obsecures=true;
  Widget build(BuildContext context) {

    final mediaQuery = MediaQuery.of(context);
    var EmailController=TextEditingController();
    var PasswordController=TextEditingController();
    var Confirm_PasswordController=TextEditingController();
    int number=30;
    var formkey = GlobalKey<FormState>();
    onSumbit(){
      final isValid = formkey.currentState?.validate();
      if(isValid == false) {
        return;
      }
      Get.offAllNamed('/login');
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back),onPressed: (){Get.offNamed("/login");},),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Center(
              child: Form(
                key: formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: mediaQuery.size.height /10),

                    Text("Sign up",style: TextStyle(fontSize: 40),),

                    SizedBox(height: mediaQuery.size.height /number),

                    Field(
                        Name: "First Name",
                        Errors: (val){
                          if(val!.isEmpty) {
                            return "The Field Is Empthy";
                          }
                        },
                        FieldIcon:Icons.person
                    ),

                    SizedBox(height: mediaQuery.size.height /number),

                    Field(
                        Name: "Last Name",
                        Errors: (val){
                          if(val!.isEmpty) {
                            return "The Field Is Empthy";
                          }
                        },
                        FieldIcon:Icons.person
                    ),

                    SizedBox(height: mediaQuery.size.height / number),

                    Field(
                        Controller: EmailController,
                        Keyboardtype: TextInputType.emailAddress,
                        Name: "Email Address & Phone Number",
                        Errors: (val){
                          if (val!.isEmpty) {
                            return "The Field Is Empthy";
                          } else if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9-]+[.]+[a-z]").hasMatch(val)){
                            return 'Email Is Valid';
                          }
                        },
                        FieldIcon: Icons.email

                    ),

                    SizedBox(height: mediaQuery.size.height / number),

                    Field(
                        Name: "Password",
                        Keyboardtype:TextInputType.visiblePassword,
                        Errors:  (val){
                          if (val!.isEmpty) {
                            return "The Field Is Empthy";
                          }
                        },
                        FieldIcon: Icons.password,
                        Controller: PasswordController,
                        IsPassword: _obsecure,
                        suffix: Icons.remove_red_eye,
                        onpressed:(){
                          setState(() {
                            _obsecure = !_obsecure;
                          });
                        }
                    ),

                    SizedBox(height: mediaQuery.size.height / number),


                    Field(
                        Name: "Confirm-Password",
                        Keyboardtype:TextInputType.visiblePassword,
                        Errors:  (val){
                          if(val!.isEmpty)
                          {
                            return 'The Field Is Empthy';
                          }
                          print(PasswordController.text);
                          print(Confirm_PasswordController.text);
                          if(PasswordController.text!=Confirm_PasswordController.text){
                            return "Password does not match";
                          }
                          return null;
                        },
                        FieldIcon: Icons.password,
                        Controller: Confirm_PasswordController,
                        IsPassword: _obsecures,
                        suffix: Icons.remove_red_eye,
                        onpressed:(){
                          setState(() {
                            _obsecures = !_obsecures;
                          });
                        }
                    ),


                    SizedBox(height: mediaQuery.size.height / number),

                    Buttons(
                        Width: mediaQuery.size.width/2,
                        TEXT: "SIGN UP",
                        onpressed: (){
                          print(EmailController);
                          print(PasswordController);
                          onSumbit();
                        },
                        Height:50
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

