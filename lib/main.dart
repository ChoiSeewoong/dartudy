import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'firebase_options.dart'; // ✅ firebase_options.dart 필수
import 'screens/login_screen.dart';
import 'screens/admin_problem_editor.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform, // ✅ 여기에 옵션 삽입
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dartudy',
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData) {
            return const AIGraderScreen();
          } else {
            return const LoginScreen();
          }
        },
      ),
    );
  }
}

// ✅ Firestore 저장 서비스
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

    await _firestore
        .collection('users')
        .doc(uid)
        .collection('submissions')
        .doc('problem_$problemId')
        .set({
          'code': userCode,
          'result': result,
          'timestamp': FieldValue.serverTimestamp(),
        });
  }
}

// ✅ AI 채점 화면
class AIGraderScreen extends StatefulWidget {
  const AIGraderScreen({super.key});

  @override
  State<AIGraderScreen> createState() => _AIGraderScreenState();
}

class _AIGraderScreenState extends State<AIGraderScreen> {
  final _firestoreService = FirestoreService();
  final TextEditingController _controller = TextEditingController();

  final String _correctAnswer = "int age = 20;";
  final String _questionTitle = "Q1. 변수 선언";
  final String _questionContent = "Dart에서 정수형 변수 `age`를 선언하고, 20으로 초기화하세요.";

  String _resultMessage = '';
  bool _loading = false;

  Future<String> _gradeWithAI(String userCode) async {
    const apiKey = 'YOUR_OPENAI_API_KEY'; // 🔐 안전하게 보관하세요!
    const endpoint = 'https://api.openai.com/v1/chat/completions';

    final messages = [
      {
        "role": "system",
        "content":
            "너는 Dart 프로그래밍 과제를 채점하는 AI야. 사용자의 코드가 정답과 의미상 같다면 '정답'이라고만 말해.",
      },
      {
        "role": "user",
        "content": '''
정답 코드:
$_correctAnswer

제출 코드:
$userCode

이 코드는 정답인가요? "정답" 또는 "오답" 중 하나로만 답하세요.
''',
      },
    ];

    final response = await http.post(
      Uri.parse(endpoint),
      headers: {
        "Authorization": "Bearer $apiKey",
        "Content-Type": "application/json",
      },
      body: jsonEncode({
        "model": "gpt-3.5-turbo",
        "messages": messages,
        "temperature": 0,
      }),
    );

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      final content =
          result['choices'][0]['message']['content'].toString().trim();
      return content;
    } else {
      return '채점 실패 (코드: ${response.statusCode})';
    }
  }

  Future<void> _handleAIGrade() async {
    final userCode = _controller.text.trim();
    if (userCode.isEmpty) return;

    setState(() {
      _loading = true;
      _resultMessage = '';
    });

    final aiResult = await _gradeWithAI(userCode);

    final resultText =
        aiResult.contains("정답") ? "✅ AI 판별: 정답입니다!" : "❌ AI 판별: 오답입니다.";

    await _firestoreService.saveSubmission(
      problemId: 1,
      userCode: userCode,
      result: resultText,
    );

    setState(() {
      _resultMessage = resultText;
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final userEmail = FirebaseAuth.instance.currentUser?.email ?? '사용자';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dartudy - AI 채점'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit_document),
            tooltip: '문제 관리',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const AdminProblemEditor()),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: '로그아웃',
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("😀 안녕하세요, $userEmail님", style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 24),
            Text(
              _questionTitle,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(_questionContent, style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 16),
            TextField(
              controller: _controller,
              maxLines: 5,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: '여기에 Dart 코드를 입력하세요...',
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: _loading ? null : _handleAIGrade,
              icon: const Icon(Icons.smart_toy),
              label: Text(_loading ? "채점 중..." : "AI로 채점하기"),
            ),
            const SizedBox(height: 16),
            if (_resultMessage.isNotEmpty)
              Text(
                _resultMessage,
                style: TextStyle(
                  fontSize: 16,
                  color:
                      _resultMessage.contains("✅") ? Colors.green : Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
