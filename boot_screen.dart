import 'dart:async';
import 'package:flutter/material.dart';
import 'arkion_home.dart';
import 'theme.dart';
import 'nucleus_widget.dart';

class ArkionBootScreen extends StatefulWidget {
  const ArkionBootScreen({super.key});

  @override
  State<ArkionBootScreen> createState() => _ArkionBootScreenState();
}

class _ArkionBootScreenState extends State<ArkionBootScreen> {
  @override
  void initState() {
    super.initState();
    _scheduleTransition();
  }

  void _scheduleTransition() {
    Timer(const Duration(seconds: 3), () {
      if (!mounted) return;
      Navigator.of(context).pushReplacement(
        PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 700),
          pageBuilder: (_, animation, __) {
            return FadeTransition(
              opacity: animation,
              child: const ArkionHomePage(),
            );
          },
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ArkionColors.blackQuantum,
      body: Stack(
        children: [
          Center(
            child: SizedBox(
              width: 220,
              height: 220,
              child: ArkionNucleus(),
            ),
          ),
          Positioned(
            bottom: 72,
            left: 0,
            right: 0,
            child: Column(
              children: const [
                Text(
                  'ARKION SYSTEM',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: ArkionColors.plasmaWhite,
                    fontSize: 20,
                    letterSpacing: 4,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'QUÂNTICO VIVO v0.1',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: ArkionColors.blueIon,
                    fontSize: 13,
                    letterSpacing: 2,
                  ),
                ),
                SizedBox(height: 24),
                Text(
                  'Inicializando núcleos neurais...',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: ArkionColors.plasmaWhite,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
