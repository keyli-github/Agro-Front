import 'dart:math';
import 'package:flutter/material.dart';

/// Ilustración circular con cielo, nubes y pasto verde.
/// Se dibuja enteramente con código (CustomPainter) para no depender de assets.
class WelcomeIllustration extends StatelessWidget {
  final double size;

  const WelcomeIllustration({super.key, this.size = 180});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        painter: _SkyGrassPainter(),
      ),
    );
  }
}

class _SkyGrassPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    // Clip al círculo
    canvas.save();
    canvas.clipRRect(
      RRect.fromRectAndRadius(
        Rect.fromCircle(center: center, radius: radius),
        Radius.circular(radius),
      ),
    );

    // === Cielo con degradado ===
    final skyPaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          const Color(0xFF87CEEB), // celeste claro
          const Color(0xFFB5E3F5), // celeste más claro
        ],
      ).createShader(Rect.fromCircle(center: center, radius: radius));

    canvas.drawCircle(center, radius, skyPaint);

    // === Colina trasera (verde oscuro) ===
    final hillBackPaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          const Color(0xFF5A8F3C),
          const Color(0xFF4A7D2E),
        ],
      ).createShader(Rect.fromLTWH(0, size.height * 0.45, size.width, size.height * 0.55));

    final hillBackPath = Path();
    hillBackPath.moveTo(0, size.height * 0.7);
    hillBackPath.quadraticBezierTo(
      size.width * 0.3, size.height * 0.45,
      size.width * 0.6, size.height * 0.6,
    );
    hillBackPath.quadraticBezierTo(
      size.width * 0.8, size.height * 0.68,
      size.width, size.height * 0.65,
    );
    hillBackPath.lineTo(size.width, size.height);
    hillBackPath.lineTo(0, size.height);
    hillBackPath.close();
    canvas.drawPath(hillBackPath, hillBackPaint);

    // === Colina frontal (verde más claro) ===
    final hillFrontPaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          const Color(0xFF7EC850),
          const Color(0xFF5DA832),
        ],
      ).createShader(Rect.fromLTWH(0, size.height * 0.6, size.width, size.height * 0.4));

    final hillFrontPath = Path();
    hillFrontPath.moveTo(0, size.height * 0.85);
    hillFrontPath.quadraticBezierTo(
      size.width * 0.25, size.height * 0.65,
      size.width * 0.5, size.height * 0.72,
    );
    hillFrontPath.quadraticBezierTo(
      size.width * 0.75, size.height * 0.78,
      size.width, size.height * 0.7,
    );
    hillFrontPath.lineTo(size.width, size.height);
    hillFrontPath.lineTo(0, size.height);
    hillFrontPath.close();
    canvas.drawPath(hillFrontPath, hillFrontPaint);

    // === Nubes ===
    _drawCloud(canvas, Offset(size.width * 0.35, size.height * 0.28), size.width * 0.18);
    _drawCloud(canvas, Offset(size.width * 0.62, size.height * 0.22), size.width * 0.12);
    _drawCloud(canvas, Offset(size.width * 0.48, size.height * 0.38), size.width * 0.10);

    canvas.restore();

    // === Borde sutil del círculo ===
    final borderPaint = Paint()
      ..color = Colors.grey.withOpacity(0.15)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;
    canvas.drawCircle(center, radius - 0.75, borderPaint);
  }

  void _drawCloud(Canvas canvas, Offset position, double cloudSize) {
    final paint = Paint()..color = Colors.white.withOpacity(0.92);
    // Dibujar nube con múltiples círculos solapados
    canvas.drawCircle(position, cloudSize * 0.5, paint);
    canvas.drawCircle(
      Offset(position.dx - cloudSize * 0.4, position.dy + cloudSize * 0.1),
      cloudSize * 0.35,
      paint,
    );
    canvas.drawCircle(
      Offset(position.dx + cloudSize * 0.45, position.dy + cloudSize * 0.1),
      cloudSize * 0.38,
      paint,
    );
    canvas.drawCircle(
      Offset(position.dx + cloudSize * 0.15, position.dy - cloudSize * 0.15),
      cloudSize * 0.4,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
