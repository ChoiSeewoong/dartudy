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
- stdin.readLineSync(): 사용자로부터 입력 받기
- int.parse(): 문자열을 숫자로 변환
- \$변수: 문자열 보간(interpolation)
''',
  ),
];
