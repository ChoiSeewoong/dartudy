// 📘 Dartudy - 100 Dart 연습 문제
// 복사 & 붙여넣기 바로 가능하도록 구성
// 각 문제는 Exercise(id, title, description, solution, explanation)

import '../models/exercise.dart';

final List<Exercise> exercises = [
  Exercise(
    id: 1,
    title: 'Exercise 1: 나이 계산기',
    description: "사용자의 이름과 나이를 입력받아 100살까지 몇 년이 남았는지 출력하는 프로그램을 작성하세요.",
    solution: '''
import 'dart:io';

void main() {    
    stdout.write("What's your name? ");
    String name = stdin.readLineSync();

    print("Hi, \$name! What is your age?");
    int age = int.parse(stdin.readLineSync());

    int yearsToHundred = 100 - age;
    print("\$name, You have \$yearsToHundred years to be 100");
}
''',
    explanation: '''
💡 Dart 문법 설명:
- stdout.write(): 사용자 입력 메시지 출력
- stdin.readLineSync(): 사용자 입력 받기
- int.parse(): 문자열을 숫자로 변환
- \$변수: 문자열 보간(interpolation)
''',
  ),
  Exercise(
    id: 2,
    title: 'Exercise 2: 짝수 또는 홀수 판별',
    description: "사용자에게 숫자를 입력받고, 해당 숫자가 짝수인지 홀수인지 출력하는 프로그램을 작성하세요.",
    solution: '''
import 'dart:io';

void main() {
  stdout.write("숫자를 입력하세요: ");
  int number = int.parse(stdin.readLineSync()!);

  if (number % 2 == 0) {
    print("짝수입니다.");
  } else {
    print("홀수입니다.");
  }
}
''',
    explanation: '''
💡 Dart 문법 설명:
- int.parse(): 문자열을 정수로 변환
- % 연산자: 나머지 연산
- if / else: 조건 분기 처리
''',
  ),
  Exercise(
    id: 3,
    title: 'Exercise 3: 리스트에서 5보다 작은 수 출력',
    description:
        "리스트 a = [1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89]에서 5보다 작은 수만 출력하는 프로그램을 작성하세요.",
    solution: '''
void main() {
  List<int> a = [1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89];

  for (var i in a) {
    if (i < 5) {
      print(i);
    }
  }
}
''',
    explanation: '''
💡 Dart 문법 설명:
- for (var i in list): 리스트의 요소를 하나씩 꺼냄
- if (조건): 조건에 맞는 값만 필터링 가능
''',
  ),
  Exercise(
    id: 4,
    title: 'Exercise 4: 약수 구하기',
    description: "사용자에게 숫자를 입력받아 해당 숫자의 모든 약수를 출력하는 프로그램을 작성하세요.",
    solution: '''
import 'dart:io';

void main() {
  stdout.write("숫자를 입력하세요: ");
  int number = int.parse(stdin.readLineSync()!);

  for (var i = 1; i <= number; i++) {
    if (number % i == 0) {
      print(i);
    }
  }
}
''',
    explanation: '''
💡 Dart 문법 설명:
- % 연산자: 나머지 확인
- for 반복문: 특정 범위의 숫자를 순회 가능
''',
  ),
  Exercise(
    id: 5,
    title: 'Exercise 5: 두 리스트의 공통 항목 찾기',
    description: "두 리스트의 공통 요소만 뽑아서 새로운 리스트로 만드는 프로그램을 작성하세요.",
    solution: '''
void main() {
  List<int> a = [1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89];
  List<int> b = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13];

  Set<int> c = Set.from(a).intersection(Set.from(b));
  print(c.toList());
}
''',
    explanation: '''
💡 Dart 문법 설명:
- Set: 중복 제거된 집합 자료형
- intersection(): 두 Set의 교집합 반환
''',
  ),
  Exercise(
    id: 6,
    title: 'Exercise 6: 회문 판별',
    description: "사용자에게 문자열을 입력받아 회문인지 여부를 출력하는 프로그램을 작성하세요.",
    solution: '''
import 'dart:io';

void main() {
  stdout.write("단어를 입력하세요: ");
  String input = stdin.readLineSync()!.toLowerCase();

  String reversed = input.split('').reversed.join('');

  if (input == reversed) {
    print("회문입니다.");
  } else {
    print("회문이 아닙니다.");
  }
}
''',
    explanation: '''
💡 Dart 문법 설명:
- split('').reversed.join(): 문자열을 뒤집음
- toLowerCase(): 대소문자 무시
- if 비교문: 두 문자열 비교
''',
  ),
  Exercise(
    id: 7,
    title: 'Exercise 7: 짝수 인덱스의 값만 추출',
    description: "리스트의 짝수 인덱스에 있는 값만 출력하는 프로그램을 작성하세요.",
    solution: '''
void main() {
  List<int> a = [1, 4, 9, 16, 25, 36, 49, 64, 81, 100];

  for (int i = 0; i < a.length; i++) {
    if (i % 2 == 0) {
      print(a[i]);
    }
  }
}
''',
    explanation: '''
💡 Dart 문법 설명:
- i % 2 == 0: 짝수 인덱스 판별
- for 루프: 인덱스 기반 반복
''',
  ),
  Exercise(
    id: 8,
    title: 'Exercise 8: 가위바위보 (컴퓨터 vs 사용자)',
    description: "사용자 입력을 받아 컴퓨터와 가위바위보 게임을 하는 프로그램을 작성하세요.",
    solution: '''
import 'dart:io';
import 'dart:math';

void main() {
  final options = ['rock', 'paper', 'scissors'];
  final random = Random();
  final computer = options[random.nextInt(3)];

  stdout.write("rock, paper, scissors 중 하나를 입력하세요: ");
  String user = stdin.readLineSync()!.toLowerCase();

  if (user == computer) {
    print("비겼습니다.");
  } else if ((user == 'rock' && computer == 'scissors') ||
             (user == 'scissors' && computer == 'paper') ||
             (user == 'paper' && computer == 'rock')) {
    print("이겼습니다!");
  } else {
    print("졌습니다. 컴퓨터는 \$computer 였습니다.");
  }
}
''',
    explanation: '''
💡 Dart 문법 설명:
- Random().nextInt(n): 0부터 n-1 사이 숫자 생성
- List<String>: 문자열 리스트로 선택지 구성
''',
  ),
  Exercise(
    id: 9,
    title: 'Exercise 9: 숫자 맞추기 게임',
    description: "컴퓨터가 1~100 사이의 숫자를 선택하고, 사용자가 맞출 때까지 계속 입력하는 프로그램을 작성하세요.",
    solution: '''
import 'dart:io';
import 'dart:math';

void main() {
  final answer = Random().nextInt(100) + 1;
  int guess;
  int tries = 0;

  do {
    stdout.write("1~100 사이의 숫자를 입력하세요: ");
    guess = int.parse(stdin.readLineSync()!);
    tries++;

    if (guess < answer) {
      print("너무 작습니다.");
    } else if (guess > answer) {
      print("너무 큽니다.");
    } else {
      print("정답입니다! 시도 횟수: \$tries");
    }
  } while (guess != answer);
}
''',
    explanation: '''
💡 Dart 문법 설명:
- do-while 반복문: 최소 1회 실행됨
- Random().nextInt(100) + 1: 1~100 랜덤 숫자 생성
''',
  ),
  Exercise(
    id: 10,
    title: 'Exercise 10: 소수 판별',
    description: "사용자가 입력한 숫자가 소수인지 판별하는 프로그램을 작성하세요.",
    solution: '''
import 'dart:io';

void main() {
  stdout.write("숫자를 입력하세요: ");
  int num = int.parse(stdin.readLineSync()!);

  bool isPrime = true;

  if (num <= 1) {
    isPrime = false;
  } else {
    for (int i = 2; i <= num ~/ 2; i++) {
      if (num % i == 0) {
        isPrime = false;
        break;
      }
    }
  }

  if (isPrime) {
    print("소수입니다.");
  } else {
    print("소수가 아닙니다.");
  }
}
''',
    explanation: '''
💡 Dart 문법 설명:
- ~/ 연산자: 정수 나눗셈
- 소수: 1과 자기 자신만 약수로 가짐
''',
  ),

  // 📘 Dartudy - 100 Dart 연습 문제
  // 복사 & 붙여넣기 바로 가능하도록 구성
  // 각 문제는 Exercise(id, title, description, solution, explanation)
  Exercise(
    id: 11,
    title: 'Exercise 11: 두 수 비교하기',
    description: '두 개의 정수를 입력받아 더 큰 수를 출력하는 프로그램을 작성하세요.',
    solution: '''
import 'dart:io';

void main() {
  stdout.write("첫 번째 숫자를 입력하세요: ");
  int a = int.parse(stdin.readLineSync()!);
  stdout.write("두 번째 숫자를 입력하세요: ");
  int b = int.parse(stdin.readLineSync()!);

  if (a > b) {
    print("더 큰 수는 \$a 입니다.");
  } else if (a < b) {
    print("더 큰 수는 \$b 입니다.");
  } else {
    print("두 수는 같습니다.");
  }
}
''',
    explanation: '''
💡 Dart 문법 설명:
- if / else if / else: 여러 조건 비교
- stdin.readLineSync(): 입력받은 문자열을 정수로 변환
''',
  ),
  Exercise(
    id: 12,
    title: 'Exercise 12: 구구단 출력',
    description: '사용자가 입력한 숫자의 구구단을 출력하는 프로그램을 작성하세요.',
    solution: '''
import 'dart:io';

void main() {
  stdout.write("몇 단을 출력할까요? ");
  int dan = int.parse(stdin.readLineSync()!);

  for (int i = 1; i <= 9; i++) {
    print("\$dan x \$i = \${dan * i}");
  }
}
''',
    explanation: '''
💡 Dart 문법 설명:
- for 반복문: 1~9까지 곱셈
- 문자열 보간: \${표현식} 형태로 계산 결과 삽입
''',
  ),
  Exercise(
    id: 13,
    title: 'Exercise 13: 평균 계산기',
    description: '리스트에 저장된 정수들의 평균을 구하는 프로그램을 작성하세요.',
    solution: '''
void main() {
  List<int> scores = [80, 90, 100, 70, 60];
  int sum = 0;

  for (int score in scores) {
    sum += score;
  }

  double avg = sum / scores.length;
  print("평균 점수: \$avg");
}
''',
    explanation: '''
💡 Dart 문법 설명:
- 리스트 순회: for (var in list)
- 평균: 합계 / 개수
''',
  ),
  Exercise(
    id: 14,
    title: 'Exercise 14: 문자열 뒤집기',
    description: '사용자가 입력한 문자열을 뒤집어 출력하는 프로그램을 작성하세요.',
    solution: '''
import 'dart:io';

void main() {
  stdout.write("문자열을 입력하세요: ");
  String input = stdin.readLineSync()!;

  String reversed = input.split('').reversed.join();
  print("뒤집은 문자열: \$reversed");
}
''',
    explanation: '''
💡 Dart 문법 설명:
- split(''): 문자 단위 분리
- reversed: 리스트 뒤집기
- join(): 문자열로 다시 합치기
''',
  ),
  Exercise(
    id: 15,
    title: 'Exercise 15: 리스트의 최대값 구하기',
    description: '리스트에서 가장 큰 값을 찾는 프로그램을 작성하세요.',
    solution: '''
void main() {
  List<int> numbers = [10, 25, 7, 99, 56];
  int max = numbers[0];

  for (int num in numbers) {
    if (num > max) {
      max = num;
    }
  }
  print("가장 큰 수는 \$max 입니다.");
}
''',
    explanation: '''
💡 Dart 문법 설명:
- 리스트의 첫 번째 값을 초기값으로 설정
- 모든 요소를 반복하며 비교
''',
  ),
  Exercise(
    id: 16,
    title: 'Exercise 16: 팩토리얼 계산',
    description: '사용자가 입력한 숫자의 팩토리얼을 계산하는 프로그램을 작성하세요.',
    solution: '''
import 'dart:io';

void main() {
  stdout.write("정수를 입력하세요: ");
  int n = int.parse(stdin.readLineSync()!);
  int result = 1;

  for (int i = 1; i <= n; i++) {
    result *= i;
  }
  print("\$n! = \$result");
}
''',
    explanation: '''
💡 Dart 문법 설명:
- 누적 곱셈: result *= i
- 반복문으로 1부터 n까지 곱하기
''',
  ),
  Exercise(
    id: 17,
    title: 'Exercise 17: 알파벳 수 세기',
    description: '사용자가 입력한 문자열에서 알파벳의 개수를 세는 프로그램을 작성하세요.',
    solution: '''
import 'dart:io';

void main() {
  stdout.write("문장을 입력하세요: ");
  String input = stdin.readLineSync()!;

  int count = 0;
  for (int i = 0; i < input.length; i++) {
    if (RegExp(r'[a-zA-Z]').hasMatch(input[i])) {
      count++;
    }
  }
  print("알파벳 개수: \$count");
}
''',
    explanation: '''
💡 Dart 문법 설명:
- 정규식(RegExp): 알파벳 판별
- hasMatch(): 패턴 일치 여부 확인
''',
  ),
  Exercise(
    id: 18,
    title: 'Exercise 18: 공백 제거',
    description: '사용자가 입력한 문자열에서 모든 공백을 제거하는 프로그램을 작성하세요.',
    solution: '''
import 'dart:io';

void main() {
  stdout.write("문장을 입력하세요: ");
  String input = stdin.readLineSync()!;

  String result = input.replaceAll(' ', '');
  print("공백 제거 결과: \$result");
}
''',
    explanation: '''
💡 Dart 문법 설명:
- replaceAll(' ', ''): 모든 공백을 빈 문자열로 대체
''',
  ),
  Exercise(
    id: 19,
    title: 'Exercise 19: 짝수만 더하기',
    description: '리스트에서 짝수만 더한 결과를 출력하는 프로그램을 작성하세요.',
    solution: '''
void main() {
  List<int> numbers = [2, 5, 8, 11, 14, 17];
  int sum = 0;

  for (int num in numbers) {
    if (num % 2 == 0) {
      sum += num;
    }
  }
  print("짝수의 합: \$sum");
}
''',
    explanation: '''
💡 Dart 문법 설명:
- % 2 == 0: 짝수 판별
- += 연산자: 누적 더하기
''',
  ),
  Exercise(
    id: 20,
    title: 'Exercise 20: 문자열 길이 출력',
    description: '사용자가 입력한 문자열의 길이를 출력하는 프로그램을 작성하세요.',
    solution: '''
import 'dart:io';

void main() {
  stdout.write("문자열을 입력하세요: ");
  String input = stdin.readLineSync()!;

  print("문자열 길이: \${input.length}");
}
''',
    explanation: '''
💡 Dart 문법 설명:
- .length: 문자열의 길이를 반환
''',
  ),

  // 📘 Dartudy - 100 Dart 연습 문제
  // 복사 & 붙여넣기 바로 가능하도록 구성
  // 각 문제는 Exercise(id, title, description, solution, explanation)
  Exercise(
    id: 21,
    title: 'Exercise 21: 구간 내 짝수 출력',
    description: '사용자로부터 두 숫자를 입력받아 그 사이의 짝수를 모두 출력하는 프로그램을 작성하세요.',
    solution: '''
import 'dart:io';

void main() {
  stdout.write("시작 숫자: ");
  int start = int.parse(stdin.readLineSync()!);
  stdout.write("끝 숫자: ");
  int end = int.parse(stdin.readLineSync()!);

  for (int i = start; i <= end; i++) {
    if (i % 2 == 0) {
      print(i);
    }
  }
}
''',
    explanation: '''
💡 Dart 문법 설명:
- 사용자 입력 두 개를 받아 시작과 끝 구간을 정함
- for 문으로 순회하며 짝수만 출력
''',
  ),
  Exercise(
    id: 22,
    title: 'Exercise 22: 알파벳 대소문자 구분',
    description: '사용자가 입력한 문장에서 대문자와 소문자의 개수를 각각 세는 프로그램을 작성하세요.',
    solution: '''
import 'dart:io';

void main() {
  stdout.write("문장을 입력하세요: ");
  String input = stdin.readLineSync()!;
  int upper = 0;
  int lower = 0;

  for (int i = 0; i < input.length; i++) {
    if (RegExp(r'[A-Z]').hasMatch(input[i])) {
      upper++;
    } else if (RegExp(r'[a-z]').hasMatch(input[i])) {
      lower++;
    }
  }

  print("대문자 수: \$upper");
  print("소문자 수: \$lower");
}
''',
    explanation: '''
💡 Dart 문법 설명:
- 정규식 A-Z, a-z를 활용해 대소문자 구분
- .hasMatch(): 해당 문자와 정규식이 일치하는지 확인
''',
  ),
  Exercise(
    id: 23,
    title: 'Exercise 23: 문자열 거꾸로 출력',
    description: '사용자가 입력한 문자열을 한 글자씩 줄 바꿔 거꾸로 출력하는 프로그램을 작성하세요.',
    solution: '''
import 'dart:io';

void main() {
  stdout.write("문자열 입력: ");
  String input = stdin.readLineSync()!;

  for (int i = input.length - 1; i >= 0; i--) {
    print(input[i]);
  }
}
''',
    explanation: '''
💡 Dart 문법 설명:
- 문자열의 마지막 인덱스부터 반복하면서 출력
''',
  ),
  Exercise(
    id: 24,
    title: 'Exercise 24: 리스트 역순 출력',
    description: '숫자 리스트를 거꾸로 출력하는 프로그램을 작성하세요.',
    solution: '''
void main() {
  List<int> numbers = [10, 20, 30, 40, 50];

  for (int i = numbers.length - 1; i >= 0; i--) {
    print(numbers[i]);
  }
}
''',
    explanation: '''
💡 Dart 문법 설명:
- 리스트의 인덱스를 역순으로 순회하기
''',
  ),
  Exercise(
    id: 25,
    title: 'Exercise 25: 리스트의 짝수 요소 개수',
    description: '리스트에서 짝수 요소의 개수를 세는 프로그램을 작성하세요.',
    solution: '''
void main() {
  List<int> numbers = [2, 3, 6, 8, 9, 10, 13];
  int count = 0;

  for (var n in numbers) {
    if (n % 2 == 0) count++;
  }

  print("짝수 개수: \$count");
}
''',
    explanation: '''
💡 Dart 문법 설명:
- 짝수 조건: num % 2 == 0
- 조건문 안에서 count 증가
''',
  ),
  Exercise(
    id: 26,
    title: 'Exercise 26: 숫자들의 합 구하기',
    description: '사용자가 입력한 숫자들을 모두 더한 값을 출력하는 프로그램을 작성하세요.',
    solution: '''
import 'dart:io';

void main() {
  stdout.write("숫자들을 공백으로 구분하여 입력하세요: ");
  String input = stdin.readLineSync()!;

  List<String> parts = input.split(' ');
  int sum = 0;

  for (var part in parts) {
    sum += int.parse(part);
  }

  print("총합: \$sum");
}
''',
    explanation: '''
💡 Dart 문법 설명:
- split(' '): 공백 기준 나누기
- int.parse(): 문자열 → 숫자 변환 후 합계
''',
  ),
  Exercise(
    id: 27,
    title: 'Exercise 27: 문자열 안에 단어 찾기',
    description: '사용자가 입력한 문장에 특정 단어가 포함되어 있는지 확인하는 프로그램을 작성하세요.',
    solution: '''
import 'dart:io';

void main() {
  stdout.write("문장 입력: ");
  String sentence = stdin.readLineSync()!;
  stdout.write("찾을 단어 입력: ");
  String word = stdin.readLineSync()!;

  if (sentence.contains(word)) {
    print("단어가 포함되어 있습니다.");
  } else {
    print("단어가 포함되어 있지 않습니다.");
  }
}
''',
    explanation: '''
💡 Dart 문법 설명:
- .contains(): 문자열 안에 특정 단어가 포함되어 있는지 여부 확인
''',
  ),
  Exercise(
    id: 28,
    title: 'Exercise 28: 리스트 요소 제곱',
    description: '리스트 안의 모든 숫자를 제곱하여 출력하는 프로그램을 작성하세요.',
    solution: '''
void main() {
  List<int> numbers = [1, 2, 3, 4, 5];

  for (var n in numbers) {
    print(n * n);
  }
}
''',
    explanation: '''
💡 Dart 문법 설명:
- 리스트 요소 접근 후 제곱 계산
''',
  ),
  Exercise(
    id: 29,
    title: 'Exercise 29: 문자열에 있는 숫자만 출력',
    description: '입력한 문자열에서 숫자만 추출하여 출력하는 프로그램을 작성하세요.',
    solution: '''
import 'dart:io';

void main() {
  stdout.write("문자열 입력: ");
  String input = stdin.readLineSync()!;

  String result = input.replaceAll(RegExp(r'[^0-9]'), '');
  print("숫자만 출력: \$result");
}
''',
    explanation: '''
💡 Dart 문법 설명:
- 정규식 사용: 숫자가 아닌 문자 제거
''',
  ),
  Exercise(
    id: 30,
    title: 'Exercise 30: 리스트에서 특정 값 제거',
    description: '리스트에서 사용자가 입력한 숫자를 제거하는 프로그램을 작성하세요.',
    solution: '''
import 'dart:io';

void main() {
  List<int> numbers = [1, 2, 3, 4, 5, 3, 6];
  stdout.write("제거할 숫자 입력: ");
  int target = int.parse(stdin.readLineSync()!);

  numbers.removeWhere((n) => n == target);
  print("결과 리스트: \$numbers");
}
''',
    explanation: '''
💡 Dart 문법 설명:
- removeWhere(): 조건에 맞는 항목 삭제
''',
  ),

  // 📘 Dartudy - 100 Dart 연습 문제
  // 복사 & 붙여넣기 바로 가능하도록 구성
  // 각 문제는 Exercise(id, title, description, solution, explanation)
  Exercise(
    id: 31,
    title: 'Exercise 31: 문자열 중복 제거',
    description: '사용자가 입력한 문자열에서 중복된 문자를 제거하는 프로그램을 작성하세요.',
    solution: '''
import 'dart:io';

void main() {
  stdout.write("문자열 입력: ");
  String input = stdin.readLineSync()!;
  String result = '';

  for (int i = 0; i < input.length; i++) {
    if (!result.contains(input[i])) {
      result += input[i];
    }
  }

  print("중복 제거 결과: \$result");
}
''',
    explanation: '''
💡 Dart 문법 설명:
- 문자열에 문자를 하나씩 추가하며 중복 체크
- .contains(): 중복 여부 확인
''',
  ),
  Exercise(
    id: 32,
    title: 'Exercise 32: 문자 개수 세기 (Map 사용)',
    description: '문자열에서 각 문자의 등장 횟수를 세어 출력하는 프로그램을 작성하세요.',
    solution: '''
import 'dart:io';

void main() {
  stdout.write("문자열 입력: ");
  String input = stdin.readLineSync()!;
  Map<String, int> counter = {};

  for (var ch in input.split('')) {
    counter[ch] = (counter[ch] ?? 0) + 1;
  }

  counter.forEach((key, value) {
    print("\$key: \$value");
  });
}
''',
    explanation: '''
💡 Dart 문법 설명:
- Map: key-value 쌍으로 데이터 저장
- ?? 연산자: 값이 null이면 기본값 사용
''',
  ),
  Exercise(
    id: 33,
    title: 'Exercise 33: 숫자 배열 정렬하기',
    description: '숫자로 이루어진 리스트를 오름차순으로 정렬하는 프로그램을 작성하세요.',
    solution: '''
void main() {
  List<int> numbers = [7, 2, 9, 4, 1];
  numbers.sort();
  print("정렬된 리스트: \$numbers");
}
''',
    explanation: '''
💡 Dart 문법 설명:
- .sort(): 리스트를 오름차순으로 정렬
''',
  ),
  Exercise(
    id: 34,
    title: 'Exercise 34: 리스트 평균값보다 큰 수만 출력',
    description: '리스트의 평균값보다 큰 값들만 출력하는 프로그램을 작성하세요.',
    solution: '''
void main() {
  List<int> numbers = [5, 10, 15, 20, 25];
  double avg = numbers.reduce((a, b) => a + b) / numbers.length;

  for (var n in numbers) {
    if (n > avg) print(n);
  }
}
''',
    explanation: '''
💡 Dart 문법 설명:
- reduce(): 리스트 전체 합 계산
- 평균 계산 후 조건 필터링
''',
  ),
  Exercise(
    id: 35,
    title: 'Exercise 35: 문자열에 포함된 숫자 개수 세기',
    description: '문자열 안에 포함된 숫자의 개수를 세는 프로그램을 작성하세요.',
    solution: '''
import 'dart:io';

void main() {
  stdout.write("문자열 입력: ");
  String input = stdin.readLineSync()!;
  int count = 0;

  for (var ch in input.split('')) {
    if (RegExp(r'[0-9]').hasMatch(ch)) {
      count++;
    }
  }

  print("숫자 개수: \$count");
}
''',
    explanation: '''
💡 Dart 문법 설명:
- 정규식 [0-9]로 숫자 판별
''',
  ),
  Exercise(
    id: 36,
    title: 'Exercise 36: 리스트에서 홀수만 제거',
    description: '숫자 리스트에서 홀수 요소를 모두 제거하는 프로그램을 작성하세요.',
    solution: '''
void main() {
  List<int> numbers = [1, 2, 3, 4, 5, 6];
  numbers.removeWhere((n) => n % 2 != 0);
  print("결과: \$numbers");
}
''',
    explanation: '''
💡 Dart 문법 설명:
- removeWhere(): 조건에 해당하는 요소 제거
''',
  ),
  Exercise(
    id: 37,
    title: 'Exercise 37: 리스트 합계 계산',
    description: '리스트에 있는 숫자들의 총합을 출력하는 프로그램을 작성하세요.',
    solution: '''
void main() {
  List<int> nums = [10, 20, 30, 40];
  int sum = nums.reduce((a, b) => a + b);
  print("합계: \$sum");
}
''',
    explanation: '''
💡 Dart 문법 설명:
- reduce((a, b) => a + b): 누적 합 계산
''',
  ),
  Exercise(
    id: 38,
    title: 'Exercise 38: 공백 기준 문자열 나누기',
    description: '사용자가 입력한 문장을 단어 단위로 나누어 출력하는 프로그램을 작성하세요.',
    solution: '''
import 'dart:io';

void main() {
  stdout.write("문장 입력: ");
  String input = stdin.readLineSync()!;
  List<String> words = input.split(' ');

  for (var word in words) {
    print(word);
  }
}
''',
    explanation: '''
💡 Dart 문법 설명:
- split(' '): 공백 기준 문자열 나누기
''',
  ),
  Exercise(
    id: 39,
    title: 'Exercise 39: 리스트에 특정 값 존재 여부 확인',
    description: '리스트 안에 특정 숫자가 포함되어 있는지 확인하는 프로그램을 작성하세요.',
    solution: '''
void main() {
  List<int> numbers = [5, 10, 15, 20];
  int target = 10;

  if (numbers.contains(target)) {
    print("리스트에 존재합니다.");
  } else {
    print("리스트에 없습니다.");
  }
}
''',
    explanation: '''
💡 Dart 문법 설명:
- contains(): 리스트 안에 특정 값 포함 여부 확인
''',
  ),
  Exercise(
    id: 40,
    title: 'Exercise 40: 리스트 길이 출력',
    description: '리스트의 요소 개수를 출력하는 프로그램을 작성하세요.',
    solution: '''
void main() {
  List<int> data = [1, 2, 3, 4, 5];
  print("리스트 길이: \${data.length}");
}
''',
    explanation: '''
💡 Dart 문법 설명:
- .length: 리스트의 길이 반환
''',
  ),

  // 📘 Dartudy - 100 Dart 연습 문제
  // 복사 & 붙여넣기 바로 가능하도록 구성
  // 각 문제는 Exercise(id, title, description, solution, explanation)
  Exercise(
    id: 41,
    title: 'Exercise 41: 특정 문자 개수 세기',
    description: '사용자가 입력한 문자열에서 특정 문자의 개수를 세는 프로그램을 작성하세요.',
    solution: '''
import 'dart:io';

void main() {
  stdout.write("문자열 입력: ");
  String input = stdin.readLineSync()!;
  stdout.write("찾을 문자 입력: ");
  String target = stdin.readLineSync()!;

  int count = 0;
  for (var ch in input.split('')) {
    if (ch == target) count++;
  }

  print("'\$target' 문자의 개수: \$count");
}
''',
    explanation: '''
💡 Dart 문법 설명:
- 문자열 순회하며 문자 비교
''',
  ),
  Exercise(
    id: 42,
    title: 'Exercise 42: 리스트에서 최솟값 찾기',
    description: '리스트에서 가장 작은 숫자를 출력하는 프로그램을 작성하세요.',
    solution: '''
void main() {
  List<int> numbers = [42, 7, 13, 29, 5];
  int min = numbers[0];

  for (var n in numbers) {
    if (n < min) min = n;
  }

  print("최솟값: \$min");
}
''',
    explanation: '''
💡 Dart 문법 설명:
- 최소값 찾기: 초기값 설정 후 반복 비교
''',
  ),
  Exercise(
    id: 43,
    title: 'Exercise 43: 특정 범위 내 숫자 출력',
    description: '두 숫자 사이의 숫자를 모두 출력하는 프로그램을 작성하세요.',
    solution: '''
import 'dart:io';

void main() {
  stdout.write("시작 숫자: ");
  int a = int.parse(stdin.readLineSync()!);
  stdout.write("끝 숫자: ");
  int b = int.parse(stdin.readLineSync()!);

  for (int i = a; i <= b; i++) {
    print(i);
  }
}
''',
    explanation: '''
💡 Dart 문법 설명:
- for 문을 이용해 범위 출력
''',
  ),
  Exercise(
    id: 44,
    title: 'Exercise 44: 문자열 대문자로 변환',
    description: '사용자가 입력한 문자열을 모두 대문자로 변환하는 프로그램을 작성하세요.',
    solution: '''
import 'dart:io';

void main() {
  stdout.write("문자열 입력: ");
  String input = stdin.readLineSync()!;

  print("대문자 변환: \${input.toUpperCase()}");
}
''',
    explanation: '''
💡 Dart 문법 설명:
- .toUpperCase(): 문자열을 대문자로 변환
''',
  ),
  Exercise(
    id: 45,
    title: 'Exercise 45: 리스트를 문자열로 결합',
    description: '문자 리스트를 하나의 문자열로 합치는 프로그램을 작성하세요.',
    solution: '''
void main() {
  List<String> chars = ['H', 'e', 'l', 'l', 'o'];
  String result = chars.join();
  print("결과: \$result");
}
''',
    explanation: '''
💡 Dart 문법 설명:
- join(): 리스트의 요소를 하나의 문자열로 결합
''',
  ),
  Exercise(
    id: 46,
    title: 'Exercise 46: 특정 단어가 포함된 문장 찾기',
    description: '여러 문장에서 특정 단어가 포함된 문장만 출력하세요.',
    solution: '''
void main() {
  List<String> sentences = [
    "Dart is fun",
    "I love Flutter",
    "Dart is easy",
    "Programming is exciting"
  ];

  String keyword = "Dart";

  for (var sentence in sentences) {
    if (sentence.contains(keyword)) {
      print(sentence);
    }
  }
}
''',
    explanation: '''
💡 Dart 문법 설명:
- contains(): 문자열 포함 여부 확인
''',
  ),
  Exercise(
    id: 47,
    title: 'Exercise 47: 사용자 이름 길이 검증',
    description: '사용자의 이름을 입력받아 3자 이상인지 확인하세요.',
    solution: '''
import 'dart:io';

void main() {
  stdout.write("이름을 입력하세요: ");
  String name = stdin.readLineSync()!;

  if (name.length >= 3) {
    print("이름이 올바르게 입력되었습니다.");
  } else {
    print("이름은 3자 이상이어야 합니다.");
  }
}
''',
    explanation: '''
💡 Dart 문법 설명:
- 문자열 길이 체크: .length
''',
  ),
  Exercise(
    id: 48,
    title: 'Exercise 48: 리스트에서 중복 제거',
    description: '리스트에서 중복된 숫자를 제거한 새 리스트를 출력하세요.',
    solution: '''
void main() {
  List<int> numbers = [1, 2, 2, 3, 4, 4, 5];
  List<int> unique = numbers.toSet().toList();
  print("중복 제거 결과: \$unique");
}
''',
    explanation: '''
💡 Dart 문법 설명:
- Set은 중복을 허용하지 않음
- toSet().toList(): 리스트 중복 제거 후 다시 리스트로 변환
''',
  ),
  Exercise(
    id: 49,
    title: 'Exercise 49: 첫 글자만 대문자로',
    description: '입력한 문장의 첫 글자만 대문자로 변환하세요.',
    solution: '''
import 'dart:io';

void main() {
  stdout.write("문장 입력: ");
  String sentence = stdin.readLineSync()!;

  if (sentence.isNotEmpty) {
    String result = sentence[0].toUpperCase() + sentence.substring(1);
    print("결과: \$result");
  }
}
''',
    explanation: '''
💡 Dart 문법 설명:
- substring(): 문자열 일부 추출
- [0]: 첫 글자 접근
''',
  ),
  Exercise(
    id: 50,
    title: 'Exercise 50: 리스트 반으로 나누기',
    description: '리스트를 반으로 나누어 두 개의 리스트로 출력하세요.',
    solution: '''
void main() {
  List<int> data = [1, 2, 3, 4, 5, 6];
  int mid = data.length ~/ 2;

  List<int> firstHalf = data.sublist(0, mid);
  List<int> secondHalf = data.sublist(mid);

  print("앞 부분: \$firstHalf");
  print("뒷 부분: \$secondHalf");
}
''',
    explanation: '''
💡 Dart 문법 설명:
- sublist(start, end): 리스트 일부 추출
- ~/ 연산자: 정수 나눗셈
''',
  ),

  // 📘 Dartudy - 100 Dart 연습 문제
  // 복사 & 붙여넣기 바로 가능하도록 구성
  // 각 문제는 Exercise(id, title, description, solution, explanation)
  Exercise(
    id: 51,
    title: 'Exercise 51: 리스트 평균과 표준편차 구하기',
    description: '리스트의 평균과 표준편차를 계산하여 출력하는 프로그램을 작성하세요.',
    solution: '''
import 'dart:math';

void main() {
  List<double> data = [10, 20, 30, 40, 50];
  double mean = data.reduce((a, b) => a + b) / data.length;

  double sumOfSquares = 0;
  for (var x in data) {
    sumOfSquares += pow(x - mean, 2);
  }
  double stdDev = sqrt(sumOfSquares / data.length);

  print("평균: \$mean, 표준편차: \$stdDev");
}
''',
    explanation: '''
💡 Dart 문법 설명:
- pow(): 제곱 계산
- sqrt(): 제곱근 계산
- reduce(): 리스트 합계 계산
''',
  ),
  Exercise(
    id: 52,
    title: 'Exercise 52: 2의 배수 출력',
    description: '1부터 100까지 숫자 중 2의 배수만 출력하는 프로그램을 작성하세요.',
    solution: '''
void main() {
  for (int i = 1; i <= 100; i++) {
    if (i % 2 == 0) {
      print(i);
    }
  }
}
''',
    explanation: '''
💡 Dart 문법 설명:
- 조건문과 반복문을 사용한 필터링
''',
  ),
  Exercise(
    id: 53,
    title: 'Exercise 53: 이메일 유효성 검사',
    description: '입력한 문자열이 이메일 형식인지 확인하는 프로그램을 작성하세요.',
    solution: '''
import 'dart:io';

void main() {
  stdout.write("이메일 입력: ");
  String email = stdin.readLineSync()!;

  bool isValid = RegExp(r'^[^@]+@[^@]+\.[^@]+\$').hasMatch(email);
  print(isValid ? "유효한 이메일입니다." : "잘못된 이메일 형식입니다.");
}
''',
    explanation: '''
💡 Dart 문법 설명:
- 정규식을 사용하여 이메일 형식 검사
''',
  ),
  Exercise(
    id: 54,
    title: 'Exercise 54: 리스트를 문자열로 변환',
    description: '정수 리스트를 문자열로 변환하여 출력하세요. 예: [1, 2, 3] → "1,2,3"',
    solution: '''
void main() {
  List<int> numbers = [1, 2, 3];
  String result = numbers.join(',');
  print(result);
}
''',
    explanation: '''
💡 Dart 문법 설명:
- join(): 리스트 요소를 구분자로 연결하여 문자열로 만듦
''',
  ),
  Exercise(
    id: 55,
    title: 'Exercise 55: 리스트에서 짝수 인덱스만 출력',
    description: '리스트에서 짝수 인덱스에 있는 값을 출력하세요.',
    solution: '''
void main() {
  List<String> items = ['a', 'b', 'c', 'd', 'e'];

  for (int i = 0; i < items.length; i += 2) {
    print(items[i]);
  }
}
''',
    explanation: '''
💡 Dart 문법 설명:
- 인덱스를 2씩 증가시켜 짝수 인덱스에 접근
''',
  ),
  Exercise(
    id: 56,
    title: 'Exercise 56: 리스트를 역순으로 정렬',
    description: '리스트를 내림차순으로 정렬하는 프로그램을 작성하세요.',
    solution: '''
void main() {
  List<int> numbers = [5, 3, 8, 1];
  numbers.sort((a, b) => b.compareTo(a));
  print(numbers);
}
''',
    explanation: '''
💡 Dart 문법 설명:
- sort()에 사용자 정의 비교 함수 사용
''',
  ),
  Exercise(
    id: 57,
    title: 'Exercise 57: 문자열 길이에 따른 출력',
    description: '입력한 문자열이 5자 이상이면 그대로 출력, 아니면 "Too short" 출력',
    solution: '''
import 'dart:io';

void main() {
  stdout.write("문자열 입력: ");
  String input = stdin.readLineSync()!;

  print(input.length >= 5 ? input : "Too short");
}
''',
    explanation: '''
💡 Dart 문법 설명:
- 삼항 연산자 사용: 조건 ? 참 : 거짓
''',
  ),
  Exercise(
    id: 58,
    title: 'Exercise 58: 소문자만 출력',
    description: '문자열에서 소문자만 출력하는 프로그램을 작성하세요.',
    solution: '''
import 'dart:io';

void main() {
  stdout.write("문자열 입력: ");
  String input = stdin.readLineSync()!;

  for (var ch in input.split('')) {
    if (RegExp(r'[a-z]').hasMatch(ch)) {
      stdout.write(ch);
    }
  }
}
''',
    explanation: '''
💡 Dart 문법 설명:
- 정규식 [a-z] 사용
- stdout.write(): 줄바꿈 없이 출력
''',
  ),
  Exercise(
    id: 59,
    title: 'Exercise 59: 대문자만 대체하기',
    description: '문자열에서 대문자만 *로 바꾸는 프로그램을 작성하세요.',
    solution: '''
import 'dart:io';

void main() {
  stdout.write("문자열 입력: ");
  String input = stdin.readLineSync()!;

  String result = input.replaceAllMapped(RegExp(r'[A-Z]'), (match) => '*');
  print(result);
}
''',
    explanation: '''
💡 Dart 문법 설명:
- replaceAllMapped(): 정규식 조건에 따라 문자 변환
''',
  ),
  Exercise(
    id: 60,
    title: 'Exercise 60: 리스트 값 제곱 후 새 리스트 만들기',
    description: '숫자 리스트의 각 요소를 제곱하여 새 리스트로 만들어 출력하세요.',
    solution: '''
void main() {
  List<int> numbers = [1, 2, 3, 4];
  List<int> squared = numbers.map((n) => n * n).toList();
  print(squared);
}
''',
    explanation: '''
💡 Dart 문법 설명:
- map(): 리스트 각 요소를 변환하여 새 리스트 생성
''',
  ),

  // 📘 Dartudy - 100 Dart 연습 문제
  // 복사 & 붙여넣기 바로 가능하도록 구성
  // 각 문제는 Exercise(id, title, description, solution, explanation)
  Exercise(
    id: 61,
    title: 'Exercise 61: 리스트 합이 짝수인지 확인',
    description: '리스트의 총합이 짝수인지 판별하는 프로그램을 작성하세요.',
    solution: '''
void main() {
  List<int> numbers = [2, 4, 6, 1];
  int sum = numbers.reduce((a, b) => a + b);
  print(sum % 2 == 0 ? "짝수입니다" : "홀수입니다");
}
''',
    explanation: '''
💡 Dart 문법 설명:
- reduce(): 합계 계산
- 삼항 연산자로 짝/홀 판별
''',
  ),
  Exercise(
    id: 62,
    title: 'Exercise 62: 리스트에서 가장 긴 문자열 찾기',
    description: '문자열 리스트 중에서 가장 긴 문자열을 찾아 출력하세요.',
    solution: '''
void main() {
  List<String> words = ["apple", "banana", "kiwi", "watermelon"];
  String longest = words.reduce((a, b) => a.length > b.length ? a : b);
  print("가장 긴 단어: \$longest");
}
''',
    explanation: '''
💡 Dart 문법 설명:
- reduce()를 사용해 조건에 맞는 값을 찾기
''',
  ),
  Exercise(
    id: 63,
    title: 'Exercise 63: 문자열에서 숫자 추출',
    description: '문자열 내에서 숫자만 추출하여 출력하는 프로그램을 작성하세요.',
    solution: '''
import 'dart:io';

void main() {
  stdout.write("문자열 입력: ");
  String input = stdin.readLineSync()!;
  String numbers = input.replaceAll(RegExp(r'[^0-9]'), '');
  print("숫자만 추출: \$numbers");
}
''',
    explanation: '''
💡 Dart 문법 설명:
- 정규식으로 숫자만 남기고 나머지 제거
''',
  ),
  Exercise(
    id: 64,
    title: 'Exercise 64: 리스트 요소 곱 구하기',
    description: '리스트의 모든 요소를 곱한 결과를 출력하세요.',
    solution: '''
void main() {
  List<int> numbers = [2, 3, 4];
  int product = numbers.reduce((a, b) => a * b);
  print("곱: \$product");
}
''',
    explanation: '''
💡 Dart 문법 설명:
- reduce(): 누적 계산 함수, 곱셈도 가능
''',
  ),
  Exercise(
    id: 65,
    title: 'Exercise 65: 리스트에서 문자열 길이 리스트로 변환',
    description: '문자열 리스트를 각각의 길이 리스트로 변환하세요.',
    solution: '''
void main() {
  List<String> words = ["hi", "hello", "dart"];
  List<int> lengths = words.map((w) => w.length).toList();
  print(lengths);
}
''',
    explanation: '''
💡 Dart 문법 설명:
- map(): 각 요소를 변환하는 함수
''',
  ),
  Exercise(
    id: 66,
    title: 'Exercise 66: 리스트의 짝수만 제곱하여 출력',
    description: '숫자 리스트에서 짝수만 제곱하여 새 리스트로 출력하세요.',
    solution: '''
void main() {
  List<int> nums = [1, 2, 3, 4, 5, 6];
  List<int> squared = nums.where((n) => n % 2 == 0).map((n) => n * n).toList();
  print(squared);
}
''',
    explanation: '''
💡 Dart 문법 설명:
- where(): 조건 필터링
- map(): 필터링된 결과 변환
''',
  ),
  Exercise(
    id: 67,
    title: 'Exercise 67: 리스트의 중간값 구하기',
    description: '정렬된 리스트의 중간값(중앙값)을 출력하세요.',
    solution: '''
void main() {
  List<int> nums = [10, 20, 30, 40, 50];
  nums.sort();
  double median = nums.length % 2 == 1
      ? nums[nums.length ~/ 2].toDouble()
      : (nums[nums.length ~/ 2 - 1] + nums[nums.length ~/ 2]) / 2;
  print("중앙값: \$median");
}
''',
    explanation: '''
💡 Dart 문법 설명:
- 리스트 정렬 후 길이에 따라 중앙값 계산
''',
  ),
  Exercise(
    id: 68,
    title: 'Exercise 68: 리스트 값 문자열로 변환 (map)',
    description: '숫자 리스트를 문자열 리스트로 변환하세요.',
    solution: '''
void main() {
  List<int> numbers = [1, 2, 3];
  List<String> strings = numbers.map((n) => n.toString()).toList();
  print(strings);
}
''',
    explanation: '''
💡 Dart 문법 설명:
- toString(): 숫자를 문자열로 변환
''',
  ),
  Exercise(
    id: 69,
    title: 'Exercise 69: 리스트에 특정 값 개수 세기',
    description: '리스트에서 특정 값이 몇 번 나오는지 세어 출력하세요.',
    solution: '''
void main() {
  List<String> data = ["a", "b", "a", "c", "a"];
  int count = data.where((x) => x == "a").length;
  print("'a'의 개수: \$count");
}
''',
    explanation: '''
💡 Dart 문법 설명:
- where().length: 조건을 만족하는 항목 개수 세기
''',
  ),
  Exercise(
    id: 70,
    title: 'Exercise 70: 공백 기준으로 단어 수 세기',
    description: '입력한 문장에서 단어의 개수를 출력하세요.',
    solution: '''
import 'dart:io';

void main() {
  stdout.write("문장 입력: ");
  String sentence = stdin.readLineSync()!;
  List<String> words = sentence.trim().split(RegExp(r'\s+'));
  print("단어 수: \${words.length}");
}
''',
    explanation: '''
💡 Dart 문법 설명:
- split(RegExp(r'\s+')): 여러 공백 기준으로 나누기
- trim(): 앞뒤 공백 제거
''',
  ),

  // 📘 Dartudy - 100 Dart 연습 문제
  // 복사 & 붙여넣기 바로 가능하도록 구성
  // 각 문제는 Exercise(id, title, description, solution, explanation)
  Exercise(
    id: 71,
    title: 'Exercise 71: 리스트에서 홀수 인덱스 요소만 출력',
    description: '리스트에서 홀수 인덱스에 있는 값만 출력하는 프로그램을 작성하세요.',
    solution: '''
void main() {
  List<String> items = ['a', 'b', 'c', 'd', 'e'];

  for (int i = 1; i < items.length; i += 2) {
    print(items[i]);
  }
}
''',
    explanation: '''
💡 Dart 문법 설명:
- 인덱스를 2씩 증가시켜 홀수 인덱스 접근
''',
  ),
  Exercise(
    id: 72,
    title: 'Exercise 72: 특정 길이 이상의 단어 필터링',
    description: '문자열 리스트에서 길이가 5 이상인 단어만 출력하세요.',
    solution: '''
void main() {
  List<String> words = ['hi', 'apple', 'sunshine', 'sky'];
  List<String> filtered = words.where((w) => w.length >= 5).toList();
  print(filtered);
}
''',
    explanation: '''
💡 Dart 문법 설명:
- where(): 조건에 맞는 항목 필터링
''',
  ),
  Exercise(
    id: 73,
    title: 'Exercise 73: 리스트에서 중복 문자열 제거',
    description: '문자열 리스트에서 중복된 값을 제거한 새 리스트를 만드세요.',
    solution: '''
void main() {
  List<String> data = ['hi', 'hello', 'hi', 'dart'];
  List<String> unique = data.toSet().toList();
  print(unique);
}
''',
    explanation: '''
💡 Dart 문법 설명:
- Set은 중복을 제거하는 자료구조
''',
  ),
  Exercise(
    id: 74,
    title: 'Exercise 74: 리스트에서 가장 짧은 단어 찾기',
    description: '문자열 리스트에서 가장 짧은 단어를 찾아 출력하세요.',
    solution: '''
void main() {
  List<String> words = ['hi', 'apple', 'sun', 'sky'];
  String shortest = words.reduce((a, b) => a.length < b.length ? a : b);
  print("가장 짧은 단어: \$shortest");
}
''',
    explanation: '''
💡 Dart 문법 설명:
- reduce(): 조건에 맞는 하나의 값을 도출
''',
  ),
  Exercise(
    id: 75,
    title: 'Exercise 75: 리스트 합이 100 이상인지 확인',
    description: '정수 리스트의 총합이 100 이상인지 확인하는 프로그램을 작성하세요.',
    solution: '''
void main() {
  List<int> numbers = [20, 30, 25, 35];
  int sum = numbers.reduce((a, b) => a + b);
  print(sum >= 100 ? "100 이상" : "100 미만");
}
''',
    explanation: '''
💡 Dart 문법 설명:
- 조건식과 삼항 연산자 사용
''',
  ),
  Exercise(
    id: 76,
    title: 'Exercise 76: 리스트 끝에서 n개 요소 추출',
    description: '리스트의 마지막 3개 요소를 출력하세요.',
    solution: '''
void main() {
  List<int> nums = [10, 20, 30, 40, 50];
  List<int> lastThree = nums.sublist(nums.length - 3);
  print(lastThree);
}
''',
    explanation: '''
💡 Dart 문법 설명:
- sublist(): 리스트의 부분 추출
''',
  ),
  Exercise(
    id: 77,
    title: 'Exercise 77: 문자열에 포함된 모음만 출력',
    description: '사용자가 입력한 문자열에서 모음(a, e, i, o, u)만 출력하세요.',
    solution: '''
import 'dart:io';

void main() {
  stdout.write("문자열 입력: ");
  String input = stdin.readLineSync()!.toLowerCase();

  for (var ch in input.split('')) {
    if ('aeiou'.contains(ch)) stdout.write(ch);
  }
}
''',
    explanation: '''
💡 Dart 문법 설명:
- .contains(): 모음 포함 여부 확인
''',
  ),
  Exercise(
    id: 78,
    title: 'Exercise 78: 리스트에서 숫자만 필터링',
    description: '문자와 숫자가 섞인 리스트에서 숫자만 남겨 출력하세요.',
    solution: '''
void main() {
  List<dynamic> mixed = ['a', 1, 'b', 2, 3, 'c'];
  List<int> numbers = mixed.whereType<int>().toList();
  print(numbers);
}
''',
    explanation: '''
💡 Dart 문법 설명:
- whereType<int>(): 특정 타입만 필터링
''',
  ),
  Exercise(
    id: 79,
    title: 'Exercise 79: 리스트 순서 뒤집기 (reversed)',
    description: '리스트를 reversed 속성을 사용해 역순으로 출력하세요.',
    solution: '''
void main() {
  List<int> data = [1, 2, 3, 4, 5];
  print(data.reversed.toList());
}
''',
    explanation: '''
💡 Dart 문법 설명:
- .reversed는 Iterable, .toList()로 리스트화
''',
  ),
  Exercise(
    id: 80,
    title: 'Exercise 80: 문자열을 한 글자씩 분리 출력',
    description: '사용자가 입력한 문자열을 한 글자씩 줄 바꿔 출력하세요.',
    solution: '''
import 'dart:io';

void main() {
  stdout.write("문자열 입력: ");
  String input = stdin.readLineSync()!;

  for (var ch in input.split('')) {
    print(ch);
  }
}
''',
    explanation: '''
💡 Dart 문법 설명:
- split(''): 문자열을 문자 배열로 분리
- for 루프로 하나씩 출력
''',
  ),

  Exercise(
    id: 81,
    title: 'Exercise 81: 리스트를 쉼표로 연결된 문자열로 변환',
    description: '리스트의 값을 쉼표로 구분된 하나의 문자열로 출력하세요.',
    solution: '''
void main() {
  List<int> numbers = [1, 2, 3, 4];
  String joined = numbers.join(', ');
  print(joined);
}
''',
    explanation: '''
💡 Dart 문법 설명:
- .join(): 리스트를 문자열로 결합할 때 사용
''',
  ),
  Exercise(
    id: 82,
    title: 'Exercise 82: 리스트 내 문자열 대문자 변환',
    description: '문자열 리스트의 모든 항목을 대문자로 변환하여 출력하세요.',
    solution: '''
void main() {
  List<String> names = ['alice', 'bob', 'charlie'];
  List<String> upperNames = names.map((n) => n.toUpperCase()).toList();
  print(upperNames);
}
''',
    explanation: '''
💡 Dart 문법 설명:
- .map(): 각 요소에 변환 함수 적용
- .toUpperCase(): 대문자로 변환
''',
  ),
  Exercise(
    id: 83,
    title: 'Exercise 83: 리스트에서 짝수 개수 세기',
    description: '정수 리스트에서 짝수의 개수를 세는 프로그램을 작성하세요.',
    solution: '''
void main() {
  List<int> nums = [1, 2, 3, 4, 5, 6];
  int count = nums.where((n) => n % 2 == 0).length;
  print("짝수 개수: \$count");
}
''',
    explanation: '''
💡 Dart 문법 설명:
- where(): 조건을 만족하는 요소 필터링
- .length: 필터링 결과의 개수 반환
''',
  ),
  Exercise(
    id: 84,
    title: 'Exercise 84: 리스트 내 특정 문자열 포함 여부',
    description: '리스트 안에 특정 단어가 포함되어 있는지 확인하세요.',
    solution: '''
void main() {
  List<String> words = ['apple', 'banana', 'kiwi'];
  print(words.contains('banana') ? '포함됨' : '없음');
}
''',
    explanation: '''
💡 Dart 문법 설명:
- .contains(): 포함 여부 확인
''',
  ),
  Exercise(
    id: 85,
    title: 'Exercise 85: 리스트 정렬 후 첫 값과 마지막 값 출력',
    description: '리스트를 정렬한 후 첫 번째와 마지막 요소를 출력하세요.',
    solution: '''
void main() {
  List<int> data = [9, 2, 5, 7];
  data.sort();
  print("첫 값: \${data.first}, 마지막 값: \${data.last}");
}
''',
    explanation: '''
💡 Dart 문법 설명:
- .sort(): 리스트 정렬
- .first, .last: 정렬된 리스트의 양 끝 값
''',
  ),
  Exercise(
    id: 86,
    title: 'Exercise 86: 리스트 평균보다 큰 값만 출력',
    description: '평균보다 큰 값만 필터링하여 출력하세요.',
    solution: '''
void main() {
  List<int> scores = [60, 70, 80, 90];
  double avg = scores.reduce((a, b) => a + b) / scores.length;
  print(scores.where((s) => s > avg).toList());
}
''',
    explanation: '''
💡 Dart 문법 설명:
- 평균 계산 후 조건 필터링
''',
  ),
  Exercise(
    id: 87,
    title: 'Exercise 87: 리스트에서 문자열 길이 조건 필터링',
    description: '길이가 3 이상인 문자열만 출력하세요.',
    solution: '''
void main() {
  List<String> names = ['hi', 'bob', 'alex', 'jo'];
  print(names.where((n) => n.length >= 3).toList());
}
''',
    explanation: '''
💡 Dart 문법 설명:
- 조건식에 문자열 길이 사용
''',
  ),
  Exercise(
    id: 88,
    title: 'Exercise 88: 리스트에 특정 값이 몇 번째에 있는지 찾기',
    description: '특정 값이 리스트의 몇 번째 인덱스에 있는지 출력하세요.',
    solution: '''
void main() {
  List<String> items = ['a', 'b', 'c', 'd'];
  int index = items.indexOf('c');
  print("인덱스: \$index");
}
''',
    explanation: '''
💡 Dart 문법 설명:
- indexOf(): 특정 요소의 인덱스를 반환
''',
  ),
  Exercise(
    id: 89,
    title: 'Exercise 89: 리스트에서 문자열 길이의 평균 구하기',
    description: '문자열 리스트에서 각 요소의 길이의 평균을 구하세요.',
    solution: '''
void main() {
  List<String> words = ['hi', 'hello', 'world'];
  double avgLength = words.map((w) => w.length).reduce((a, b) => a + b) / words.length;
  print("평균 길이: \$avgLength");
}
''',
    explanation: '''
💡 Dart 문법 설명:
- map + reduce를 활용한 평균 계산
''',
  ),
  Exercise(
    id: 90,
    title: 'Exercise 90: 리스트 요소에 번호 붙이기',
    description: '리스트 각 요소 앞에 번호를 붙여 출력하세요. 예: 1. apple',
    solution: '''
void main() {
  List<String> fruits = ['apple', 'banana', 'kiwi'];

  for (int i = 0; i < fruits.length; i++) {
    print("\${i + 1}. \${fruits[i]}");
  }
}
''',
    explanation: '''
💡 Dart 문법 설명:
- for문 인덱스를 활용해 순번 출력
''',
  ),
  Exercise(
    id: 91,
    title: 'Exercise 91: 리스트를 문자열로 연결 (구분자 변경)',
    description: '리스트를 구분자 "/"를 사용해 문자열로 출력하세요.',
    solution: '''
void main() {
  List<String> items = ['a', 'b', 'c'];
  print(items.join('/'));
}
''',
    explanation: '''
💡 Dart 문법 설명:
- join('구분자'): 리스트를 구분자로 연결된 문자열로 변환
''',
  ),
  Exercise(
    id: 92,
    title: 'Exercise 92: 중첩 리스트 펼치기 (flatten)',
    description: '이중 리스트를 하나의 리스트로 합치세요.',
    solution: '''
void main() {
  List<List<int>> nested = [[1, 2], [3, 4]];
  List<int> flat = nested.expand((e) => e).toList();
  print(flat);
}
''',
    explanation: '''
💡 Dart 문법 설명:
- expand(): 이중 리스트를 평평하게 펼침
''',
  ),
  Exercise(
    id: 93,
    title: 'Exercise 93: 문자열 단어 수 세기',
    description: '사용자가 입력한 문장에서 단어의 개수를 출력하세요.',
    solution: '''
import 'dart:io';

void main() {
  stdout.write("문장 입력: ");
  String sentence = stdin.readLineSync()!;
  print("단어 수: \${sentence.split(' ').length}");
}
''',
    explanation: '''
💡 Dart 문법 설명:
- split(' '): 공백 기준으로 나누기
''',
  ),
  Exercise(
    id: 94,
    title: 'Exercise 94: 리스트를 반으로 나눠 출력',
    description: '리스트를 앞뒤 반으로 나눠 각각 출력하세요.',
    solution: '''
void main() {
  List<int> nums = [1, 2, 3, 4, 5, 6];
  int mid = nums.length ~/ 2;
  print(nums.sublist(0, mid));
  print(nums.sublist(mid));
}
''',
    explanation: '''
💡 Dart 문법 설명:
- sublist(start, end): 부분 리스트 추출
''',
  ),
  Exercise(
    id: 95,
    title: 'Exercise 95: 리스트에서 짝수 제거',
    description: '리스트에서 짝수 요소를 제거하고 출력하세요.',
    solution: '''
void main() {
  List<int> numbers = [1, 2, 3, 4, 5, 6];
  numbers.removeWhere((n) => n % 2 == 0);
  print(numbers);
}
''',
    explanation: '''
💡 Dart 문법 설명:
- removeWhere(): 조건에 맞는 요소 제거
''',
  ),
  Exercise(
    id: 96,
    title: 'Exercise 96: 문자열 역순 출력',
    description: '사용자가 입력한 문자열을 거꾸로 출력하세요.',
    solution: '''
import 'dart:io';

void main() {
  stdout.write("문자열 입력: ");
  String input = stdin.readLineSync()!;
  print(input.split('').reversed.join());
}
''',
    explanation: '''
💡 Dart 문법 설명:
- split → reversed → join 으로 문자열 뒤집기
''',
  ),
  Exercise(
    id: 97,
    title: 'Exercise 97: 리스트의 최댓값과 최솟값',
    description: '정수 리스트에서 최댓값과 최솟값을 출력하세요.',
    solution: '''
void main() {
  List<int> nums = [10, 20, 30, 5, 50];
  print("최댓값: \${nums.reduce((a, b) => a > b ? a : b)}");
  print("최솟값: \${nums.reduce((a, b) => a < b ? a : b)}");
}
''',
    explanation: '''
💡 Dart 문법 설명:
- reduce()를 사용한 조건 기반 최대/최소 추출
''',
  ),
  Exercise(
    id: 98,
    title: 'Exercise 98: 리스트 비어있는지 확인',
    description: '리스트가 비어있는지 여부를 출력하세요.',
    solution: '''
void main() {
  List<String> list = [];
  print(list.isEmpty ? "비어 있음" : "값 있음");
}
''',
    explanation: '''
💡 Dart 문법 설명:
- isEmpty, isNotEmpty: 리스트 비어있는지 확인
''',
  ),
  Exercise(
    id: 99,
    title: 'Exercise 99: 리스트에 null 제거',
    description: '리스트에서 null 값을 제거하고 출력하세요.',
    solution: '''
void main() {
  List<String?> items = ['a', null, 'b', null];
  print(items.whereType<String>().toList());
}
''',
    explanation: '''
💡 Dart 문법 설명:
- whereType<T>(): 특정 타입만 남기기
''',
  ),
  Exercise(
    id: 100,
    title: 'Exercise 100: 리스트 항목 개수 세기 (Map)',
    description: '리스트에서 각 항목이 몇 번 나오는지 Map으로 출력하세요.',
    solution: '''
void main() {
  List<String> data = ['a', 'b', 'a', 'c', 'b', 'a'];
  Map<String, int> countMap = {};
  for (var item in data) {
    countMap[item] = (countMap[item] ?? 0) + 1;
  }
  print(countMap);
}
''',
    explanation: '''
💡 Dart 문법 설명:
- Map을 사용한 빈도수 계산
''',
  ),
];
