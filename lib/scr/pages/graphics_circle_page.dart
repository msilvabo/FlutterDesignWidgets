import 'package:design_app/scr/theme/theme.dart';
import 'package:design_app/scr/widgets/radial_progress.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GraphicsCirclePage extends StatefulWidget {
  const GraphicsCirclePage({super.key});

  @override
  State<GraphicsCirclePage> createState() => _GraphicsCirclePageState();
}

class _GraphicsCirclePageState extends State<GraphicsCirclePage> {
  double porcentaje = 0.0;
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;
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
                  porcentaje: porcentaje,
                  colorPrimario: Colors.green,
                  colorSecundario: appTheme.textTheme.bodyLarge!.color!,
                  size: 100.0,
                  grosorPrimario: 10.0,
                  grosorSecundario: 10.0,
                  duracion: 1000,
                ),
                RadialProgress(
                  porcentaje: porcentaje * 1.2,
                  colorPrimario: Colors.blue,
                  colorSecundario: appTheme.textTheme.bodyLarge!.color!,
                  size: 250.0,
                  grosorPrimario: 10.0,
                  grosorSecundario: 10.0,
                  duracion: 5000,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RadialProgress(
                  porcentaje: porcentaje * 4,
                  colorPrimario: Colors.black,
                  colorSecundario: appTheme.textTheme.bodyLarge!.color!,
                  size: 300.0,
                  grosorPrimario: 10.0,
                  grosorSecundario: 10.0,
                  duracion: 4000,
                ),
                RadialProgress(
                  porcentaje: porcentaje * 6,
                  colorPrimario: Colors.orange,
                  colorSecundario: appTheme.textTheme.bodyLarge!.color!,
                  size: 200.0,
                  grosorPrimario: 10.0,
                  grosorSecundario: 10.0,
                  duracion: 3000,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
