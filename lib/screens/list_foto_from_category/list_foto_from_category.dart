import 'package:flutter/material.dart';
import 'package:flutter_app/firebase_auth/firebase_auth_google.dart';

class ListFotoFromCategory extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ListFotoFromCategory();
  }
}


class _ListFotoFromCategory extends State<ListFotoFromCategory> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload files to cloud'),
      ),
      body: Center(
        child: Column(
          children: [
           ElevatedButton(
             onPressed: () {
               // Navigator.push(context, MaterialPageRoute(builder: (context) => ListCategorisScreen()),);
             },
             child: Text('urra LOgin'),
            ),
            ElevatedButton(
              onPressed: (){
                FirebaseAuthAPI().signOut();
              },
              child: Text('Login OUT'),
            ),
          ],
        ),
      ),
    );
  }

}