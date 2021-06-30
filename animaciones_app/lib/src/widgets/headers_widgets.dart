import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HeaderCuadrado extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.0,
      color: Colors.orangeAccent,
    );
  }
}

class HeaderBordesRedondeados extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.0,
      decoration: BoxDecoration(
        color: Colors.orangeAccent,
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50.0), bottomRight: Radius.circular(50.0)),
      ),
    );
  }
}

class HeaderDiagonal extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderDiagonalPainter(),
      ),
    );
  }
}

class _HeaderDiagonalPainter extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {
    final paint = new Paint();
    //Propiedades
    paint.color = Colors.orangeAccent;
    paint.style = PaintingStyle.fill; //.stroke
    paint.strokeWidth = 5.0;

    final path = new Path();
    //Dibujar con el path y el paint
    path.moveTo(0, size.height * 0.35);
    path.lineTo(size.width, size.height * 0.30);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}


class HeaderTriangular extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderTriangularPainter(),
      ),
    );
  }
}

class _HeaderTriangularPainter extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {
    final paint = new Paint();
    //Propiedades
    paint.color = Colors.orangeAccent;
    paint.style = PaintingStyle.fill; //.stroke
    paint.strokeWidth = 5.0;

    final path = new Path();
    //Dibujar con el path y el paint
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0); //Ejercicio original
   // path.lineTo(0, size.height);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}

class HeaderPico extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderPicoPainter(),
      ),
    );
  }
}

class _HeaderPicoPainter extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {
    final paint = new Paint();
    //Propiedades
    paint.color = Colors.orangeAccent;
    paint.style = PaintingStyle.fill; //.stroke
    paint.strokeWidth = 5.0;

    final path = new Path();
    //Dibujar con el path y el paint
    path.lineTo(0, size.height * 0.20);
    path.lineTo(size.width * 0.5, size.height * 0.25);
    path.lineTo(size.width, size.height * 0.20);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}

class HeaderCurvo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderCurvoPainter(),
      ),
    );
  }
}

class _HeaderCurvoPainter extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {
    final paint = new Paint();
    //Propiedades
    paint.color = Colors.orangeAccent;
    paint.style = PaintingStyle.fill; //.stroke
    paint.strokeWidth = 5.0;

    final path = new Path();
    //Dibujar con el path y el paint
    path.lineTo(0, size.height * 0.25);
    //path.lineTo(size.width, size.height * 0.25);
    path.quadraticBezierTo(size.width * 0.5, size.height * 0.55, size.width, size.height * 0.25);
    path.lineTo(size.width, 0);
    

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}


class HeaderWave extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderWavePainter(),
      ),
    );
  }
}

class _HeaderWavePainter extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {
    final paint = new Paint();
    //Propiedades
    paint.color = Colors.orangeAccent;
    paint.style = PaintingStyle.fill; //.stroke
    paint.strokeWidth = 5.0;

    final path = new Path();
    //Dibujar con el path y el paint
    path.lineTo(0, size.height * 0.25);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.30, size.width * 0.5, size.height * 0.25);
    path.quadraticBezierTo(size.width * 0.75, size.height * 0.20, size.width , size.height * 0.25);
    path.lineTo(size.width, 0);
    

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}


class HeaderWaveGradient extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _HeaderWavePainterGradient(),
      ),
    );
  }
}

class _HeaderWavePainterGradient extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {

    final Rect rect = new Rect.fromCircle(
      center: Offset(150.0, 55.0),
      radius: 180.0,
    );

    final Gradient gradiente = new LinearGradient(
      colors: <Color>[
        Colors.orange,
        Colors.orangeAccent,
        Colors.yellowAccent,
      ]
    );

    final paint = new Paint()..shader = gradiente.createShader(rect);
    //Propiedades
    paint.color = Colors.orangeAccent;
    paint.style = PaintingStyle.fill; //.stroke
    paint.strokeWidth = 5.0;

    final path = new Path();
    //Dibujar con el path y el paint
    path.lineTo(0, size.height * 0.25);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.30, size.width * 0.5, size.height * 0.25);
    path.quadraticBezierTo(size.width * 0.75, size.height * 0.20, size.width , size.height * 0.25);
    path.lineTo(size.width, 0);
    

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}


class IconHeader extends StatelessWidget {

  final IconData icon;
  final String titulo;
  final String subtitulo;
  final Color color1;
  final Color color2;

  const IconHeader({
    required this.icon,
    required this.titulo,
    required this.subtitulo,
    this.color1 = Colors.blue,
    this.color2 = Colors.blueGrey
  });


  @override
  Widget build(BuildContext context) {

    final Color colorBlanco = Colors.white.withOpacity(0.7);

    return Stack(
      children: [
        _IconHeaderBackground(color1: this.color1, color2: this.color2),
        Positioned(
          top: -50,
          left: -70,
          child: FaIcon(this.icon, size: 200.0, color: Colors.white.withOpacity(0.2)),
        ),

        Center(
          child: Column(
            children: [
              SizedBox(height: 80),
              Text(this.subtitulo, style: TextStyle(fontSize: 20,color: colorBlanco)),
              SizedBox(height: 20),
              Text(this.titulo, style: TextStyle(fontSize: 25,color: colorBlanco, fontWeight: FontWeight.bold)),
              SizedBox(height: 20),
              FaIcon(this.icon, size: 70.0, color: Colors.white),

            ],
          ),
        ),

      ],
    );
  }
}

class _IconHeaderBackground extends StatelessWidget {

  final Color color1;
  final Color color2;

  const _IconHeaderBackground({required this.color1, required this.color2});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(100)),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: <Color>[
            this.color1,
            this.color2,
          ],
        )
      ),
    );
  }
}


