import 'dart:math';
import 'package:flutter/material.dart';
import 'theme.dart';

class ArkionNucleus extends StatefulWidget {
  const ArkionNucleus({super.key});

  @override
  State<ArkionNucleus> createState() => _ArkionNucleusState();
}

class _ArkionNucleusState extends State<ArkionNucleus>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _pulse;
  late final Animation<double> _rotationSlow;
  late final Animation<double> _rotationFast;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..repeat();

    _pulse = Tween<double>(begin: 0.85, end: 1.15).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.5, curve: Curves.easeInOut),
      ),
    );

    _rotationSlow = Tween<double>(begin: 0, end: 2 * pi).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 1.0, curve: Curves.linear),
      ),
    );

    _rotationFast = Tween<double>(begin: 0, end: 4 * pi).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.4, 1.0, curve: Curves.easeInOut),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, __) {
        final t = _controller.value;

        final isActive = t > 0.4 && t <= 0.8;
        final isResponding = t > 0.8;

        final double coreGlow = isResponding
            ? 1.0
            : isActive
                ? 0.8
                : 0.5;

        final Color coreColor = Color.lerp(
          ArkionColors.blueIon,
          ArkionColors.purpleQuantum,
          isActive || isResponding ? 0.6 : 0.2,
        )!;

        return CustomPaint(
          painter: _NucleusPainter(
            pulse: _pulse.value,
            rotationSlow: _rotationSlow.value,
            rotationFast: _rotationFast.value,
            coreGlow: coreGlow,
            coreColor: coreColor,
            respondingFlash: isResponding ? sin(t * pi * 4).abs() : 0.0,
          ),
        );
      },
    );
  }
}

class _NucleusPainter extends CustomPainter {
  final double pulse;
  final double rotationSlow;
  final double rotationFast;
  final double coreGlow;
  final double respondingFlash;
  final Color coreColor;

  _NucleusPainter({
    required this.pulse,
    required this.rotationSlow,
    required this.rotationFast,
    required this.coreGlow,
    required this.coreColor,
    required this.respondingFlash,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = size.center(Offset.zero);
    final radius = min(size.width, size.height) / 2;

    final bgPaint = Paint()
      ..shader = RadialGradient(
        colors: [
          ArkionColors.blueDeep.withOpacity(0.0),
          ArkionColors.blueDeep.withOpacity(0.7),
        ],
      ).createShader(Rect.fromCircle(center: center, radius: radius));
    canvas.drawCircle(center, radius, bgPaint);

    final outerRadius = radius * 0.95;
    final outerPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3
      ..color = ArkionColors.purpleQuantum.withOpacity(0.7);
    canvas.save();
    canvas.translate(center.dx, center.dy);
    canvas.rotate(rotationSlow);
    canvas.translate(-center.dx, -center.dy);
    canvas.drawCircle(center, outerRadius, outerPaint);

    final dotPaint = Paint()
      ..color = ArkionColors.plasmaWhite.withOpacity(0.9)
      ..style = PaintingStyle.fill;
    const int dots = 24;
    for (int i = 0; i < dots; i++) {
      final angle = (2 * pi * i) / dots;
      final dx = center.dx + outerRadius * cos(angle);
      final dy = center.dy + outerRadius * sin(angle);
      final dotSize = 2.2 + (i.isEven ? 0.8 : 0.0);
      canvas.drawCircle(Offset(dx, dy), dotSize, dotPaint);
    }
    canvas.restore();

    final midRadius = radius * 0.65 * pulse;
    final midPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..shader = SweepGradient(
        colors: [
          ArkionColors.blueIon.withOpacity(0.2),
          ArkionColors.blueIon.withOpacity(0.9),
          ArkionColors.blueIon.withOpacity(0.2),
        ],
      ).createShader(Rect.fromCircle(center: center, radius: midRadius));
    canvas.save();
    canvas.translate(center.dx, center.dy);
    canvas.rotate(rotationFast);
    canvas.translate(-center.dx, -center.dy);
    canvas.drawCircle(center, midRadius, midPaint);
    canvas.restore();

    final coreRadius = radius * 0.35 * (0.9 + coreGlow * 0.2);
    final corePaint = Paint()
      ..shader = RadialGradient(
        colors: [
          coreColor.withOpacity(0.2 + coreGlow * 0.4),
          coreColor.withOpacity(0.9),
          ArkionColors.plasmaWhite
              .withOpacity(0.2 + respondingFlash * 0.5),
        ],
        stops: const [0.0, 0.6, 1.0],
      ).createShader(Rect.fromCircle(center: center, radius: coreRadius));
    canvas.drawCircle(center, coreRadius, corePaint);

    if (respondingFlash > 0) {
      final flashPaint = Paint()
        ..color = ArkionColors.plasmaWhite
            .withOpacity(0.2 + respondingFlash * 0.4);
      canvas.drawCircle(center, coreRadius * (1.1 + respondingFlash * 0.3),
          flashPaint);
    }
  }

  @override
  bool shouldRepaint(covariant _NucleusPainter oldDelegate) => true;
}
