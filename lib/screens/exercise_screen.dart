import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/exercise.dart';
import '../services/code_storage_service.dart';
import 'package:url_launcher/url_launcher.dart';

class ExerciseScreen extends StatefulWidget {
  final Exercise exercise;
  const ExerciseScreen({super.key, required this.exercise});

  @override
  State<ExerciseScreen> createState() => _ExerciseScreenState();
}

class _ExerciseScreenState extends State<ExerciseScreen> {
  final _controller = TextEditingController();
  final _storageService = CodeStorageService();
  bool _isCompleted = false;

  @override
  void initState() {
    super.initState();
    _loadSavedData();
  }

  Future<void> _loadSavedData() async {
    final saved = await _storageService.loadCode(widget.exercise.id);
    final completed = await _storageService.loadCompletion(widget.exercise.id);
    setState(() {
      if (saved != null) _controller.text = saved;
      _isCompleted = completed;
    });
  }

  Future<void> _saveCode() async {
    await _storageService.saveCode(widget.exercise.id, _controller.text);
    if (!mounted) return;
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text("코드가 저장되었습니다!")));
  }

  Future<void> _toggleCompleted(bool? value) async {
    setState(() {
      _isCompleted = value ?? false;
    });
    await _storageService.saveCompletion(widget.exercise.id, _isCompleted);
  }

  void _openInDartPad(String code) {
    final encoded = Uri.encodeComponent(code);
    final dartPadUrl =
        'https://dartpad.dev/?null_safety=true&run=true&code=$encoded';
    launchUrl(Uri.parse(dartPadUrl), mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(widget.exercise.title),
            const SizedBox(width: 8),
            if (_isCompleted)
              const Icon(Icons.check_circle, color: Colors.green, size: 20),
          ],
        ),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 800),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.exercise.description),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Checkbox(value: _isCompleted, onChanged: _toggleCompleted),
                    const Text('이 문제를 완료했어요'),
                  ],
                ),
                const SizedBox(height: 12),
                Expanded(
                  child: TextField(
                    controller: _controller,
                    maxLines: null,
                    expands: true,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '당신의 풀이를 여기에 작성하세요',
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: _saveCode,
                        child: const Text('💾 코드 저장'),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => _openInDartPad(_controller.text),
                        child: const Text('🚀 DartPad에서 실행'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
