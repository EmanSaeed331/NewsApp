import 'package:flutter/material.dart';
import 'package:newsapp/shared/components/components.dart';
class SearchScreen extends StatelessWidget {
var searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column (
        children: [
          defaultFormField(
            controller: searchController,
            type:TextInputType.text,
            validate :( String value){
              if(value.isEmpty){
                return 'search must not be empty';
              }
              return null ;
            } ,
            label : 'Search',
            prefix :Icons.search ,
          ),
        ],
      ),
    );
  }
}
