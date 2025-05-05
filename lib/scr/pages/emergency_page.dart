import 'package:animate_do/animate_do.dart';
import 'package:design_app/scr/widgets/big_header.dart';
import 'package:design_app/scr/widgets/boton.dart';
// import 'package:design_app/scr/widgets/headers.dart';
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
      ItemBoton(
        FontAwesomeIcons.carBurst,
        'Motor Accident',
        Color(0xff6989F5),
        Color(0xff906EF5),
      ),
      ItemBoton(
        FontAwesomeIcons.plus,
        'Medical Emergency',
        Color(0xff66A9F2),
        Color(0xff536CF6),
      ),
      ItemBoton(
        FontAwesomeIcons.masksTheater,
        'Theft / Harrasement',
        Color(0xffF2D572),
        Color(0xffE06AA3),
      ),
      ItemBoton(
        FontAwesomeIcons.personBiking,
        'Awards',
        Color(0xff317183),
        Color(0xff46997D),
      ),
      ItemBoton(
        FontAwesomeIcons.carBurst,
        'Motor Accident',
        Color(0xff6989F5),
        Color(0xff906EF5),
      ),
      ItemBoton(
        FontAwesomeIcons.plus,
        'Medical Emergency',
        Color(0xff66A9F2),
        Color(0xff536CF6),
      ),
      ItemBoton(
        FontAwesomeIcons.masksTheater,
        'Theft / Harrasement',
        Color(0xffF2D572),
        Color(0xffE06AA3),
      ),
      ItemBoton(
        FontAwesomeIcons.personBiking,
        'Awards',
        Color(0xff317183),
        Color(0xff46997D),
      ),
      ItemBoton(
        FontAwesomeIcons.carBurst,
        'Motor Accident',
        Color(0xff6989F5),
        Color(0xff906EF5),
      ),
      ItemBoton(
        FontAwesomeIcons.plus,
        'Medical Emergency',
        Color(0xff66A9F2),
        Color(0xff536CF6),
      ),
      ItemBoton(
        FontAwesomeIcons.masksTheater,
        'Theft / Harrasement',
        Color(0xffF2D572),
        Color(0xffE06AA3),
      ),
      ItemBoton(
        FontAwesomeIcons.personBiking,
        'Awards',
        Color(0xff317183),
        Color(0xff46997D),
      ),
    ];

     List<Widget> itemMap = 
        items.map((e) => FadeInLeft(
                          duration: Duration(milliseconds: 550),
                          child: Boton( 
                                    icon: e.icon,
                                    texto: e.texto,
                                    color1: e.color1,
                                    color2:e.color2
                                    ))).toList();

    return Scaffold(
      body: Stack(
        children: [
          ListaBotones(itemMap: itemMap),
          Encabezado(),
        ],
      ),
    );
  }
}

class ListaBotones extends StatelessWidget {
  const ListaBotones({
    super.key,
    required this.itemMap,
  });

  final List<Widget> itemMap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 250),
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          SizedBox(height: 30),
          ...itemMap
          ]
        ),
    );
  }
}

class Encabezado extends StatelessWidget {
  const Encabezado({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconHeader(
          icon: FontAwesomeIcons.plus,
          titulo: 'Asistencia Médica',
          subtitulo: 'Has Solicitado',
          color1: Color(0xff526BF6),
          color2: Color(0xff67ACF2),
        ),
        Positioned(
          right: 0,
          top: 40,
          child: RawMaterialButton(
            onPressed: (){},
            shape: CircleBorder(),
            padding: EdgeInsets.all(15),
            child: FaIcon(FontAwesomeIcons.ellipsisVertical,color: Colors.white))
            )

      ],
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
