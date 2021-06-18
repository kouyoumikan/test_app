/*
*    ページ移動のルート一覧
* */

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:test_app/pages/add_event.dart';
import 'package:test_app/pages/home.dart';
//import 'package:test_app/pages/splash.dart';
//import 'package:test_app/pages/user_info.dart';
//import 'package:test_app/pages/edit_profile.dart';
//import 'package:test_app/pages/profile.dart';

class AppRoutes {
  static const home = "/";
  static const splash = "splash";
  static const login = "login";
  static const signup = "signup";
  static const userInfo = "user_info";
  static const String profile = "profile";
  static const String editProfile = "edit_profile";
  static const String addEvent = "add_event";
  static const String editEvent = "edit_event";
  static const String viewEvent = "view_event";

//  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
//    return MaterialPageRoute(
//        settings: settings,
//        builder: (_) {
//          switch (settings.name) {
//            case editEvent:
//              return AddEvent(
//                  //event: settings.arguments
//              );
////            case viewEvent:
//////              return EventDetails(
//////                  event: settings.arguments
//////              );
//            case addEvent:
//              return AddEvent(
//                //selectedDate: settings.arguments,
//              );
//            case home:
//              return Home();
////            case userInfo:
////              return UserInfo();
////            case editProfile:
////              return EditProfile(
////                user: settings.arguments,
////              );
////            case profile:
////              return UserProfile();
////            case splash:
//            default:
////              return Splash();
//          }
//        });
//  }
}