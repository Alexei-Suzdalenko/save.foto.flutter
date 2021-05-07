import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_app/screens/list_categories/ListCategoriesScreen.dart';
import 'package:flutter_app/screens/login_screen/login_screen.dart';
import 'global_data/globals.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'l10n/l10.dart';
// https://www.appsdeveloperblog.com/internationalization-example-in-flutter/
// https://youtu.be/atfzyCWnI7w

void main() async { // alexander.web.app.developer@gmail.com , web-developer-alexei firebase !!!
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Admob.initialize();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  Widget handleCurrentSession(BuildContext context){

    return StreamBuilder(
      stream: authStatus,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        if( !snapshot.hasData || snapshot.hasError ){
          return LoginScreen();
        } else {
          return ListCategorisScreen();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Named Routes Demo',
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: L10n.all,
      home: handleCurrentSession(context),
    );
  }
}






















