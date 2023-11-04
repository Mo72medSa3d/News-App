import 'package:get/get.dart';
import 'package:news_app/View/home_screen.dart';
import 'package:news_app/View/LoginScreen.dart';
import 'package:news_app/View/SignupScreen.dart';

class AppPages {
  static final routes = [
    GetPage(name: '/home', page: () => HomeScreen()),
    GetPage(name: '/signup', page: () => SignupScreen()),
    GetPage(name: '/login', page: () => LoginScreen()),
  ];
}
