import 'package:flutter/material.dart';
import 'dart:math';

class Tires extends StatelessWidget {
  final double oldWidth;
  final double oldAspectRatio;
  final double oldDiameter;
  final double newWidth;
  final double newAspectRatio;
  final double newDiameter;

  Tires({
    Key? key,
    required this.oldWidth,
    required this.oldAspectRatio,
    required this.oldDiameter,
    required this.newWidth,
    required this.newAspectRatio,
    required this.newDiameter,
  }) : super(key: key);

  double calculateSidewallHeight(double width, double aspectRatio) {
    return (aspectRatio / 100) * width;
  }

  double calculateOverallDiameter(double width, double aspectRatio, double diameter) {
    double sidewallHeight = calculateSidewallHeight(width, aspectRatio);
    double rimDiameterInMm = diameter * 25.4;
    return (2 * sidewallHeight) + rimDiameterInMm;
  }

  @override
  Widget build(BuildContext context) {
    double oldTireDiameter = calculateOverallDiameter(oldWidth, oldAspectRatio, oldDiameter);
    double newTireDiameter = calculateOverallDiameter(newWidth, newAspectRatio, newDiameter);

    return Scaffold(
      appBar: AppBar(title: Text("Tire Size Comparison")),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomPaint(
              size: Size(200, 200),
              painter: TirePainter(
                diameter: oldTireDiameter,
                sidewallHeight: calculateSidewallHeight(oldWidth, oldAspectRatio),
                rimDiameter: oldDiameter * 25.4,
              ),
            ),
            const SizedBox(width: 25),
            CustomPaint(
              size: Size(200, 200),
              painter: TirePainter(
                diameter: newTireDiameter,
                sidewallHeight: calculateSidewallHeight(newWidth, newAspectRatio),
                rimDiameter: newDiameter * 25.4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TirePainter extends CustomPainter {
  final double diameter;
  final double sidewallHeight;
  final double rimDiameter;

  TirePainter({
    required this.diameter,
    required this.sidewallHeight,
    required this.rimDiameter,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = size.center(Offset.zero);
    final overallRadius = diameter / 2;
    final sidewallRadius = overallRadius - sidewallHeight / 2;
    final rimRadius = rimDiameter / 2;

    double scaleFactor = size.width / (overallRadius * 2);

    // Outer Tire with radial gradient for curvature
    final tirePaint = Paint()
      ..shader = RadialGradient(
        colors: [Colors.black, Colors.black87, Colors.black54],
        stops: [0.6, 0.8, 1.0],
      ).createShader(Rect.fromCircle(center: center, radius: overallRadius * scaleFactor))
      ..style = PaintingStyle.fill;
    canvas.drawCircle(center, overallRadius * scaleFactor, tirePaint);

    // Sidewall with darker gradient to create depth
    final sidewallPaint = Paint()
      ..shader = RadialGradient(
        colors: [Colors.black, Colors.black87],
        stops: [0.7, 1.0],
      ).createShader(Rect.fromCircle(center: center, radius: overallRadius * scaleFactor))
      ..style = PaintingStyle.stroke
      ..strokeWidth = (overallRadius - sidewallRadius) * scaleFactor;
    canvas.drawCircle(center, overallRadius * scaleFactor, sidewallPaint);

    // Alloy Rim with metallic radial gradient
    final rimPaint = Paint()
      ..shader = RadialGradient(
        colors: [Colors.grey[400]!, Colors.grey[700]!],
        stops: [0.6, 1.0],
      ).createShader(Rect.fromCircle(center: center, radius: rimRadius * scaleFactor))
      ..style = PaintingStyle.fill;
    canvas.drawCircle(center, rimRadius * scaleFactor, rimPaint);

    // Tread Pattern for realism
    final treadPaint = Paint()
      ..color = Colors.black54
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    for (double i = 0; i < 360; i += 15) {
      final radian = i * (pi / 180);
      final treadStart = Offset(
        center.dx + sidewallRadius * 0.85 * cos(radian) * scaleFactor,
        center.dy + sidewallRadius * 0.85 * sin(radian) * scaleFactor,
      );
      final treadEnd = Offset(
        center.dx + overallRadius * cos(radian) * scaleFactor,
        center.dy + overallRadius * sin(radian) * scaleFactor,
      );
      canvas.drawLine(treadStart, treadEnd, treadPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
