import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_app/models/category.dart';


var LangApp;

Stream<User> streamFirebase = FirebaseAuth.instance.authStateChanges();
Stream<User> get authStatus => streamFirebase;

Future<User> get currentUser async {
  User user = FirebaseAuth.instance.currentUser;
  return user;
}

List<Category> categoryList = [];

StreamController<List<Category>> placeSelectedStreamController =  StreamController<List<Category>>.broadcast();
Stream get placeSelectedStream => placeSelectedStreamController.stream;
StreamSink get placeSelectedSink =>  placeSelectedStreamController.sink;



