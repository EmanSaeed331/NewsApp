import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class SplashScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('333739'),
      appBar:AppBar(),
      body: Container(

        child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,


          children: [
            Text(
              'News App',
              style:TextStyle(
                fontSize: 50,
                color: Colors.deepOrange,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,


              ),

            ),


          ],
        ),
      ),
    );
  }
}
