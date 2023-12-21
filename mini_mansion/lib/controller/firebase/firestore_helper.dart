import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mini_mansion/constant/functions.dart';
import 'package:mini_mansion/model/membership_model.dart';

class FirebaseFirestoreHelper {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<MembershipModel> addMembership(Map<String, dynamic> body) async {
    DocumentReference<Map<String, dynamic>> ref =
        _firestore.collection('membership').doc();

    body.addAll({
      'membershipId': ref.id,
    });

    MembershipModel addMembership = MembershipModel.fromJson(body);
    await ref.set(addMembership.toJson());
    return addMembership;
  }

  Future<List<MembershipModel>> getHotels() async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await FirebaseFirestore.instance.collection('membership').get();
    List<MembershipModel> membershipList = querySnapshot.docs
        .map((e) => MembershipModel.fromJson(e.data()))
        .toList();

    return membershipList;
  }


  // Future<MembershipModel> addFavouriteMembership(List<MembershipModel> favMemberships) async {
  //   String curentUserUid= FirebaseAuth.instance.currentUser!.uid;
  //   // DocumentReference<Map<String, dynamic>> ref =
  //       _firestore.collection('users').doc(curentUserUid).update({
  //         'favourites':favMemberships
  //       });


  //   MembershipModel addMembership = MembershipModel.fromJson(body);
  //   await ref.set(addMembership.toJson());
  //   return addMembership;
  // }

}
