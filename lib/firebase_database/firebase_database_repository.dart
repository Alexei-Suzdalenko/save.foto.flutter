import 'package:firebase_auth/firebase_auth.dart';

import 'firebase_database.dart';


class FirebaseDatabaseRepository{

  FirebaseDatabaseOperations firebaseDatabaseOperations = FirebaseDatabaseOperations();

  updateUserDataToDatabase(User user) =>  firebaseDatabaseOperations.updateUserData(user);

  createCategoryFromUser(String category_name) => firebaseDatabaseOperations.createCategoryFromUser(category_name);

  getListCategories() => firebaseDatabaseOperations.getListCategories();


}