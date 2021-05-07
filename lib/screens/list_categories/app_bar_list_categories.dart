import 'package:flutter/material.dart';
import 'package:flutter_app/firebase_auth/firebase_auth_repository.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: non_constant_identifier_names
AppBar list_categories_bar(String title, String category) {
  _launchURL() async {
    const url = 'https://play.google.com/store/apps/details?id=save.foto.flutter_app';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
 return AppBar(
    actions: <Widget>[
      IconButton( icon: Icon(
       Icons.favorite,
       color: Colors.white,
       size: 33.3,
       semanticLabel: 'Text to announce in accessibility modes',
      ),
      onPressed:  _launchURL,
      ),
      IconButton( icon: Icon(
        Icons.logout,
        color: Colors.white,
        size: 33.3,
        semanticLabel: 'Text to announce in accessibility modes',
      ),
        onPressed: (){
          AuthRepository().signOut();
        },
      ),
    ],
    title: Row(
      children: [
        Container(
            width: 48.0,
            height: 48.0,
            decoration: new BoxDecoration(
                shape: BoxShape.circle,
                image: new DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(AuthRepository()
                        .getMyUser()
                        .photoURL)
                )
            )),
        Flexible(
          child: Container(margin: EdgeInsets.only(left: 22.1,),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(AuthRepository()
                    .getMyUser()
                    .displayName, style: TextStyle(fontSize: 18.0,),),
                Text(
                  category, style: TextStyle(fontSize: 16.0,),),
              ],
            ),
          ),
        ),
      ],

    ),
  );
}