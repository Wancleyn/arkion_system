import 'package:flutter/material.dart';

void main() {
  runApp(const ArkionSystemApp());
}

/// ArkionOS – Quantum Vivo OS v0.1
/// Protótipo de launcher (substitui a tela inicial do Android)
class ArkionSystemApp extends StatelessWidget {
  const ArkionSystemApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Arkion System',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF00E5FF),
          brightness: Brightness.dark,
        ),
      ),
      home: const ArkionHomeScreen(),
    );
  }
}

class ArkionHomeScreen extends StatelessWidget {
  const ArkionHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(Icons.shield, size: 90),
            SizedBox(height: 16),
            Text(
              'Arkion System\nQuantum Vivo OS v0.1',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 22),
            ),
          ],
        ),
      ),
    );
  }
}
