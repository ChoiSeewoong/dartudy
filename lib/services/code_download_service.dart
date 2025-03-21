import 'dart:convert';
import 'dart:html' as html;
import '../models/exercise.dart';
import '../services/code_storage_service.dart';

class CodeDownloadService {
  final CodeStorageService _storageService = CodeStorageService();

  Future<void> exportUserCodesAsTxt(List<Exercise> exercises) async {
    final buffer = StringBuffer();

    for (final e in exercises) {
      final code = await _storageService.loadCode(e.id) ?? '';
      buffer.writeln('[Exercise ${e.id}] ${e.title}');
      buffer.writeln('-' * 40);
      buffer.writeln(code);
      buffer.writeln('-' * 40);
      buffer.writeln();
    }

    final content = buffer.toString();
    final blob = html.Blob([content], 'text/plain');
    final url = html.Url.createObjectUrlFromBlob(blob);
    final anchor =
        html.AnchorElement(href: url)
          ..setAttribute('download', 'dartudy_backup.txt')
          ..click();

    html.Url.revokeObjectUrl(url);
  }
}
