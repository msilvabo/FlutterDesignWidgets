import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class CircularProgressPage extends StatefulWidget {
  const CircularProgressPage({super.key});

  @override
  State<CircularProgressPage> createState() => _CircularProgressPageState();
}

class _CircularProgressPageState extends State<CircularProgressPage>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  double porcentaje = 10;
  double nuevoPorcentaje = 0.0;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
    );

    controller.addListener(() {
      print(' valor controller ${controller.value}');
      setState(() {
        porcentaje = lerpDouble(porcentaje, nuevoPorcentaje, controller.value)!;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        onPressed: () {
          porcentaje = nuevoPorcentaje;
          nuevoPorcentaje += 10.0;
          if (nuevoPorcentaje > 100) {
            nuevoPorcentaje = 0;
            porcentaje = 0;
          }
          controller.forward(from: 0.0);
          setState(() {});
        },
        child: Icon(Icons.refresh),
      ),

      body: Center(
        child: Container(
          padding: EdgeInsets.all(5),
          width: 300,
          height: 300,
          // color: Colors.red,
          child: CustomPaint(
            painter: _MyRadialProgress(porcentaje: porcentaje),
          ),
        ),
      ),
    );
  }
}

class _MyRadialProgress extends CustomPainter {
  final porcentaje;

  _MyRadialProgress({this.porcentaje = 40});

  @override
  void paint(Canvas canvas, Size size) {
    //circulo completado
    final paint =
        Paint()
          ..strokeWidth = 3
          ..color = Colors.grey
          ..style = PaintingStyle.stroke;

    final center = Offset(size.width * 0.5, size.height * 0.5);
    final radio = min(size.width * 0.5, size.height * 0.5);
    canvas.drawCircle(center, radio, paint);

    // Arco
    final paintArco =
        Paint()
          ..strokeWidth = 8
          ..color = Colors.orange
          ..style = PaintingStyle.stroke;

    double arcAngle = 2 * pi * porcentaje / 100;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radio),
      -pi / 2,
      arcAngle,
      false,
      paintArco,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
