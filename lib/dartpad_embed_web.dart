import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DartPadEmbed extends StatelessWidget {
  const DartPadEmbed({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("🧪 Dart 코드를 실행하려면 아래 버튼을 클릭하세요:"),
        const SizedBox(height: 12),
        ElevatedButton(
          onPressed: () async {
            const url = 'https://dartpad.dev/';
            if (await canLaunchUrl(Uri.parse(url))) {
              await launchUrl(Uri.parse(url));
            }
          },
          child: const Text('DartPad 실행하기'),
        ),
      ],
    );
  }
}
