import 'package:finance_app/commons/color_extension.dart';
import 'package:vector_math/vector_math.dart';
import 'package:flutter/material.dart';

class ArcValueModel {
  final Color color;
  final double value;

  ArcValueModel({required this.color, required this.value});
}

class CustomArcPainterSpend extends CustomPainter {
  final double start;
  final double end;
  final double width;
  final double bgwidth;
  final double blurWidth;
  final double space;
  final List<ArcValueModel> drawAr;

  CustomArcPainterSpend(
      {this.start = 0,
      required this.drawAr,
      this.space = 4,
      this.end = 180,
      this.width = 15,
      this.bgwidth = 10,
      this.blurWidth = 6});

  @override
  void paint(Canvas canvas, Size size) {
    var rect = Rect.fromCircle(
        center: Offset(size.width / 2, size.height), radius: size.width / 2);

    Paint backgroundPaint = Paint();
    backgroundPaint.color = TColor.gray60.withOpacity(.5);
    backgroundPaint.style = PaintingStyle.stroke;
    backgroundPaint.strokeWidth = bgwidth;
    backgroundPaint.strokeCap = StrokeCap.round;

    var startVal = 180 + start;
    var drawStart = startVal;

    canvas.drawArc(
        rect, radians(startVal), radians(180), false, backgroundPaint);

    for (var arcObj in drawAr) {
      Paint activePaint = Paint();
      activePaint.color = arcObj.color;
      activePaint.style = PaintingStyle.stroke;
      activePaint.strokeWidth = width;
      activePaint.strokeCap = StrokeCap.round;

      Paint shadowPaint = Paint()
        ..color = arcObj.color.withOpacity(.3)
        ..style = PaintingStyle.stroke
        ..strokeWidth = width + blurWidth
        ..maskFilter = MaskFilter.blur(BlurStyle.normal, 5);

      Path path = Path();
      path.addArc(rect, radians(drawStart), arcObj.value - space);
      // canvas.drawPath(path, shadowPaint);
      canvas.drawArc(rect, radians(drawStart), radians(arcObj.value - space),
          false, activePaint);
      drawStart = drawStart + arcObj.value + space;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
