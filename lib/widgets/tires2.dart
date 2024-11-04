import 'package:flutter/material.dart';

class TireComparison extends StatelessWidget {
  final double oldTireDiameter;
  final double oldAspectRatio;
  final double oldRimDiameter;

  final double newTireDiameter;
  final double newAspectRatio;
  final double newRimDiameter;

  TireComparison({
    required this.oldTireDiameter,
    required this.oldAspectRatio,
    required this.oldRimDiameter,
    required this.newTireDiameter,
    required this.newAspectRatio,
    required this.newRimDiameter,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 200, // Adjust height as needed
      child: CustomPaint(
        painter: TireComparisonPainter(
          oldTireDiameter: oldTireDiameter,
          oldAspectRatio: oldAspectRatio,
          oldRimDiameter: oldRimDiameter,
          newTireDiameter: newTireDiameter,
          newAspectRatio: newAspectRatio,
          newRimDiameter: newRimDiameter,
        ),
      ),
    );
  }
}

class TireComparisonPainter extends CustomPainter {
  final double oldTireDiameter;
  final double oldAspectRatio;
  final double oldRimDiameter;

  final double newTireDiameter;
  final double newAspectRatio;
  final double newRimDiameter;

  TireComparisonPainter({
    required this.oldTireDiameter,
    required this.oldAspectRatio,
    required this.oldRimDiameter,
    required this.newTireDiameter,
    required this.newAspectRatio,
    required this.newRimDiameter,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..color = Colors.black
      ..strokeWidth = 2;

    // Calculate tire heights and sidewall heights
    final oldTireRadius = oldTireDiameter / 2;
    final oldSidewallHeight = oldTireRadius * oldAspectRatio;
    final newTireRadius = newTireDiameter / 2;
    final newSidewallHeight = newTireRadius * newAspectRatio;

    // Draw old tire on the left
    final oldTireCenter = Offset(size.width / 4, size.height / 2);
    drawTireFront(canvas, oldTireCenter, oldTireDiameter, oldSidewallHeight, oldRimDiameter, paint);

    // Draw new tire on the right
    final newTireCenter = Offset(size.width * 3 / 4, size.height / 2);
    drawTireFront(canvas, newTireCenter, newTireDiameter, newSidewallHeight, newRimDiameter, paint);
  }

  void drawTireFront(Canvas canvas, Offset center, double diameter, double sidewallHeight, double rimDiameter, Paint paint) {
    // Calculate dimensions
    final tireRadius = diameter / 2;
    final rimRadius = rimDiameter / 2;

    // Draw outer profile (tire)
    canvas.drawCircle(center, tireRadius, paint);

    // Draw inner profile (sidewall)
    final sidewallOffset = tireRadius - sidewallHeight;
    canvas.drawCircle(center, sidewallOffset, paint);

    // Draw rim
    final rimPaint = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.grey;
    canvas.drawCircle(center, rimRadius, rimPaint);

    // Draw thickness indicators
    drawThicknessIndicator(canvas, center, tireRadius, sidewallHeight, paint);
  }

  void drawThicknessIndicator(Canvas canvas, Offset center, double tireRadius, double sidewallHeight, Paint paint) {
    // Draw left thickness indicator
    final leftThicknessRect = Rect.fromCenter(
      center: Offset(center.dx - tireRadius, center.dy),
      width: 5,
      height: sidewallHeight,
    );
    canvas.drawRect(leftThicknessRect, paint);

    // Draw right thickness indicator
    final rightThicknessRect = Rect.fromCenter(
      center: Offset(center.dx + tireRadius, center.dy),
      width: 5,
      height: sidewallHeight,
    );
    canvas.drawRect(rightThicknessRect, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
