import 'dart:html' as html;
import '../models/exercise.dart';
import '../services/code_storage_service.dart';

class CodeRestoreService {
  final CodeStorageService _storageService = CodeStorageService();

  Future<void> importUserCodesFromTxt(List<Exercise> exercises) async {
    final input = html.FileUploadInputElement()..accept = '.txt';
    input.click();

    await input.onChange.first;
    final file = input.files?.first;
    if (file == null) return;

    final reader = html.FileReader();
    reader.readAsText(file);

    await reader.onLoad.first;
    final content = reader.result as String;

    final lines = content.split('\n');
    int? currentId;
    final buffer = StringBuffer();

    for (final line in lines) {
      final match = RegExp(r'^\[Exercise (\d+)\]').firstMatch(line);
      if (match != null) {
        if (currentId != null) {
          await _storageService.saveCode(currentId, buffer.toString().trim());
          buffer.clear();
        }
        currentId = int.tryParse(match.group(1)!);
      } else if (line.startsWith('---')) {
        // 무시
      } else {
        buffer.writeln(line);
      }
    }

    if (currentId != null && buffer.isNotEmpty) {
      await _storageService.saveCode(currentId, buffer.toString().trim());
    }
  }
}
