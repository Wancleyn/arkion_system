import 'package:flutter/material.dart';
import 'arkion_home.dart';
import 'theme.dart';
import 'boot_screen.dart';

void main() {
  runApp(const ArkionSystemApp());
}

class ArkionSystemApp extends StatelessWidget {
  const ArkionSystemApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Arkion System',
      debugShowCheckedModeBanner: false,
      theme: arkionTheme,
      home: const ArkionBootScreen(),
    );
  }
}
