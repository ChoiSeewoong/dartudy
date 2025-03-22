import 'dart:convert';
import 'package:http/http.dart' as http;

Future<String> gradeWithAI(String userCode, String correctCode) async {
  const apiKey = 'YOUR_OPENAI_API_KEY'; // ⚠️ 실제 배포 시 보안 주의
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
$correctCode

제출 코드:
$userCode

이 코드는 정답인가요? "정답" 또는 "오답" 중 하나로만 답하세요.
''',
    },
  ];

  final body = jsonEncode({
    "model": "gpt-3.5-turbo",
    "messages": messages,
    "temperature": 0,
  });

  final response = await http.post(
    Uri.parse(endpoint),
    headers: {
      "Authorization": "Bearer $apiKey",
      "Content-Type": "application/json",
    },
    body: body,
  );

  if (response.statusCode == 200) {
    final result = jsonDecode(response.body);
    final content =
        result['choices'][0]['message']['content'].toString().trim();
    return content;
  } else {
    throw Exception('AI 채점 실패: ${response.body}');
  }
}
