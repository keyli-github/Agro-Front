import 'package:flutter/material.dart';
import 'package:agro/core/theme/app_theme.dart';
import 'dart:math' as math;

class ProgressCircleIndicator extends StatelessWidget {
  final int currentLevel;
  final int totalLevels;
  final double size;
  final Color progressColor;
  final Color backgroundColor;
  final double gapAngleFactor;

  const ProgressCircleIndicator({
    super.key,
    required this.currentLevel,
    required this.totalLevels,
    this.size = 150,
    this.progressColor = AppColors.actionGreen,
    this.backgroundColor = const Color(0xFFE8E8E8),
    this.gapAngleFactor = 0.28,
  });

  @override
  Widget build(BuildContext context) {
    final progress = currentLevel / totalLevels;

    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Círculo de fondo
          Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.transparent,
              border: Border.all(color: backgroundColor, width: 8),
            ),
          ),
          // Indicador circular de progreso
          CustomPaint(
            size: Size(size, size),
            painter: _CircleProgressPainter(
              progress: progress,
              progressColor: progressColor,
              backgroundColor: backgroundColor,
              gapAngleFactor: gapAngleFactor,
            ),
          ),
          // Número central del nivel
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                currentLevel.toString(),
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: size * 0.4,
                ),
              ),
            ],
          ),
            // Indicador de progreso en la parte inferior (posicionado proporcionalmente)
            Positioned(
              bottom: size * 0.08,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: size * 0.14, vertical: size * 0.04),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(size * 0.25),
                ),
                child: Text(
                  '$currentLevel/$totalLevels',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: size * 0.10,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _CircleProgressPainter extends CustomPainter {
  final double progress;
  final Color progressColor;
  final Color backgroundColor;
  final double gapAngleFactor;

  _CircleProgressPainter({
    required this.progress,
    required this.progressColor,
    required this.backgroundColor,
    required this.gapAngleFactor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 4;

    // Dibujar el arco de progreso
    final paint = Paint()
      ..color = progressColor
      ..strokeWidth = 8
        ..strokeCap = StrokeCap.butt
      ..style = PaintingStyle.stroke;

    // Calcular el ángulo basado en el progreso
    // Comienza desde la parte superior (-90 grados = -pi/2)
    final double twoPi = 2 * math.pi;
    final double startAngle = -math.pi / 2;
    final double sweepAngle = (progress * twoPi);

    // Reservar una pequeña área en la parte inferior para colocar el badge
    final double gapAngle = math.pi * gapAngleFactor;
    final double gapCenter = math.pi / 2; // bottom center
    double gapStart = gapCenter - gapAngle / 2;
    double gapEnd = gapCenter + gapAngle / 2;

    double endAngle = startAngle + sweepAngle;

    while (gapEnd < startAngle) {
      gapStart += twoPi;
      gapEnd += twoPi;
    }

    if (endAngle <= gapStart) {
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startAngle,
        endAngle - startAngle,
        false,
        paint,
      );
    } else {
      if (gapStart > startAngle) {
        canvas.drawArc(
          Rect.fromCircle(center: center, radius: radius),
          startAngle,
          gapStart - startAngle,
          false,
          paint,
        );
      }
      if (endAngle > gapEnd) {
        canvas.drawArc(
          Rect.fromCircle(center: center, radius: radius),
          gapEnd,
          endAngle - gapEnd,
          false,
          paint,
        );
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
