import 'package:flutter/material.dart';

class DartPadEmbed extends StatefulWidget {
  const DartPadEmbed({super.key});

  @override
  State<DartPadEmbed> createState() => _DartPadEmbedState();
}

class _DartPadEmbedState extends State<DartPadEmbed> {
  bool _showExplanation = false;
  String _userCode = '';
  String _resultMessage = '';

  // 예시 문제
  final String _questionTitle = "Q1. 변수 선언";
  final String _questionContent = "Dart에서 정수형 변수 `age`를 선언하고, 20으로 초기화하세요.";
  final String _correctAnswer = "int age = 20;";

  // 해설
  final String _explanation =
      "Dart에서는 int를 사용하여 정수형 변수를 선언할 수 있습니다:\n\n```dart\nint age = 20;\n```";

  void _checkAnswer() {
    final normalizedUserCode = _userCode.trim().replaceAll(RegExp(r'\s+'), '');
    final normalizedCorrect = _correctAnswer.trim().replaceAll(
      RegExp(r'\s+'),
      '',
    );

    if (normalizedUserCode == normalizedCorrect) {
      setState(() {
        _resultMessage = "✅ 정답입니다!";
      });
    } else {
      setState(() {
        _resultMessage = "❌ 오답입니다. 다시 한 번 확인해보세요.";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              _questionTitle,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(_questionContent, style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 16),

            // 사용자가 코드 작성하는 입력창
            TextField(
              onChanged: (value) {
                _userCode = value;
              },
              maxLines: 4,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: '여기에 Dart 코드를 작성하세요...',
              ),
            ),
            const SizedBox(height: 12),

            // 채점 버튼
            ElevatedButton.icon(
              icon: const Icon(Icons.check),
              label: const Text("정답 채점하기"),
              onPressed: _checkAnswer,
            ),

            // 채점 결과 출력
            if (_resultMessage.isNotEmpty) ...[
              const SizedBox(height: 8),
              Text(
                _resultMessage,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color:
                      _resultMessage.contains("✅") ? Colors.green : Colors.red,
                ),
              ),
            ],

            const SizedBox(height: 16),
            TextButton.icon(
              icon: Icon(
                _showExplanation ? Icons.visibility_off : Icons.visibility,
              ),
              label: Text(_showExplanation ? "해설 숨기기" : "해설 보기"),
              onPressed: () {
                setState(() {
                  _showExplanation = !_showExplanation;
                });
              },
            ),
            if (_showExplanation)
              Container(
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.only(top: 8),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Text(
                  _explanation,
                  style: const TextStyle(fontSize: 14, fontFamily: 'monospace'),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
