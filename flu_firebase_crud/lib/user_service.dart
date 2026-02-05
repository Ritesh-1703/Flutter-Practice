import 'package:cloud_firestore/cloud_firestore.dart';

class UserService {
  final _users = FirebaseFirestore.instance.collection('users');

  Future<void> createOrUpdateUserProfile({
    required String uid,
    required String name,
    required String email,
    required String phone,
    required String dob,
    required String gender,
    required String photoUrl,
  }) async {
    await _users.doc(uid).set({
      'uid': uid,
      'name': name,
      'email': email,
      'phone': phone,
      'dob': dob,
      'gender': gender,
      'photoUrl': photoUrl,
      'updatedAt': FieldValue.serverTimestamp(),
    }, SetOptions(merge: true));
  }

  Stream<DocumentSnapshot<Map<String, dynamic>>> getUserProfile(String uid) {
    return _users.doc(uid).snapshots();
  }
}
