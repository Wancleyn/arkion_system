import 'package:flutter/material.dart';
import 'nucleus_widget.dart';
import 'theme.dart';

class ArkionHomePage extends StatelessWidget {
  const ArkionHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Fundo quântico vivo
          Container(
            decoration: const BoxDecoration(
              gradient: RadialGradient(
                center: Alignment(0.0, -0.3),
                radius: 1.2,
                colors: [
                  ArkionColors.blueDeep,
                  ArkionColors.blackQuantum,
                ],
              ),
            ),
          ),

          // Grid quântico
          Positioned.fill(
            child: CustomPaint(
              painter: _QuantumGridPainter(),
            ),
          ),

          // Núcleo vivo no centro
          const Center(
            child: SizedBox(
              width: 220,
              height: 220,
              child: ArkionNucleus(),
            ),
          ),

          // HUD de status
          Positioned(
            left: 16,
            bottom: 32,
            right: 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'ARKION SYSTEM // QUÂNTICO VIVO',
                  style: TextStyle(
                    color: ArkionColors.blueIon,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.4,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  'Bem-vindo, Senhor Wancley.\nSistema em modo CALMO. Aguardando comando.',
                  style: TextStyle(
                    color: ArkionColors.plasmaWhite.withOpacity(0.8),
                    fontSize: 13,
                    height: 1.4,
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

class _QuantumGridPainter extends CustomPainter {
  const _QuantumGridPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = ArkionColors.blueDeep.withOpacity(0.35)
      ..strokeWidth = 0.5;

    const step = 28.0;

    for (double x = 0; x <= size.width; x += step) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }
    for (double y = 0; y <= size.height; y += step) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
