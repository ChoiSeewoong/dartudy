import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/exercise.dart';
import 'auth_service.dart';
import 'code_storage_service.dart';

class CodeSyncService {
  final _firestore = FirebaseFirestore.instance;
  final _authService = AuthService();
  final _localStorage = CodeStorageService();

  /// 업로드: 로컬에 저장된 코드 전체를 Firestore에 저장
  Future<void> uploadCodes(List<Exercise> exercises) async {
    final uid = _authService.currentUserId;
    if (uid == null) return;

    final batch = _firestore.batch();
    final userRef = _firestore.collection('users').doc(uid);

    for (final e in exercises) {
      final code = await _localStorage.loadCode(e.id) ?? '';
      final completed = await _localStorage.loadCompletion(e.id);

      batch.set(userRef.collection('codes').doc('code_${e.id}'), {
        'title': e.title,
        'code': code,
        'completed': completed,
        'timestamp': FieldValue.serverTimestamp(),
      });
    }

    await batch.commit();
  }

  /// 다운로드: Firestore에서 가져와 로컬에 저장
  Future<void> downloadCodes(List<Exercise> exercises) async {
    final uid = _authService.currentUserId;
    if (uid == null) return;

    final userRef = _firestore.collection('users').doc(uid);
    final snapshot = await userRef.collection('codes').get();

    for (final doc in snapshot.docs) {
      final idMatch = RegExp(r'code_(\d+)').firstMatch(doc.id);
      if (idMatch != null) {
        final id = int.parse(idMatch.group(1)!);
        final code = doc['code'] ?? '';
        final completed = doc['completed'] ?? false;
        await _localStorage.saveCode(id, code);
        await _localStorage.saveCompletion(id, completed);
      }
    }
  }
}
