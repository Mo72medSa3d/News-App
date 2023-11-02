import 'package:flutter/material.dart';
import 'package:get/get.dart';

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

                    TextFormField(
                      validator: (val){
                        if(val!.isEmpty) {
                          return "The Field Is Empthy";
                        }
                      },
                      decoration: InputDecoration(
                        labelText: "First Name",
                        prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(borderRadius:BorderRadius.circular(15)),
                      ),
                    ),

                    SizedBox(height: mediaQuery.size.height /number),

                    TextFormField(
                      validator: (val){
                      if(val!.isEmpty) {
                      return "The Field Is Empthy";
                      }
                      },
                      decoration: InputDecoration(
                        labelText: "Last Name",
                        prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(borderRadius:BorderRadius.circular(15)),
                      ),
                    ),

                    SizedBox(height: mediaQuery.size.height / number),

                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
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

                            borderRadius:BorderRadius.circular(15)
                        ),
                      ),

                    ),

                    SizedBox(height: mediaQuery.size.height / number),

                    TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: _obsecure,
                      controller: PasswordController,
                      validator: (val){
                        if(val!.isEmpty){
                          return "The Field Is Empthy";
                        }
                      },
                      decoration: InputDecoration(
                          labelText: "Password",
                          prefixIcon:Icon(Icons.lock) ,
                          suffixIcon: IconButton(
                          icon: Icon(_obsecure
                              ? Icons.visibility
                              : Icons.visibility_off,
                              ),
                                onPressed: () {setState(() {_obsecure = !_obsecure;});}
                          ),
                          border: OutlineInputBorder(borderRadius:BorderRadius.circular(15)),
                    )
            ),

                    SizedBox(height: mediaQuery.size.height / number),

                    TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: _obsecures,
                      controller: Confirm_PasswordController,
                      validator: (val){
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
                      decoration: InputDecoration(
                        labelText: "Password",
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: IconButton(
                            icon: Icon(_obsecures
                                ? Icons.visibility
                                : Icons.visibility_off,
                            ),
                            onPressed: () {setState(() {_obsecures = !_obsecures;});}
                        ),
                        border: OutlineInputBorder(borderRadius:BorderRadius.circular(15)),
                      )
                    ),

                    SizedBox(height: mediaQuery.size.height / number),

                    SizedBox(
                      width: mediaQuery.size.width / 2,
                      height: 50,
                      child: ElevatedButton(
                        child: Text('Sign up',style: TextStyle(fontSize: 15)),
                        onPressed: () {

                          print(EmailController);
                          print(PasswordController);
                          onSumbit();
                          }
                      ),
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

