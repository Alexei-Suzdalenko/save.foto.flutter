import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_app/global_data/globals.dart';
import 'package:flutter_app/models/category.dart';
import 'package:intl/intl.dart';


import 'firebase_database_repository.dart';
class FirebaseDatabaseOperations {

  final String USERS = 'users';
  final String CATEGORIES = 'categories';
  var firebaseReference = FirebaseDatabase.instance.reference();
  String uid = FirebaseAuth.instance.currentUser.uid.toString();
  
  updateUserData(User user) async {
    firebaseReference.child(USERS).child(uid).update({
      'uid': uid,
      'name': user.displayName,
      'email': user.email,
      'photo': user.photoURL,
    }).then((documetntReference) {
      print(' - - - -- - - - - -- - - -  USER UPDATED  -- - ++++ + + ++ + + + ++ + + ');
    });
  }

   createCategoryFromUser(String categoryName) async {
    final String formatted = DateFormat('yyyy-MM-dd').format(DateTime.now());
    String key = firebaseReference.child(USERS).child(uid).child(CATEGORIES).push().key;
    await firebaseReference.child(USERS).child(uid).child(CATEGORIES).child(key).update({
        'category': categoryName,
        'date': formatted,
        'id': key
    }).whenComplete((){
      FirebaseDatabaseRepository().getListCategories();
    }) ;
  }
  
  getListCategories() async { // .orderByChild("id")
    categoryList = [];
    DatabaseReference db = FirebaseDatabase.instance.reference().child('users').child(uid).child('categories');

    await db.once().then((DataSnapshot snapshot) {
      categoryList = [];
      if(snapshot.value != null){
        snapshot.value.forEach((key, values) {
          final category = Category(name: values['category'], date: values['date'], id: values['id']);
          categoryList.add(category);
        });
      }
      if( categoryList.length > 0 ){
        placeSelectedSink.add( categoryList );
      } else {
        placeSelectedSink.add( categoryList );
      }
    });
  }
  

  
  
  



}























