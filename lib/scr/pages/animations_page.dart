import 'package:flutter/material.dart';
import 'dart:math' as math;

class AnimationsPage extends StatelessWidget {
  const AnimationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: AnimatedSquare()));
  }
}

class AnimatedSquare extends StatefulWidget {
  const AnimatedSquare({super.key});

  @override
  State<AnimatedSquare> createState() => _AnimatedSquareState();
}

class _AnimatedSquareState extends State<AnimatedSquare>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> rotacion;
  late Animation<double> opacidad;
  late Animation<double> opacidadOut;
  late Animation<double> moverDerecha;
  late Animation<double> agrandar;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 5000),
    );

    rotacion = Tween(
      begin: 0.0,
      end: 2.0 * math.pi,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));

    opacidad = Tween(begin: 0.1, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.25, 0.5, curve: Curves.easeOut),
      ),
    );

    opacidadOut = Tween(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.75, 1.0, curve: Curves.easeOut),
      ),
    );

    moverDerecha = Tween(begin: 0.0, end: 400.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.25, 0.5, curve: Curves.easeOut),
      ),
    );

    agrandar = Tween(begin: 0.0, end: 2.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.25, 1, curve: Curves.easeOut),
      ),
    );


    controller.addListener(() {
      // print('Rotacion: ${rotacion.value}');
      // print('Opacidad: ${opacidad.value}');
      // print('Opacidad: ${controller.status}');
      
      if (controller.status == AnimationStatus.completed) {
        controller.reverse();
      }
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
    controller.forward();

    return AnimatedBuilder(
      animation: controller,
      child: _Rectangulo(),
      builder: (BuildContext context, Widget? childSquare) {
        return Opacity(
          opacity: opacidadOut.value,
          child: Transform.translate(
            offset: Offset(moverDerecha.value, 0),
            child: Transform.rotate(
              angle: rotacion.value,
              child: Opacity(
                opacity: opacidad.value, 
                child: Transform.scale(
                  scale: agrandar.value,
                  child: childSquare
                  )),
            ),
          ),
        );
      },
    );
  }
}

class _Rectangulo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(color: Colors.blue),
    );
  }
}
