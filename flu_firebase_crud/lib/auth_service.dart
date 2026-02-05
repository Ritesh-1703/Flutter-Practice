import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'user_service.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  // ✅ Register with Email/Password
  Future<void> registerWithEmailAndPassword(
      String email,
      String password, {
        required String name,
        required String phone,
        required String dob,
        required String gender,
      }) async {
    final cred = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    await UserService().createOrUpdateUserProfile(
      uid: cred.user!.uid,
      name: name,
      email: email,
      phone: phone,
      dob: dob,
      gender: gender,
      photoUrl: '',
    );
  }

  // ✅ Login with Email/Password
  Future<void> loginWithEmailAndPassword(String email, String password) async {
    final cred = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    // await UserService().createOrUpdateUserProfile(
    //   uid: cred.user!.uid,
    //   name: cred.user!.displayName ?? '',
    //   email: cred.user!.email ?? '',
    //   phone: cred.user!.phoneNumber ?? '',
    //   dob: '',
    //   gender: '',
    //   photoUrl: cred.user!.photoURL ?? '',
    // );
  }

  // ✅ Google Sign-In
  Future<void> signInWithGoogle() async {
    final googleUser = await _googleSignIn.signIn();
    if (googleUser == null) return;

    final googleAuth = await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final cred = await _auth.signInWithCredential(credential);
    final uid = cred.user!.uid;

    final doc = await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .get();

    if(!doc.exists) {
      await UserService().createOrUpdateUserProfile(
        uid: cred.user!.uid,
        name: cred.user!.displayName ?? '',
        email: cred.user!.email ?? '',
        phone: cred.user!.phoneNumber ?? '',
        dob: '',
        gender: '',
        photoUrl: cred.user!.photoURL ?? '',
      );
    }
  }

  // ✅ Logout
  Future<void> logout() async {
    await _googleSignIn.signOut();
    await _auth.signOut();
  }
}
