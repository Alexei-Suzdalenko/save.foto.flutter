import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/firebase_auth/firebase_auth_repository.dart';
import 'package:flutter_app/firebase_database/firebase_database_repository.dart';
import 'package:flutter_app/global_data/globals.dart';
import 'package:flutter_app/widgets/nice_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginScreen();
  }
}


class _LoginScreen extends State<LoginScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            // margin: EdgeInsets.all(44.4),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/img/sign.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: null /* add child content here */,
          ),
          Align(alignment: Alignment.bottomCenter,
            child: Padding( padding: const EdgeInsets.only(bottom: 101.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [ NiceButtonWidget(
                  onPressed: (){
                  AuthRepository().tryToLoginUser().then((User user){
                    FirebaseDatabaseRepository().updateUserDataToDatabase(user);
                  });
                },
                  text:  AppLocalizations.of(context).enter_with + ' Gmail',
                  icons: Icons.account_circle, ), ],
              ),
            ) ,
          ),
        ],
      ),
    );
  }

}