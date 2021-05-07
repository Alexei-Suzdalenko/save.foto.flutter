import 'package:admob_flutter/admob_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/firebase_database/firebase_database_repository.dart';
import 'alert_dialog_new_category.dart';
import 'app_bar_list_categories.dart';
import 'body_list_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class ListCategorisScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _ListCategorisScreen();
  }
}

class _ListCategorisScreen extends State<ListCategorisScreen> {
  AdmobBannerSize bannerSize;

  @override
  void initState() {
    super.initState();
    bannerSize = AdmobBannerSize.BANNER;
  }


  @override
  Widget build(BuildContext context) {
    FirebaseDatabaseRepository().getListCategories();
    final size = MediaQuery.of(context).size;
    final height = double.infinity;

    return Scaffold( bottomSheet: Padding(padding: EdgeInsets.only(bottom: 222.0)),
      appBar: list_categories_bar(AppLocalizations.of(context).out_, AppLocalizations.of(context).category_),

      body: Column( mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(child:  bodyListView(AppLocalizations.of(context).loading, AppLocalizations.of(context).no_category),),
          AdmobBanner(adUnitId: "ca-app-pub-7286158310312043/9612405525", adSize: AdmobBannerSize.ADAPTIVE_BANNER(width: size.width.toInt(),),),
        ],
      ), 
      



      floatingActionButton: FloatingActionButton(
        onPressed:  (){ showMeAlertDialog(context); },
        tooltip: '',
        child: Icon(Icons.add),
      ),
    );
  }
}



