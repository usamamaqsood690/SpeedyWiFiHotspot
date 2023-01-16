import 'package:flutter/material.dart';

class WifiWidget extends StatefulWidget {
  const WifiWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<WifiWidget> createState() => _WifiWidgetState();
}

class _WifiWidgetState extends State<WifiWidget> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class MyCustomePainter extends CustomPainter {
  final double height1;
  final double height2;
  final double height3;
  final double height4;

  MyCustomePainter(
      {required this.height1,
      required this.height2,
      required this.height3,
      required this.height4});

  @override
  void paint(Canvas canvas, Size size) {
    Color designColor = Colors.white;
    Paint firstPaint = Paint()
      ..color = designColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6;

    Paint secondPaint = Paint()
      ..color = designColor
      ..style = PaintingStyle.fill;

    Path firstPath = Path();
    firstPath.moveTo(0, size.height * height1);
    firstPath.arcToPoint(Offset(size.width, size.height * height1),
        radius: const Radius.circular(100));

    canvas.drawPath(firstPath, firstPaint);

    Path secondPath = Path();
    secondPath.moveTo(size.width * .16, size.height * height2);
    secondPath.arcToPoint(Offset(size.width * .84, size.height * height2),
        radius: Radius.circular(60));

    canvas.drawPath(secondPath, firstPaint);

    Path thirdPath = Path();
    thirdPath.moveTo(size.width * .33, size.height * height3);
    thirdPath.arcToPoint(Offset(size.width * .67, size.height * height3),
        radius: const Radius.circular(30));

    canvas.drawPath(thirdPath, firstPaint);

    canvas.drawCircle(
        Offset(size.width * .5, size.height * height4), 4, secondPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
