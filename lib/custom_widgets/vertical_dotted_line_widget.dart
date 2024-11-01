import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:resturant_management/theme/app_colors.dart';

class DottedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.accent // Color of the line
      ..strokeWidth = 2.0; // Width of the line

    const gapWidth = 2.0; // Width of the gap
    const dashHeight = 2.0; // Height of the dash

    double yOffset = 0.0;
    while (yOffset < size.height) {
      canvas.drawLine(
        Offset(0, yOffset),
        Offset(0, yOffset + dashHeight),
        paint,
      );
      yOffset += dashHeight + gapWidth;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class VerticalDottedLine extends StatelessWidget {
  final double height;

  const VerticalDottedLine({required this.height});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(2.0, height),
      painter: DottedLinePainter(),
    );
  }
}