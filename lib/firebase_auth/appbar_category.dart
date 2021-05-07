import 'package:flutter/material.dart';

import 'firebase_auth_repository.dart';


appbarCategory(String name_category) => AppBar(
  title: Row(
    children: [
      Flexible(
        child: Container(
          child: Column(  crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text( AuthRepository().getMyUser().displayName, style: TextStyle(fontSize: 18.0,),),
              Text( name_category, style: TextStyle(fontSize: 16.0,), ),
            ],
          ),
        ),
      ),
    ],

  ),
);