import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mini_mansion/constant/variables.dart';

class FirebaseActions {
  static Future<void> addMail() async {
    CollectionReference collectionRef =
        FirebaseFirestore.instance.collection('users');
    String id = auth.currentUser!.uid;

    await collectionRef.doc(id).set(
      {
        'username': auth.currentUser!.displayName,
        'email': auth.currentUser!.email,
      },
    );
  }
}
