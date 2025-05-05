import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class IconHeader extends StatelessWidget {
  final IconData icon;
  final String titulo;
  final String subtitulo;
  final Color color1;
  final Color color2;

  const IconHeader({super.key, required this.icon, required this.titulo, required this.subtitulo, this.color1 = Colors.grey, this.color2 = Colors.blueGrey});

  @override
  Widget build(BuildContext context) {
    final Color colorBlanco = Colors.white.withValues(alpha: 0.7);

    return Stack(
      children: <Widget>[
        _IconHeaderBackground(color1: color1, color2: color2),
        Positioned(
          left: -50,
          top: -70,
          child: FaIcon(
            icon,
            size: 270,
            color: Colors.white.withValues(alpha: 0.2),
          ),
        ),
        Column(
          children: <Widget>[
            SizedBox(height: 80, width: double.infinity),
            Text(
              titulo,
              style: TextStyle(fontSize: 20, color: colorBlanco),
            ),
            SizedBox(height: 20),
            Text(
              subtitulo,
              style: TextStyle(
                fontSize: 25,
                color: colorBlanco,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 15),
            FaIcon(icon, size: 90, color: Colors.white),
          ],
        ),
      ],
    );
  }
}

class _IconHeaderBackground extends StatelessWidget {
  final Color color1;
  final Color color2;  
  const _IconHeaderBackground({ required this.color1, required this.color2});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(80)),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: <Color>[color1, color2],
          // colors: <Color>[Color(0xff526BF6), Color(0xff67ACF2)],
        ),
      ),
    );
  }
}
