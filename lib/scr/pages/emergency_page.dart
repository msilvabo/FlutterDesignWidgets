import 'package:design_app/scr/widgets/big_header.dart';
import 'package:design_app/scr/widgets/boton.dart';
import 'package:design_app/scr/widgets/headers.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ItemBoton {
  final IconData icon;
  final String texto;
  final Color color1;
  final Color color2;

  ItemBoton(this.icon, this.texto, this.color1, this.color2);
}

class EmergencyPage extends StatelessWidget {
  const EmergencyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final items = <ItemBoton>[
      new ItemBoton(
        FontAwesomeIcons.carCrash,
        'Motor Accident',
        Color(0xff6989F5),
        Color(0xff906EF5),
      ),
      new ItemBoton(
        FontAwesomeIcons.plus,
        'Medical Emergency',
        Color(0xff66A9F2),
        Color(0xff536CF6),
      ),
      new ItemBoton(
        FontAwesomeIcons.theaterMasks,
        'Theft / Harrasement',
        Color(0xffF2D572),
        Color(0xffE06AA3),
      ),
      new ItemBoton(
        FontAwesomeIcons.biking,
        'Awards',
        Color(0xff317183),
        Color(0xff46997D),
      ),
      new ItemBoton(
        FontAwesomeIcons.carCrash,
        'Motor Accident',
        Color(0xff6989F5),
        Color(0xff906EF5),
      ),
      new ItemBoton(
        FontAwesomeIcons.plus,
        'Medical Emergency',
        Color(0xff66A9F2),
        Color(0xff536CF6),
      ),
      new ItemBoton(
        FontAwesomeIcons.theaterMasks,
        'Theft / Harrasement',
        Color(0xffF2D572),
        Color(0xffE06AA3),
      ),
      new ItemBoton(
        FontAwesomeIcons.biking,
        'Awards',
        Color(0xff317183),
        Color(0xff46997D),
      ),
      new ItemBoton(
        FontAwesomeIcons.carCrash,
        'Motor Accident',
        Color(0xff6989F5),
        Color(0xff906EF5),
      ),
      new ItemBoton(
        FontAwesomeIcons.plus,
        'Medical Emergency',
        Color(0xff66A9F2),
        Color(0xff536CF6),
      ),
      new ItemBoton(
        FontAwesomeIcons.theaterMasks,
        'Theft / Harrasement',
        Color(0xffF2D572),
        Color(0xffE06AA3),
      ),
      new ItemBoton(
        FontAwesomeIcons.biking,
        'Awards',
        Color(0xff317183),
        Color(0xff46997D),
      ),
    ];

     List<Widget> itemMap = items.map((e) => Boton(icon: e.icon,texto: e.texto,color1: e.color1,color2:e.color2)).toList();

    return Scaffold(
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: 300),
            child: ListView(children: itemMap,),
            // child: ListView(children: <Widget>[
            //   Boton(
            //   icon: FontAwesomeIcons.carBurst,
            //   texto: 'Motor Accident',
            //   color1: Color(0xff6989F5),
            //   color2:  Color(0xff906EF5),
            // )]),
          ),
          IconHeader(
            icon: FontAwesomeIcons.plus,
            titulo: 'Asistencia Médica',
            subtitulo: 'Has Solicitado',
            color1: Color(0xff526BF6),
            color2: Color(0xff67ACF2),
          ),
        ],
      ),
    );
  }
}

class PageHeader extends StatelessWidget {
  const PageHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return IconHeader(
      icon: FontAwesomeIcons.plus,
      titulo: 'Has Solicitado',
      subtitulo: 'Atencion Medica',
      color1: Color(0xff526BF6),
      color2: Color(0xff67ACF2),
    );
  }
}
