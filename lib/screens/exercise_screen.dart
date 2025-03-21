import 'package:flutter/material.dart';
import '../models/exercise.dart';

class ExerciseScreen extends StatefulWidget {
  final Exercise exercise;
  const ExerciseScreen({super.key, required this.exercise});

  @override
  State<ExerciseScreen> createState() => _ExerciseScreenState();
}

class _ExerciseScreenState extends State<ExerciseScreen> {
  final TextEditingController _codeController = TextEditingController();
  bool _showSolution = false;

  @override
  Widget build(BuildContext context) {
    final ex = widget.exercise;
    return Scaffold(
      appBar: AppBar(title: Text(ex.title)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(ex.description, style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 16),
            const Text("✍️ 코드 작성:"),
            TextField(
              controller: _codeController,
              maxLines: 10,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "여기에 Dart 코드를 입력하세요",
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () => setState(() => _showSolution = true),
                  child: const Text("정답 보기"),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    // TODO: 다음 문제로 이동
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("다음 문제는 아직 준비 중이에요!")),
                    );
                  },
                  child: const Text("다음 문제"),
                ),
              ],
            ),
            const SizedBox(height: 20),
            if (_showSolution)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "✅ 정답 코드:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SelectableText(ex.solution),
                  const SizedBox(height: 10),
                  const Text(
                    "💡 해설:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SelectableText(ex.explanation),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
