import 'package:flutter/material.dart';

class SquareAnimatePage extends StatelessWidget {
  const SquareAnimatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: _CuadradoAnimado()));
  }
}

class _CuadradoAnimado extends StatefulWidget {
  const _CuadradoAnimado();

  @override
  State<_CuadradoAnimado> createState() => __CuadradoAnimadoState();
}

class __CuadradoAnimadoState extends State<_CuadradoAnimado>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  late Animation<double> moverDerecha;
  late Animation<double> moverArriba;
  late Animation<double> moverIzquierda;
  late Animation<double> moverAbajo;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 4000),
    );

    moverDerecha = Tween(begin: 0.0, end: 200.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.0, 0.25, curve: Curves.bounceOut),
      ),
    );
    moverArriba = Tween(begin: 0.0, end: 200.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.25, 0.5, curve: Curves.bounceOut),
      ),
    );
    moverIzquierda = Tween(begin: 0.0, end: 200.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.5, 0.75, curve: Curves.bounceOut),
      ),
    );
    moverAbajo = Tween(begin: 0.0, end: 200.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.75, 1.0, curve: Curves.bounceOut),
      ),
    );

    controller.addListener(() {
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
      builder: (BuildContext context, Widget? child) {
        return Transform.translate(
          offset: Offset(0.0, moverAbajo.value),
          child: Transform.translate(
            offset: Offset(moverIzquierda.value * -1, 0.0),
            child: Transform.translate(
              offset: Offset(0.0, (moverArriba.value * -1) ),
              child: Transform.translate(
                offset: Offset(moverDerecha.value, 0.0),
                child: child,
              ),
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
      decoration: BoxDecoration(color: Colors.green),
    );
  }
}
