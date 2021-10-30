import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:seddi/helpers/show_loading.dart';
import 'package:seddi/models/user.dart';
import 'package:seddi/screens/authentication/auth_screen.dart';
import 'package:seddi/screens/home/home.dart';
import 'package:logger/logger.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  Rx<User> firebaseUser; //user. User is made observable by Rx
  FirebaseAuth auth = FirebaseAuth.instance; //authentication of user
  RxBool isLoggedIn = false.obs;
  Logger logger = Logger();

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  String usersCollection = 'users';

  Rx<UserModel> userModel = UserModel().obs;

  @override
  void onReady() {
    super.onReady();
    firebaseUser = Rx<User>(auth.currentUser); //instantiating the user

    //lets bind the firebase authentication with the firebase user.
    firebaseUser.bindStream(auth
        .userChanges()); // so if we log out, the firebase user is returned to null
    //if we sign in, firebaseUser = current user

    //set the ever event listener
    ever(firebaseUser, _setInitialScreen);
    //so when the firebaseUser changes, we call _setInitialScreen to show the relevant screen.
  }

  _setInitialScreen(User user) {
    if (user == null) {
      //null means there is no user signed in. So if no user is signed in, the user is null
      Get.offAll(() => AuthenticationScreen());
    } else {
      userModel.bindStream(listenToUser());
      Get.offAll(() => HomeScreen());
    }
  }

  void SignIn() async {
    try {
      showLoading();
      await auth
          .signInWithEmailAndPassword(
              email: email.text.trim(), password: password.text.trim())
          .then((result) {
        String _userId = result.user.uid;
        _clearControllers();
      });
    } catch (e) {
      debugPrint(e.toString());
      Get.snackbar('Sign In Failed', 'Try again');
    }
  }

  void SignUp() async {
    showLoading();
    try {
      await auth
          .createUserWithEmailAndPassword(
              email: email.text.trim(), password: password.text.trim())
          .then((result) {
        String _userId = result.user.uid;
        firebaseFirestore.collection(usersCollection).doc(_userId).set({
          'name': name.text.trim(),
          'id': _userId,
          'email': email.text.trim()
        });
        _clearControllers();
      });
    } catch (e) {
      debugPrint(e.toString());
      Get.snackbar('Success', 'Account created');
    }
  }

  void signOut() async {
    auth.signOut();
  }

  //creating the usermodel inside firebase
  //We are accessing the firebase document and converting the document snapshot into the userModel object

  // _initializeUserModel(String userId) async {
  //   userModel.value = await firebaseFirestore
  //       .collection(usersCollection)
  //       .doc(userId)
  //       .get()
  //       .then((doc) => UserModel.fromSnapshot(doc));
  // }

  _clearControllers() {
    name.clear();
    email.clear();
    password.clear();
  }

  updateUserData(Map<String, dynamic> data) {
    logger.i('UPDATE');
    firebaseFirestore
        .collection(usersCollection)
        .doc(firebaseUser.value.uid)
        .update(data);
  }

  Stream<UserModel> listenToUser() => firebaseFirestore
      .collection(usersCollection)
      .doc(firebaseUser.value.uid)
      .snapshots()
      .map((snapshot) => UserModel.fromSnapshot(snapshot));
}
