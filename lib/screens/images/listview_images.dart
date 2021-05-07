import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/firebase_auth/firebase_auth_repository.dart';
import 'package:flutter_app/models/image.dart';
import 'function_images.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
Widget listViewImages( BuildContext context, List<QueryDocumentSnapshot> listImagesSnapShot, String ID_CATEGORY ){

  void _showDialog(BuildContext context, String imageURL, String id, String ID_CATEGORY) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text(AppLocalizations.of(context).delete_image),
          content: Text(AppLocalizations.of(context).you_are_sure),
          actions: [
            TextButton(onPressed: (){ Navigator.pop(context); }, child: Text(AppLocalizations.of(context).cancel),),
            TextButton(onPressed: (){
              FunctionImages().deleteImage( imageURL, id, ID_CATEGORY );
              Navigator.pop(context);
              }, child: Text(AppLocalizations.of(context).delete_image),),
          ],
        );
      },
    );
  }

  Widget section4(imageURL, id) { return Container(
      padding: const EdgeInsets.all(3.0),
      child:Card(
        child : Padding(padding: EdgeInsets.all(4.0),
          child: Column(
            children: [
              FadeInImage(
                image: NetworkImage(imageURL),
                placeholder: AssetImage('assets/img/tenor.gif'),
              ),
              Padding(padding: EdgeInsets.all(11.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(child: Icon(Icons.delete_forever, color: Colors.red, size: 33.0,), onTap: (){
                        // FunctionImages().deleteImage(imageURL, id, ID_CATEGORY);
                        _showDialog(context, imageURL, id, ID_CATEGORY);
                        },),
                      InkWell(child: Icon(Icons.share, color: Colors.blue, size: 33.0,), onTap: (){ FunctionImages().shareImage(imageURL); },),
                   ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<ImageModel> listImages = [];
  ImageModel imageModel;
  String userId = AuthRepository().getMyUser().uid;

  listImagesSnapShot.forEach((element) {
    imageModel = ImageModel(id: element.data()['id'], imageURL: element.data()['imageURL'],);
    listImages.add(imageModel);
    print(element.data()['imageURL']);
  });


  return ListView.builder(
    itemCount: listImages.length, itemBuilder: (context, index) {

      return section4(listImages[index].imageURL, listImages[index].id);
    },
  );
}

