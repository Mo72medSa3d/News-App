import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget Buttons({

  required TEXT,
  required onpressed,
  required Height,
  required Width

}) =>SizedBox(
  height: Height,
  width: Width,
  child:ElevatedButton(
      onPressed: onpressed,
      child: Text(TEXT,style:TextStyle(fontSize:15 ) ,)
  ),
);



Widget TiTle({

  required  Title

})=> Text(
    Title ,
    style: TextStyle(fontSize: 50));



Widget Field({
  required Name,
  required Errors,
  required FieldIcon,
  @required Controller,
  @required Keyboardtype,
  bool IsPassword=false,
  suffix,
   onpressed

})=>TextFormField(
      validator:Errors,
      obscureText:IsPassword,
      keyboardType: Keyboardtype,
      controller: Controller,
      decoration: InputDecoration(
      labelText: Name,
      prefixIcon: Icon(FieldIcon),
      suffixIcon: suffix != null ? IconButton(icon: Icon(IsPassword? Icons.visibility: Icons.visibility_off,),onPressed: onpressed,):null,
      border: OutlineInputBorder(borderRadius:BorderRadius.circular(25),
      )
)
);
