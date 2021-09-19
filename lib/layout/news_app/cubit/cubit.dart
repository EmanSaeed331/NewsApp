import 'dart:core';
import 'dart:core';
import 'package:flutter/material.dart';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/layout/news_app/cubit/states.dart';
import 'package:newsapp/modules/business/business_screen.dart';
import 'package:newsapp/modules/science/science_screen.dart';
import 'package:newsapp/modules/settings/settings_screens.dart';
import 'package:newsapp/modules/sports/sports_screen.dart';

class NewsCubit extends Cubit <NewsStates>
{
  NewsCubit ():super (NewsIntialState());
  static NewsCubit get (context) => BlocProvider.of(context);
  int CurrentIndex = 0;
  List <BottomNavigationBarItem> bottomitems =[
    BottomNavigationBarItem(
      icon: Icon(
        Icons.business,
      ),
      label:('Business'),
    ),
    BottomNavigationBarItem(
      icon:Icon(
        Icons.sports
      ),
      label:'Sports',

    ),
    BottomNavigationBarItem(
      icon:Icon(
        Icons.science,
      ),
      label:'Science',

    ),
    BottomNavigationBarItem(
      icon:Icon(
        Icons.settings
      ),
      label:'Settings'
    ),
  ];
  List <Widget> Screens = [
    BusinessScreen (),
    SportsScreen (),
    ScienceScreen(),
    SettingsScreen(),
  ];
  void changeBottomNavigationBar (int index){
    CurrentIndex = index;
    emit(NewsBottomNavigationBar());
  }

}
