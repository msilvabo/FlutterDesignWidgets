import 'dart:math';

import 'package:flutter/material.dart';

class RadialProgress extends StatefulWidget {
  final porcentaje;
  final Color colorPrimario;
  final Color colorSecundario;
  final double size;
  final double grosorPrimario;
  final double grosorSecundario;
  final int duracion;
  const RadialProgress({
    super.key,
    required this.porcentaje,
    this.colorPrimario = Colors.blue,
    required this.colorSecundario,
    required this.size,
    required this.grosorPrimario,
    required this.grosorSecundario,
    required this.duracion,
  });

  @override
  State<RadialProgress> createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late double porcentajeAnterior;

  @override
  void initState() {
    porcentajeAnterior = widget.porcentaje;
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: widget.duracion),
    )..repeat();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // controller.forward(from: 0.0);

    final diferenciaAnimar = widget.porcentaje - porcentajeAnterior;
    porcentajeAnterior = widget.porcentaje;
    print(' widget.size ${widget.size}');
    print(' double.infinity ${double.infinity}');
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Container(
          padding: EdgeInsets.all(10),
          width: widget.size, //double.infinity,
          height: widget.size, //double.infinity,
          child: CustomPaint(
            painter: _MyRadialProgress(
              porcentaje: controller.value * 100,
              // porcentaje:
              //     (widget.porcentaje - diferenciaAnimar) +
              //     (diferenciaAnimar * controller.value),
              color: widget.colorPrimario,
              color2: widget.colorSecundario,
              grosorPrimario: widget.grosorPrimario,
              grosorSecundario: widget.grosorSecundario,
            ),
            // painter: _MyRadialProgress(porcentaje: widget.porcentaje),
          ),
        );
      },
    );
  }
}

class _MyRadialProgress extends CustomPainter {
  final double porcentaje;
  final Color color;
  final Color color2;
  final double grosorSecundario;
  final double grosorPrimario;

  _MyRadialProgress({
    required this.color,
    required this.color2,
    this.porcentaje = 40,
    required this.grosorSecundario,
    required this.grosorPrimario,
  });

  @override
  void paint(Canvas canvas, Size size) {

    final Gradient gradiente = LinearGradient(
      colors: <Color>[
        color,
        color2,
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );

    final Rect rect = Rect.fromCircle(center: Offset(0,0), radius: 180);

    //circulo completado
    final paint =
        Paint()
          ..strokeWidth = grosorSecundario
          ..color = color2.withAlpha(70)
          ..style = PaintingStyle.stroke;

    final center = Offset(size.width * 0.5, size.height * 0.5);
    final radio = min(size.width * 0.5, size.height * 0.5);
    canvas.drawCircle(center, radio, paint);

    // Arco
    final paintArco =
        Paint()
          ..strokeWidth = grosorPrimario
          ..color = color.withAlpha(170)
          // ..shader = gradiente.createShader(rect)
          ..strokeCap = StrokeCap.round
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
