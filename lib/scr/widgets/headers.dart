import 'package:flutter/material.dart';

class HeaderCuadrado extends StatelessWidget {
  const HeaderCuadrado({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(height: 300, color: Color(0xff615AAB));
  }
}

class HeaderBorderCircular extends StatelessWidget {
  const HeaderBorderCircular({super.key});

  @override
  Widget build(BuildContext context) {
    final double borde = 25;
    return Container(
      height: 300,
      decoration: BoxDecoration(
        color: Color(0xff615AAB),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(borde),
          bottomRight: Radius.circular(borde),
        ),
      ),
    );
  }
}

class HeaderDiagonal extends StatelessWidget {
  const HeaderDiagonal({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      // color: Color(0xff615AAB),
      child: CustomPaint(painter: _HeaderDiagonalPainter()),
    );
  }
}

class _HeaderDiagonalPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const height1 = 0.45;
    const height2 = 0.35;
    final paint = Paint();
    //Propiedades del pincel
    paint.color = Color(0xff615AAB);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 20;

    final path = Path();

    // dibujar con path y paint
    path.moveTo(0, size.height * height1);
    path.lineTo(size.width, size.height * height2);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderTriangule extends StatelessWidget {
  const HeaderTriangule({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: SizedBox(
        height: double.infinity,
        width: double.infinity,
        // color: Color(0xff615AAB),
        child: CustomPaint(painter: _HeaderTriangulePainter()),
      ),
    );
  }
}

class _HeaderTriangulePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    //Propiedades del pincel
    paint.color = Color(0xff615AAB);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 20;

    final path = Path();

    // dibujar con path y paint
    // path.moveTo(size.width, size.height);
    // path.lineTo(size.width, 0);
    // path.lineTo(0, 0);

    path.moveTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderPico extends StatelessWidget {
  const HeaderPico({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: SizedBox(
        height: double.infinity,
        width: double.infinity,
        // color: Color(0xff615AAB),
        child: CustomPaint(painter: _HeaderPicoPainter()),
      ),
    );
  }
}

class _HeaderPicoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = Color(0xff615AAB);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 20;

    const height1 = 0.35;
    const height2 = 0.45;

    final path = Path();
    path.lineTo(0, size.height * height1);
    path.lineTo(size.width * 0.5, size.height * height2);
    path.lineTo(size.width, size.height * height1);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderCurve extends StatelessWidget {
  const HeaderCurve({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: SizedBox(
        height: double.infinity,
        width: double.infinity,
        // color: Color(0xff615AAB),
        child: CustomPaint(painter: _HeaderCurvePainter()),
      ),
    );
  }
}

class _HeaderCurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = Color(0xff615AAB);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 20;

    const height1 = 0.25;
    const height2 = 0.40;
    final path = Path();
    path.lineTo(0, size.height * height1);
    path.quadraticBezierTo(
      // size.width * 0.5,
      // size.height * height2,
      size.width * 0.5,
      size.height * height2 * height1,
      size.width,
      size.height * height1,
    );
    path.lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderWave extends StatelessWidget {
  const HeaderWave({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: SizedBox(
        height: double.infinity,
        width: double.infinity,
        // color: Color(0xff615AAB),
        child: CustomPaint(painter: _HeaderWavePainter()),
      ),
    );
  }
}

class _HeaderWavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = Color(0xff615AAB);
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 10;

    const height1 = 0.20;
    const height2 = 0.10;
    final path = Path();
    path.moveTo(0, size.height);
    path.lineTo(0, size.height * (1 - height1));
    path.quadraticBezierTo(
      size.width * 0.25,
      size.height * (1 - height2),
      size.width * 0.5,
      size.height * (1 - height1),
    );
    path.quadraticBezierTo(
      size.width * 0.75,
      size.height * (1 - height1 - height2),
      size.width,
      size.height * (1 - height1),
    );
    path.lineTo(size.width, size.height);

    // path.moveTo(0, size.height);
    // path.lineTo(0, size.height);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class HeaderWaveGradient extends StatelessWidget {
  const HeaderWaveGradient({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: SizedBox(
        height: double.infinity,
        width: double.infinity,
        // color: Color(0xff615AAB),
        child: CustomPaint(painter: _HeaderWavePGradientainter()),
      ),
    );
  }
}

class _HeaderWavePGradientainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Gradient gradiente = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: <Color>[Color(0xff6D05E8), Color(0xffC012FF), Color(0xff6D05FA)],
      stops: [
        0.1,
        0.2,
        0.5,
      ]
    );

    final Rect rect = Rect.fromCircle(
      center: Offset(0, 125), 
      radius: 180);

    final paint = Paint()..shader = gradiente.createShader(rect);

    paint.color = Color(0xff615AAB);
    paint.style = PaintingStyle.fill;

    paint.strokeWidth = 10;

    const height1 = 0.20;
    const height2 = 0.10;
    final path = Path();
    path.moveTo(0, size.height);
    path.lineTo(0, size.height * (1 - height1));
    path.quadraticBezierTo(
      size.width * 0.25,
      size.height * (1 - height2),
      size.width * 0.5,
      size.height * (1 - height1),
    );
    path.quadraticBezierTo(
      size.width * 0.75,
      size.height * (1 - height1 - height2),
      size.width,
      size.height * (1 - height1),
    );
    path.lineTo(size.width, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
