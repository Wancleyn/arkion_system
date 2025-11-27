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
        textTheme: ThemeData.dark().textTheme.apply(
              fontFamily: 'Roboto',
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
      // Tela “sistema” mínima – depois a gente troca pelo layout ArkionOS completo
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF020617),
              Color(0xFF0F172A),
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.hexagon_outlined, size: 80),
              const SizedBox(height: 16),
              Text(
                'Arkion System\nQuantum Vivo OS v0.1',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 12),
              Text(
                'Launcher protótipo instalado com sucesso.',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
