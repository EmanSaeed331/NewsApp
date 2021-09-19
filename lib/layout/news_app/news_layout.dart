
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

class NewsLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context ) => NewsCubit(),
      child: BlocConsumer<NewsCubit,NewsStates>(
        listener: (context,state){},
        builder: (context,state){
          var cubit = NewsCubit.get(context);
          return Scaffold (
          appBar: AppBar(
          title:Text(
              ''
            ),

          ),

    bottomNavigationBar:BottomNavigationBar(
    items:cubit.bottomitems,
    currentIndex: cubit.CurrentIndex,
    onTap: (index){
      cubit.changeBottomNavigationBar(index);
    },
    ) ,
    body  : cubit.Screens[cubit.CurrentIndex
        ],

      );

    },
      ),

    );
  }


}