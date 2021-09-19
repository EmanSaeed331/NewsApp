import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'layout/news_app/MyBlocObserver.dart';
import 'layout/news_app/news_layout.dart';


void main () {
  Bloc.observer = MyBlocObserver();
  runApp(NewsApp());

}
class NewsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    return MaterialApp(

    debugShowCheckedModeBanner: false,

    theme: ThemeData(
      scaffoldBackgroundColor: Colors.white,
        appBarTheme:AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0.0,

          iconTheme: IconThemeData(
            color:Colors.black,
          ),
          titleTextStyle: TextStyle(
            color : Colors.black,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,

          ),
          backwardsCompatibility: false,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarBrightness: Brightness.light,
            statusBarIconBrightness: Brightness.dark,

          ),
        ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type:BottomNavigationBarType.fixed,
      selectedItemColor:Colors.deepOrange,


    ),
    ),


    home: NewsLayout(),


    );
  }

}