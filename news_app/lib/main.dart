import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/Routes/app_pages.dart';

void main() {
  runApp(GetMaterialApp(
    title: 'Plog',                                                                      
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    initialRoute: '/login',
    getPages: AppPages.routes,
    debugShowCheckedModeBanner: false,
  ));
}
