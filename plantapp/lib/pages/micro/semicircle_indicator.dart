import 'package:flutter/material.dart';
import 'dart:math';

class CustomSemicircularIndicator extends StatelessWidget {
  final double radius;
  final double progress;
  final Color color;
  final Color backgroundColor;
  final double strokeWidth;
  final Widget child;

  CustomSemicircularIndicator({
    required this.radius,
    required this.progress,
    required this.color,
    required this.backgroundColor,
    required this.strokeWidth,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(radius * 2, radius),
      painter: _SemicircularPainter(
        progress: progress,
        color: color,
        backgroundColor: backgroundColor,
        strokeWidth: strokeWidth,
      ),
      child: Center(child: child),
    );
  }
}

class _SemicircularPainter extends CustomPainter {
  final double progress;
  final Color color;
  final Color backgroundColor;
  final double strokeWidth;

  _SemicircularPainter({
    required this.progress,
    required this.color,
    required this.backgroundColor,
    required this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint backgroundPaint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round; // Set stroke cap to round

    final Paint progressPaint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    final double radius = size.width / 2;
    final Offset center = Offset(size.width / 2, size.height);

    // Draw background arc
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      pi,
      pi,
      false,
      backgroundPaint,
    );

    // Draw progress arc
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      pi,
      pi * progress,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
