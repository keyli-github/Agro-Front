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
    this.gapAngleFactor = 0.15,
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
          // Círculo de fondo con el gap en la parte inferior
          CustomPaint(
            size: Size(size, size),
            painter: _BackgroundCirclePainter(
              backgroundColor: backgroundColor,
              gapAngleFactor: gapAngleFactor,
            ),
          ),
          // Indicador circular de progreso
          CustomPaint(
            size: Size(size, size),
            painter: _CircleProgressPainter(
              progress: progress,
              progressColor: progressColor,
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
          // Indicador de progreso en la parte inferior
          Positioned(
            bottom: size * 0.08,
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: size * 0.14,
                vertical: size * 0.04,
              ),
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

class _BackgroundCirclePainter extends CustomPainter {
  final Color backgroundColor;
  final double gapAngleFactor;

  _BackgroundCirclePainter({
    required this.backgroundColor,
    required this.gapAngleFactor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 4;

    final paint = Paint()
      ..color = backgroundColor
      ..strokeWidth = 8
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    // Ángulo del gap en radianes
    final double gapAngle = 2 * math.pi * gapAngleFactor;
    
    // El gap debe estar más abajo, cerca de donde está el badge "1/3"
    // π/2 es 90° (abajo), pero necesitamos ir más hacia abajo aún
    // Vamos a usar aproximadamente 105° a 120° (entre 7 y 8 en punto del reloj)
    final double gapCenterAngle = (math.pi / 2) + (math.pi / 8); // ~100°
    
    // Calcular inicio y fin del gap
    final double gapStart = gapCenterAngle - (gapAngle / 2);
    final double gapEnd = gapCenterAngle + (gapAngle / 2);
    
    // Dibujar desde el final del gap hasta completar el círculo (menos el gap)
    final double sweepAngle = (2 * math.pi) - gapAngle;
    
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      gapEnd,
      sweepAngle,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _CircleProgressPainter extends CustomPainter {
  final double progress;
  final Color progressColor;
  final double gapAngleFactor;

  _CircleProgressPainter({
    required this.progress,
    required this.progressColor,
    required this.gapAngleFactor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (progress <= 0) return;
    
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 4;

    final paint = Paint()
      ..color = progressColor
      ..strokeWidth = 8
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    final double gapAngle = 2 * math.pi * gapAngleFactor;
    final double gapCenterAngle = (math.pi / 2) + (math.pi / 8);
    final double gapStart = gapCenterAngle - (gapAngle / 2);
    final double gapEnd = gapCenterAngle + (gapAngle / 2);
    
    // Ángulo disponible (sin el gap)
    final double availableAngle = (2 * math.pi) - gapAngle;
    
    // Cuánto progreso dibujar
    final double progressAngle = progress * availableAngle;
    
    // Empezar desde la izquierda (π) e ir antihorario
    final double startAngle = math.pi;
    
    // Calcular distancia hasta el gap (en antihorario desde π hasta gapStart)
    double distanceToGap = startAngle - gapStart;
    if (distanceToGap < 0) {
      distanceToGap += 2 * math.pi;
    }
    
    if (progressAngle <= distanceToGap) {
      // No llega al gap
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startAngle,
        -progressAngle,
        false,
        paint,
      );
    } else {
      // Cruza el gap - dibujar en dos partes
      
      // Parte 1: desde startAngle hasta gapStart
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startAngle,
        -distanceToGap,
        false,
        paint,
      );
      
      // Parte 2: desde gapEnd con el progreso restante
      final double remainingProgress = progressAngle - distanceToGap;
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        gapEnd,
        -remainingProgress,
        false,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}