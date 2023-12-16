import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mini_mansion/constant/functions.dart';
import 'package:mini_mansion/model/membership_model.dart';

class FirestoreHelper {
  Future<List<MembershipModel>> getHotels() async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await FirebaseFirestore.instance.collection('membership').get();
      List<MembershipModel> membershipList = querySnapshot.docs
          .map((e) => MembershipModel.fromJson(e.data()))
          .toList();

      return membershipList;
    } catch (e) {
      showMessage(e.toString());
    }
    return [];
  }
}
