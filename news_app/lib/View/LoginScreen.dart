import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Components.dart';


class LoginScreen extends StatefulWidget {

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obsecure=true;
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    var formkey = GlobalKey<FormState>();
    onSumbit() {
      final isValid = formkey.currentState?.validate();
      if (isValid == false) {
        return;
      }
      Get.offAllNamed('/home');
    }
    var EmailController = TextEditingController();
    var PasswordController = TextEditingController();


    return Scaffold(
        appBar: AppBar(
        ),
        body:
        SafeArea(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child:
              Center(
                child: Form(
                  key: formkey,
                  child: Column(
                    children: [

                      SizedBox(height: mediaQuery.size.height / 8),

                      TiTle(Title: "LOGIN"),

                      SizedBox(height: mediaQuery.size.height / 20),

                      Field(
                        Controller: EmailController,
                          Keyboardtype: TextInputType.emailAddress,
                          Name: "Email Address & Phone Number",
                          Errors: (val){
                            if (val!.isEmpty) {
                            return "The Field Is Empthy";
                            } else if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+[.]+.[a-z]").hasMatch(val)){
                            return 'Email Is Valid';
                            }},
                          FieldIcon: Icons.email

                      ),


                      SizedBox(height: mediaQuery.size.height / 20),

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

                      SizedBox(height: mediaQuery.size.height / 20),

                      Buttons(
                          Width: mediaQuery.size.width/2,
                          TEXT: "LOGIN",
                          onpressed: (){
                            print(EmailController);
                            print(PasswordController);
                            onSumbit();
                          },
                          Height:50
                      ),

                      SizedBox(height: mediaQuery.size.height / 20),

                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:
                          [
                            Text("Don\'t have an account?", style: TextStyle(
                                fontSize: 15),),
                            TextButton(
                                onPressed: () => Get.offAllNamed('/signup'),
                                child: Text(
                                    "Register now",
                                    style: TextStyle(
                                        color: Colors.blue, fontSize: 15)
                                )
                            )
                          ]
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        )
      );
    }
  }