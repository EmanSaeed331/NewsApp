
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/modules/search/search_screen.dart';
import 'package:newsapp/shared/components/components.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

class NewsLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context ) => NewsCubit()..getbusines()..getSports()..getScience(),
      child: BlocConsumer<NewsCubit,NewsStates>(
        listener: (context,state){},
        builder: (context,state){
          var cubit = NewsCubit.get(context);
          return Scaffold (
          appBar: AppBar(
          title:Text(
              'News App ',
            style: TextStyle(
              color: Colors.deepOrange,
            ),
            ),
            actions: [
              IconButton(
                icon : Icon(
                    Icons.search,
                    color: Colors.deepOrange,


                ),
                onPressed: (){
                  navigateTo(context, SearchScreen());
                },
              ),
              // IconButton(
              //     icon:Icon(
              //       Icons.brightness_4_outlined,
              //       color: Colors.deepOrange,
              //     ),
              //   onPressed: (){
              //     NewsCubit.get(context).changeAppMode();
              //   },
              // ),
            ],


          ),
            body  : cubit.Screens[cubit.CurrentIndex
            ],
    bottomNavigationBar:BottomNavigationBar(
    items:cubit.bottomitems,
    currentIndex: cubit.CurrentIndex,
    onTap: (index){
      cubit.changeBottomNavigationBar(index);
    },
    ) ,


      );

    },
      ),

    );
  }


}