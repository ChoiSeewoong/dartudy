import 'package:shared_preferences/shared_preferences.dart';

class CodeStorageService {
  Future<void> saveCode(int exerciseId, String code) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('code_$exerciseId', code);
  }

  Future<String?> loadCode(int exerciseId) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('code_$exerciseId');
  }

  Future<void> saveCompletion(int exerciseId, bool isCompleted) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('completed_$exerciseId', isCompleted);
  }

  Future<bool> loadCompletion(int exerciseId) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('completed_$exerciseId') ?? false;
  }
}
