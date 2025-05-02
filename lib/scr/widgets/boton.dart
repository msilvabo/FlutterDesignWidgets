import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Boton extends StatelessWidget {
  final IconData icon;
  final String texto;
  final Color color1;
  final Color color2;
  const Boton({
    super.key,
    required this.icon,
    required this.texto,
    required this.color1,
    required this.color2,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        _BotonBackground(icon: icon, color1: color1,color2:color2),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 140, width: 40),
            FaIcon(icon, color: Colors.white, size: 40),
            SizedBox(width: 40),
            Expanded(
              child: Text(
                texto,
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
            FaIcon(FontAwesomeIcons.chevronRight, color: Colors.white),
            SizedBox(width: 40),
          ],
        ),
      ],
    );
  }
}

class _BotonBackground extends StatelessWidget {
  final IconData icon;
  final Color color1;
  final Color color2;
  _BotonBackground({required this.icon, required this.color1, required this.color2});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        // color: Colors.red,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withAlpha(50),
            offset: Offset(4, 6),
            blurRadius: 10,
          ),
        ],
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(
          colors: <Color>[color1, color2],
          // colors: <Color>[Color(0xff6989F5), Color(0xff906EF5)],
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          children: <Widget>[
            Positioned(
              right: -20,
              top: -20,
              child: FaIcon(
                icon,
                size: 150,
                color: Colors.white.withValues(alpha: 0.2),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
