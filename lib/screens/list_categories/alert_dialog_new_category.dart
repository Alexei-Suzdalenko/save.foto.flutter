import 'package:flutter/material.dart';
import 'package:flutter_app/firebase_database/firebase_database_repository.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
showMeAlertDialog(context) async {
  final controller = TextEditingController();

  return await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(AppLocalizations.of(context).create_category),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(AppLocalizations.of(context).insert_name_save),
              TextField( controller: controller ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () { Navigator.pop(context); },
              child: Text(AppLocalizations.of(context).cancel),
            ),
            TextButton(
              onPressed: () {
                final String message = controller.text;
                if( message.isEmpty || message == ' ' || message == '  ' ) { Navigator.pop(context); }
                else { FirebaseDatabaseRepository().createCategoryFromUser(message); Navigator.pop(context); }
                },
              child: Text(AppLocalizations.of(context).save),
            ),
          ],

        );
      },
    );

}