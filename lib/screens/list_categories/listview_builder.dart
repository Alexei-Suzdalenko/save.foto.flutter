import 'dart:io';
import 'package:admob_flutter/admob_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/firebase_auth/firebase_auth_repository.dart';
import 'package:flutter_app/screens/images/ImagesFromCategory.dart';
import 'package:image_picker/image_picker.dart';


import 'options_category_clicked.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
Widget listViewBuilder( listCategoriesSnapShot ){
  AdmobInterstitial interstitialAd = AdmobInterstitial( adUnitId: "ca-app-pub-7286158310312043/6211737636");
  interstitialAd.load();

  showAddUser(){
    if (interstitialAd.isLoaded != null) { interstitialAd.show(); }
  }

  void _showDialog(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text(AppLocalizations.of(context).wait),
          content: Text(AppLocalizations.of(context).uploding),
        );
      },
    );
  }

  String userId = AuthRepository().getMyUser().uid;
  return ListView.builder(
    itemCount: listCategoriesSnapShot.data.length,
    itemBuilder: (context, index) {
      
     // _showDialog(context);

      return ListTile(
        title: Text(listCategoriesSnapShot.data[index].name),
        subtitle: Text(listCategoriesSnapShot.data[index].date),
        onTap: () async {

            final String resultData = await OptionsCategoryClicked().asyncSimpleDialog(context);

            if(resultData == 'show'){
               Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                   ImagesFromCategory(idCategory: listCategoriesSnapShot.data[index].id, nameCategory: listCategoriesSnapShot.data[index].name),),);
            }

            if(resultData == 'foto'){
              File _image;
              final pickedFile = await ImagePicker().getImage(source: ImageSource.camera);
              if (pickedFile != null) {
                _image = File(pickedFile.path);
                String fileName = DateTime.now().millisecondsSinceEpoch.toString() + '.jpg';
                Reference firebaseStorageRef = FirebaseStorage.instance.ref().child('uploads').child(userId).child(fileName);
                _showDialog(context);
                  firebaseStorageRef.putFile(_image).whenComplete(() {
                  final String uuid = DateTime.now().millisecondsSinceEpoch.toString();
                  firebaseStorageRef.getDownloadURL().then((imageURL) {
                    FirebaseFirestore.instance.collection('images')
                        .doc(userId)
                        .collection(listCategoriesSnapShot.data[index].id)
                        .doc(uuid).set({
                          'id': uuid,
                          'imageURL': imageURL
                        }).whenComplete((){
                           showAddUser();
                           Navigator.pop(context);
                           Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                               ImagesFromCategory(idCategory: listCategoriesSnapShot.data[index].id, nameCategory: listCategoriesSnapShot.data[index].name,),),);
                        });
                    },);
                  });
              }
            }

            if(resultData == 'galeria'){
              File _image;
              final pickedFile = await ImagePicker().getImage(source: ImageSource.gallery);
              if (pickedFile != null) {
                _image = File(pickedFile.path);
                String fileName = DateTime.now().millisecondsSinceEpoch.toString() + '.jpg';
                Reference firebaseStorageRef = FirebaseStorage.instance.ref().child('uploads').child(userId).child(fileName);
                _showDialog(context);
                firebaseStorageRef.putFile(_image).whenComplete(() {
                  final String uuid = DateTime.now().millisecondsSinceEpoch.toString();
                  firebaseStorageRef.getDownloadURL().then((imageURL) {
                    FirebaseFirestore.instance.collection('images')
                        .doc(userId)
                        .collection(listCategoriesSnapShot.data[index].id)
                        .doc(uuid).set({
                          'id': uuid,
                          'imageURL': imageURL
                        }).whenComplete((){
                          showAddUser();
                          Navigator.pop(context);
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                              ImagesFromCategory(idCategory: listCategoriesSnapShot.data[index].id, nameCategory: listCategoriesSnapShot.data[index].name,),),);
                        });
                  },);
                });
              }
            }


        },
      );
    },
  );
}


