import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';


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

                      Text("Login", style: TextStyle(fontSize: 50)),

                      SizedBox(height: mediaQuery.size.height / 12),

                      TextFormField(

                        validator: (val) {
                          if (val!.isEmpty) {
                            return "The Field Is Empthy";
                          } else if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(val)){
                            return 'Email Is Valid';

                          }
                        },
                        onFieldSubmitted: (value) {},
                        controller: EmailController,
                        decoration: InputDecoration(
                          labelText: "Email Address & Phone Number",
                          prefixIcon: Icon(Icons.email),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15)
                          ),
                        ),

                      ),

                      SizedBox(height: 15),

                      TextFormField(
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: _obsecure,
                          controller: PasswordController,
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "The Field Is Empthy";
                            }
                          },
                          decoration: InputDecoration(
                            labelText: "Password",
                            prefixIcon: Icon(Icons.lock),
                            suffixIcon: IconButton(
                              icon: _obsecure ? Icon(Icons.visibility):Icon(Icons.visibility_off),
                              onPressed: () {
                                setState(() {
                                  _obsecure =! _obsecure;
                                });
                              }
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15)),
                          )
                      ),

                      SizedBox(height: 20),

                      SizedBox(
                        width: mediaQuery.size.width / 2,
                        height: 50,
                        child: ElevatedButton(
                          child: Text('Login', style: TextStyle(fontSize: 15)),
                          style: ButtonStyle(),
                          onPressed: () {
                            print(EmailController);
                            print(PasswordController);
                            onSumbit();
                          },
                        ),
                      ),

                      SizedBox(height: 15),

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