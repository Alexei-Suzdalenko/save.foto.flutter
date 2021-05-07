import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class OptionsCategoryClicked {

  Future<String> asyncSimpleDialog(BuildContext context) async {
    return await showDialog<String>(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: Text(AppLocalizations.of(context).options, style: TextStyle(fontSize: 22.0),),
            titlePadding: EdgeInsets.all(22.0),
            children: [
              SimpleDialogOption(
                onPressed: () { Navigator.pop(context, 'show'); },
                child: Text(AppLocalizations.of(context).show_foto, style: TextStyle(fontSize: 18.0),),
              ),
              SimpleDialogOption(
                onPressed: () {},
                child: const Text(''),
              ),
              SimpleDialogOption(
                onPressed: () { Navigator.pop(context, 'foto'); },
                child: Text(AppLocalizations.of(context).do_foto, style: TextStyle(fontSize: 18.0),),
              ),
              SimpleDialogOption(
                onPressed: () { Navigator.pop(context, 'galeria'); },
                child: Text(AppLocalizations.of(context).upload_from_gallery, style: TextStyle(fontSize: 18.0),),
              ),
            //  SimpleDialogOption(
            //    onPressed: () {},
            //    child: const Text(''),
            //  ),
            //  SimpleDialogOption(
            //    onPressed: () { Navigator.pop(context, 'eliminar'); },
            //    child: const Text('Eliminar', style: TextStyle(fontSize: 18.0),),
            //  ),
            ],
          );
        });
  }

}

