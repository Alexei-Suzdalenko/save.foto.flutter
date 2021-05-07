import 'package:flutter/material.dart';
import 'package:flutter_app/global_data/globals.dart';
import 'package:flutter_app/models/category.dart';
import 'listview_builder.dart';

Widget bodyListView(String loading, String no_category ){
  return StreamBuilder<List<Category>>(
    stream: placeSelectedStream,
    builder: (BuildContext context, AsyncSnapshot<List<Category>> snapshot) {
      Widget widget;

      if(snapshot.data == null){
        widget = Center(child: Text(loading + '...'),);
        return widget;
      }
      if(snapshot.data.length == 0){
        widget = Center(child: Text(no_category),);
        return widget;
      }
      if (snapshot.hasError) {
        widget = Center(child: Text('Error'),);
        return widget;
      } else  {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            widget = Center(child: CircularProgressIndicator(),);
            break;
          case ConnectionState.waiting:
            widget = Center(child: CircularProgressIndicator(),);
            break;
          case ConnectionState.active:
            widget = listViewBuilder( snapshot );
            break;
          case ConnectionState.done:
            widget = listViewBuilder( snapshot );
            break;
        }
      }
      return widget;
    },
  );
}