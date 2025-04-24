import 'package:design_app/scr/widgets/radial_progress.dart';
import 'package:flutter/material.dart';

class GraphicsCirclePage extends StatefulWidget {
  const GraphicsCirclePage({super.key});

  @override
  State<GraphicsCirclePage> createState() => _GraphicsCirclePageState();
}

class _GraphicsCirclePageState extends State<GraphicsCirclePage> {
  double porcentaje = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: () {
          setState(() {
            porcentaje += 10;
            if (porcentaje > 100) {
              porcentaje = 0;
            }
          });
        },
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                  RadialProgress( 
                        porcentaje:porcentaje, 
                        colorPrimario: Colors.green, 
                        colorSecundario: Colors.red, 
                        size:100.0, 
                        grosorPrimario: 10.0, 
                        grosorSecundario: 10.0, 
                        duracion: 1000),
                  RadialProgress( 
                        porcentaje:porcentaje, 
                        colorPrimario: Colors.blue, 
                        colorSecundario: Colors.green, 
                        size:250.0, 
                        grosorPrimario: 10.0, 
                        grosorSecundario: 10.0, 
                        duracion: 5000),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                  RadialProgress( 
                        porcentaje:porcentaje, 
                        colorPrimario: Colors.black, 
                        colorSecundario: Colors.yellow, 
                        size:300.0, 
                        grosorPrimario: 10.0, 
                        grosorSecundario: 10.0, 
                        duracion: 4000),
                  RadialProgress( 
                        porcentaje:porcentaje, 
                        colorPrimario: Colors.orange, 
                        colorSecundario: Colors.red, 
                        size:200.0, 
                        grosorPrimario: 10.0, 
                        grosorSecundario: 10.0, 
                        duracion: 3000),
              ],
            ),
          ]
        ),
      ),
    );
  }
}
