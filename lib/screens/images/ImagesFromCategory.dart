import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../firebase_auth/appbar_category.dart';
import 'listview_images.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
String ID_CATEGORY = "";
class ImagesFromCategory extends StatefulWidget {
  String idCategory;
  String nameCategory;
  ImagesFromCategory({this.idCategory, this.nameCategory});
  String uid = FirebaseAuth.instance.currentUser.uid.toString();

  @override
  State<StatefulWidget> createState() {
    return _ImagesFromCategory();
  }
}

class _ImagesFromCategory extends State<ImagesFromCategory> {
  @override
  Widget build(BuildContext context) {
    ID_CATEGORY = widget.idCategory;
    return Scaffold(
      appBar: appbarCategory(widget.nameCategory),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('images').doc(widget.uid).collection(widget.idCategory).snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          Widget widget;
          if(!snapshot.hasData){
            widget = Center(child: Text(AppLocalizations.of(context).loading),);
            return widget;
          }
          if(snapshot.data.size == 0){
            widget = Center(child: Text(AppLocalizations.of(context).not_images),);
            return widget;
          }
          if(snapshot.data.size > 0 ){
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                widget = Center(child: CircularProgressIndicator(),);
                break;
              case ConnectionState.waiting:
                widget = Center(child: CircularProgressIndicator(),);
                break;
              case ConnectionState.active:
                widget = listViewImages(context, snapshot.data.docs, ID_CATEGORY );
                break;
              case ConnectionState.done:
                widget = listViewImages( context, snapshot.data.docs, ID_CATEGORY );
                break;
            }
          }
          return widget;
        },
      ),
    );
  }

}