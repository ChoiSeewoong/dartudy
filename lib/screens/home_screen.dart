import 'package:flutter/material.dart';
import '../data/exercises.dart';
import 'exercise_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('📝 Dartudy - Dart 연습')),
      body: ListView.builder(
        itemCount: exercises.length,
        itemBuilder: (context, index) {
          final exercise = exercises[index];
          return ListTile(
            title: Text(exercise.title),
            subtitle: Text("문제 ${exercise.id}"),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ExerciseScreen(exercise: exercise),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
