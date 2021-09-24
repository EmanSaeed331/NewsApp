import 'dart:core';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/layout/news_app/cubit/states.dart';
import 'package:newsapp/modules/business/business_screen.dart';
import 'package:newsapp/modules/science/science_screen.dart';
import 'package:newsapp/modules/sports/sports_screen.dart';
import 'package:newsapp/shared/network/local/CacheHelper.dart';
import 'package:newsapp/shared/network/remote/dio_helper.dart';

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
    // BottomNavigationBarItem(
    //   icon:Icon(
    //     Icons.settings
    //   ),
    //   label:'Settings'
    // ),
  ];
   List <dynamic> business = [];
  List <dynamic> sports = [];
  List <dynamic> science = [];


  List <Widget> Screens = [
    BusinessScreen (),
    SportsScreen (),
    ScienceScreen(),
    //SettingsScreen(),
  ];
  void changeBottomNavigationBar (int index){
    CurrentIndex = index;
    // if(index == 1) getSports();
    // if(index == 2) getScience();

    emit(NewsBottomNavigationBar());
  }
  // base url : https://newsapi.org/
// method (url) : v2/top-headlines?
// queries : country=eg&category=business&apiKey=65f7f556ec76449fa7dc7c0069f040ca

// https://newsapi.org/v2/everything?q=tesla&apiKey=65f7f556ec76449fa7dc7c0069f040ca
  void getbusines(){
    emit(NewsLoadingBusinessState());
    DioHelper.getData(
      url:'v2/top-headlines',
      query: {
        'country':'eg',
        'category':'business',
        'apiKey'  :'321ab7c1785f413e88c0d8c3abf8e769',
      },
    ).then((value) {
      business = value?.data['articles'];
     // print(value?.data.toString());
      emit(NewsGetBusinessSuccessState());
      print(business[0]['title']);
    }).catchError((error){
      print('error++'+error.toString());
      emit(NewsGetBusinessErrorState(error.toString()));
    });

  }
  void getSports(){
    emit(NewsLoadingSportsState());
    //if (sports.length == 0 ){
      DioHelper.getData(
        url:'v2/top-headlines',
        query: {
          'country':'eg',
          'category':'sports',
          'apiKey'  :'321ab7c1785f413e88c0d8c3abf8e769',
        },
      ).then((value) {
        sports = value?.data['articles'];
        // print(value?.data.toString());
        emit(NewsGetSportsSuccessState());
        print(sports[0]['title']);
      }).catchError((error){
        print('error++'+error.toString());
        emit(NewsGetSportsErrorState(error.toString()));
      });


  }
  void getScience(){
    emit(NewsLoadingScienceState());
   // if(science.length == 0 ){
      DioHelper.getData(
        url:'v2/top-headlines',
        query: {
          'country':'eg',
          'category':'science',
          'apiKey'  :'321ab7c1785f413e88c0d8c3abf8e769',
        },
      ).then((value) {
        science = value?.data['articles'];
        // print(value?.data.toString());
        emit(NewsGetScienceSuccessState());
        print(science[0]['title']);
      }).catchError((error){
        print('error++'+error.toString());
        emit(NewsGetScienceErrorState(error.toString()));
      });


  }
  bool isDark = false;
  void changeAppMode({bool fromShared})
  {
    if (fromShared!=null) {
      isDark = fromShared;
      emit(AppChangeModeState());

    }
    else
      {
        isDark = !isDark ;
        CacheHelper.putDate(key : 'isDark' , value : isDark).then((value)
        {
          emit(AppChangeModeState());

        });

      }

  }

}
