import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreService {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  Future<void> saveSubmission({
    required int problemId,
    required String userCode,
    required String result,
  }) async {
    final uid = _auth.currentUser?.uid;
    if (uid == null) return;

    final docRef = _firestore
        .collection('users')
        .doc(uid)
        .collection('submissions')
        .doc('problem_$problemId');

    await docRef.set({
      'code': userCode,
      'result': result,
      'timestamp': FieldValue.serverTimestamp(),
    });
  }

  Future<Map<String, dynamic>?> loadSubmission(int problemId) async {
    final uid = _auth.currentUser?.uid;
    if (uid == null) return null;

    final doc =
        await _firestore
            .collection('users')
            .doc(uid)
            .collection('submissions')
            .doc('problem_$problemId')
            .get();
    return doc.exists ? doc.data() : null;
  }
}
