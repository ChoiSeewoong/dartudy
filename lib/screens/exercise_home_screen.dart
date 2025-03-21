import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/exercise.dart';
import '../services/code_storage_service.dart';
import '../services/code_download_service.dart';
import '../services/code_restore_service.dart';
import 'exercise_screen.dart';
import 'email_screen.dart';

class ExerciseHomeScreen extends StatefulWidget {
  final List<Exercise> exercises;
  const ExerciseHomeScreen({Key? key, required this.exercises})
    : super(key: key);

  @override
  State<ExerciseHomeScreen> createState() => _ExerciseHomeScreenState();
}

class _ExerciseHomeScreenState extends State<ExerciseHomeScreen> {
  final _storageService = CodeStorageService();
  late Future<List<bool>> _completionStates;
  bool _showCompletedOnly = false;
  String _searchText = '';
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _completionStates = _loadAllCompletionStates();
  }

  Future<List<bool>> _loadAllCompletionStates() async {
    List<bool> states = [];
    for (final e in widget.exercises) {
      final isCompleted = await _storageService.loadCompletion(e.id);
      states.add(isCompleted);
    }
    return states;
  }

  void _refreshCompletionStates() {
    setState(() {
      _completionStates = _loadAllCompletionStates();
    });
  }

  void _logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('user_email');

    if (!mounted) return;

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => const EmailScreen()),
      (route) => false,
    );
  }

  void _resetAllProgress() async {
    final prefs = await SharedPreferences.getInstance();
    for (final e in widget.exercises) {
      await prefs.remove('code_${e.id}');
      await prefs.remove('completed_${e.id}');
    }
    _refreshCompletionStates();
    if (!mounted) return;
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('모든 진행 상태가 초기화되었습니다.')));
  }

  Future<void> _downloadAllCode() async {
    final downloadService = CodeDownloadService();
    await downloadService.exportUserCodesAsTxt(widget.exercises);
  }

  Future<void> _restoreBackup() async {
    final restoreService = CodeRestoreService();
    await restoreService.importUserCodesFromTxt(widget.exercises);
    _refreshCompletionStates();
    if (context.mounted) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('코드가 복원되었습니다!')));
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('📘 Dartudy 연습 문제'),
        actions: [
          IconButton(
            icon: Icon(_showCompletedOnly ? Icons.list : Icons.checklist),
            tooltip: _showCompletedOnly ? '전체 보기' : '완료된 문제만 보기',
            onPressed: () {
              setState(() {
                _showCompletedOnly = !_showCompletedOnly;
              });
            },
          ),
          IconButton(
            icon: const Icon(Icons.download),
            tooltip: '코드 백업',
            onPressed: _downloadAllCode,
          ),
          IconButton(
            icon: const Icon(Icons.upload_file),
            tooltip: '코드 복원',
            onPressed: _restoreBackup,
          ),
          IconButton(
            icon: const Icon(Icons.refresh),
            tooltip: '전체 초기화',
            onPressed: () async {
              final confirm = await showDialog<bool>(
                context: context,
                builder:
                    (ctx) => AlertDialog(
                      title: const Text('초기화 확인'),
                      content: const Text('모든 코드 및 완료 상태를 삭제하시겠습니까?'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(ctx, false),
                          child: const Text('취소'),
                        ),
                        TextButton(
                          onPressed: () => Navigator.pop(ctx, true),
                          child: const Text('초기화'),
                        ),
                      ],
                    ),
              );
              if (confirm == true) _resetAllProgress();
            },
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: '로그아웃',
            onPressed: _logout,
          ),
        ],
      ),
      body: FutureBuilder<List<bool>>(
        future: _completionStates,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final completedList = snapshot.data!;

          final filteredExercises = <Exercise>[];
          final filteredCompletion = <bool>[];

          for (int i = 0; i < widget.exercises.length; i++) {
            final matchesSearch = widget.exercises[i].title
                .toLowerCase()
                .contains(_searchText.toLowerCase());
            if ((!_showCompletedOnly || completedList[i]) && matchesSearch) {
              filteredExercises.add(widget.exercises[i]);
              filteredCompletion.add(completedList[i]);
            }
          }

          final total = widget.exercises.length;
          final done = completedList.where((c) => c).length;
          final percent = total == 0 ? 0.0 : done / total;

          return Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 800),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "✅ 완료한 문제: $done / $total (${(percent * 100).toStringAsFixed(1)}%)",
                        ),
                        const SizedBox(height: 8),
                        LinearProgressIndicator(value: percent),
                        const SizedBox(height: 16),
                        TextField(
                          controller: _searchController,
                          decoration: const InputDecoration(
                            hintText: '문제 제목 검색...',
                            prefixIcon: Icon(Icons.search),
                            border: OutlineInputBorder(),
                          ),
                          onChanged: (value) {
                            setState(() {
                              _searchText = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  const Divider(height: 1),
                  Expanded(
                    child: ListView.builder(
                      itemCount: filteredExercises.length,
                      itemBuilder: (context, index) {
                        final exercise = filteredExercises[index];
                        final isCompleted = filteredCompletion[index];

                        return ListTile(
                          title: Text(exercise.title),
                          trailing:
                              isCompleted
                                  ? const Icon(
                                    Icons.check_circle,
                                    color: Colors.green,
                                  )
                                  : const Icon(
                                    Icons.radio_button_unchecked,
                                    color: Colors.grey,
                                  ),
                          onTap: () async {
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (_) => ExerciseScreen(exercise: exercise),
                              ),
                            );
                            _refreshCompletionStates();
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
