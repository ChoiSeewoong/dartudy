import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AdminProblemEditor extends StatefulWidget {
  const AdminProblemEditor({super.key});

  @override
  State<AdminProblemEditor> createState() => _AdminProblemEditorState();
}

class _AdminProblemEditorState extends State<AdminProblemEditor> {
  final _titleController = TextEditingController();
  final _descController = TextEditingController();
  final _codeController = TextEditingController();

  final CollectionReference problems = FirebaseFirestore.instance.collection(
    'problems',
  );

  String? _editingDocId;

  Future<void> _submitProblem() async {
    final title = _titleController.text.trim();
    final desc = _descController.text.trim();
    final code = _codeController.text.trim();

    if (title.isEmpty || desc.isEmpty || code.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('모든 필드를 입력해주세요')));
      return;
    }

    if (_editingDocId == null) {
      // 새 문제 추가
      await problems.add({
        'title': title,
        'description': desc,
        'correctCode': code,
        'createdAt': FieldValue.serverTimestamp(),
      });
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('문제가 등록되었습니다')));
    } else {
      // 기존 문제 수정
      await problems.doc(_editingDocId).update({
        'title': title,
        'description': desc,
        'correctCode': code,
      });
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('문제가 수정되었습니다')));
    }

    _clearForm();
  }

  Future<void> _deleteProblem(String docId) async {
    await problems.doc(docId).delete();
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('문제가 삭제되었습니다')));
    if (_editingDocId == docId) _clearForm();
  }

  void _loadProblemForEdit(Map<String, dynamic> data, String docId) {
    setState(() {
      _editingDocId = docId;
      _titleController.text = data['title'] ?? '';
      _descController.text = data['description'] ?? '';
      _codeController.text = data['correctCode'] ?? '';
    });
  }

  void _clearForm() {
    setState(() {
      _editingDocId = null;
      _titleController.clear();
      _descController.clear();
      _codeController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = _editingDocId != null;

    return Scaffold(
      appBar: AppBar(title: const Text('문제 추가/편집 (관리자용)')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                isEditing ? '문제 수정 중' : '문제 추가하기',
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: _titleController,
                decoration: const InputDecoration(labelText: '문제 제목'),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: _descController,
                decoration: const InputDecoration(labelText: '문제 설명'),
                maxLines: 3,
              ),
              const SizedBox(height: 12),
              TextField(
                controller: _codeController,
                decoration: const InputDecoration(labelText: '정답 코드'),
                maxLines: 4,
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: _submitProblem,
                    child: Text(isEditing ? '문제 수정하기' : '문제 등록하기'),
                  ),
                  const SizedBox(width: 12),
                  if (isEditing)
                    OutlinedButton(
                      onPressed: _clearForm,
                      child: const Text('취소'),
                    ),
                ],
              ),
              const SizedBox(height: 32),
              const Text('📄 등록된 문제 목록', style: TextStyle(fontSize: 18)),
              const SizedBox(height: 12),
              _buildProblemList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProblemList() {
    return StreamBuilder<QuerySnapshot>(
      stream: problems.orderBy('createdAt', descending: true).snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return const CircularProgressIndicator();

        final docs = snapshot.data!.docs;

        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: docs.length,
          itemBuilder: (context, index) {
            final doc = docs[index];
            final data = doc.data() as Map<String, dynamic>;
            final title = data['title'] ?? '제목 없음';
            final desc = data['description'] ?? '';

            return Card(
              child: ListTile(
                title: Text(title),
                subtitle: Text(desc),
                onTap: () => _loadProblemForEdit(data, doc.id),
                trailing: IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () => _deleteProblem(doc.id),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
