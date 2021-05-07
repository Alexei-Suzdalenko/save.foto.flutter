import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:share/share.dart';

class FunctionImages {

  shareImage(String imageURL){
    Share.share(imageURL);
  }

  Future<void> deleteImage(String imageURL, String id, String ID_CATEGORY) async {
    final _storage = FirebaseStorage.instance;
    var photo = _storage.refFromURL(imageURL);

    photo.delete();

    await FirebaseFirestore.instance
        .collection("images")
        .doc(FirebaseAuth.instance.currentUser.uid)
        .collection(ID_CATEGORY)
        .doc(id)
        .delete().then((value) {

        });
  }

}

