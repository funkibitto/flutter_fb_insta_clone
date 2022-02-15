import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_fb_insta_clone/app/data/models/user.dart' as model;
import 'package:flutter_fb_insta_clone/app/services/storage_service.dart';
import 'package:get/get.dart';

class AuthService extends GetxService {
  static AuthService get to => Get.find();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  late Rx<User?> _firebaseUser;
  Rxn<model.User> user = Rxn<model.User>();

  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  String usersCollection = "users";
  bool get isLoggedIn => _firebaseUser.value == null ? false : true;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    _firebaseUser = Rx<User?>(_auth.currentUser);
    _firebaseUser.bindStream(_auth.userChanges());
    print('_auth ${_auth.currentUser}');
    ever(_firebaseUser, _setInitialScreen);
  }

  // firebase user state check
  _setInitialScreen(User? user) {
    print('99999_auth ${_auth.currentUser}');
    // route change
    if (user == null) {
      Get.offAllNamed('/login');
    } else {
      Get.offAllNamed('/root');
    }
  }

  // firebase user initalize
  initializeUser() async {
    User currentUser = _auth.currentUser!;
    DocumentSnapshot documentSnapshot =
        await _firebaseFirestore.collection('users').doc(currentUser.uid).get();

    return model.User.fromSnap(documentSnapshot);
  }

  Future<String> signUpUser({
    required String email,
    required String password,
    required String username,
    required String bio,
    Uint8List? file,
  }) async {
    String res = "Some error Occurred";
    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          username.isNotEmpty ||
          bio.isNotEmpty) {
        // registering user in auth with email and password
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        String? photoUrl;
        if (file != null) {
          photoUrl = await StorageService.to
              .uploadImageToStorage('profilePics', file, false);
        }

        model.User _user = model.User(
          username: username,
          uid: cred.user!.uid,
          photoUrl: photoUrl,
          email: email,
          bio: bio,
          followers: [],
          following: [],
        );

        // adding user in our database
        await _firestore
            .collection("users")
            .doc(cred.user!.uid)
            .set(_user.toJson());

        res = "success";
      } else {
        res = "Please enter all the fields";
      }
    } catch (err) {
      return err.toString();
    }
    return res;
  }
}
