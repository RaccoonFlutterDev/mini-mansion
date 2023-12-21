

import 'package:get/get.dart';
import 'package:mini_mansion/constant/variables.dart';
import 'package:mini_mansion/controller/firebase/firestore_helper.dart';
import 'package:mini_mansion/model/membership_model.dart';

class AppController extends GetxController {
  List<MembershipModel> _membershipList = [];
  List<MembershipModel> get getMembershipsList => _membershipList;
  List<MembershipModel> _favMemberships = [];
  List<MembershipModel> get getFavMemberships => _favMemberships;

  // final SharedPreferences prefs = await SharedPreferences.getInstance();
  final String favPropertiesKey = 'fav_properties';

  // @override
  // void onInit() {
  //   super.onInit();
  //   callBackFn();
  // }

  // //add membership
  Future<void> addedMembership(Map<String, dynamic> body) async {
    MembershipModel membershipModel =
        await FirebaseFirestoreHelper().addMembership(body);
    _membershipList.add(membershipModel);
    update();
  }

  Future<void> addFavouriteMembership(MembershipModel membershipModel) async {
    _favMemberships.add(membershipModel);
    _saveFavProperties();
    update();
  }

  Future<void> removeFavouriteMembership(
      MembershipModel membershipModel) async {
    _favMemberships.remove(membershipModel);
    _saveFavProperties();
    update();
  }

  Future<void> _saveFavProperties() async {
    final List<String> favPropertiesIds =
        _favMemberships.map((model) => model.membershipId).toList();
    await prefs!.setStringList(favPropertiesKey, favPropertiesIds);
  }

  Future<void> _loadFavProperties() async {
    final List<String>? favPropertiesIds =
        prefs!.getStringList(favPropertiesKey);
    if (favPropertiesIds != null) {
      _favMemberships = _membershipList
          .where((model) => favPropertiesIds.contains(model.membershipId))
          .toList();
    }
  }

  Future<void> getMembershipList() async {
    _membershipList = await FirebaseFirestoreHelper().getHotels();
    await _loadFavProperties();
    update();
  }

  Future<void> callBackFn() async {
    await getMembershipList();
  }
}
