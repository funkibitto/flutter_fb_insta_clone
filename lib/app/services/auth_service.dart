import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_fb_insta_clone/app/data/models/user.dart' as model;
import 'package:get/get.dart';

class AuthService extends GetxService {
  static AuthService get to => Get.find();

  final Rxn<User?> _firebaseUser = Rxn<User>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Rxn<model.User> user = Rxn<model.User>();

  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  String usersCollection = "users";
  bool get isLoggedIn => _firebaseUser.value == null ? false : true;

  @override
  void onInit() {
    super.onInit();
    print('AuthService onInit');
    _firebaseUser.value = _auth.currentUser;
    _firebaseUser.bindStream(_auth.userChanges());
  }

  @override
  void onReady() {
    super.onReady();
    print('AuthService onReady');
    // ever(_firebaseUser, _onChangeUser);
  }

  // firebase user state check
  _onChangeUser(User? user) {
    // route change
    if (user == null) {
    } else {}
  }

  // firebase user initalize
  initializeUser() async {
    User currentUser = _auth.currentUser!;
    DocumentSnapshot documentSnapshot =
        await _firebaseFirestore.collection('users').doc(currentUser.uid).get();

    return model.User.fromSnap(documentSnapshot);
  }
}
