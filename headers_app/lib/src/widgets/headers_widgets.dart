import 'package:flutter/material.dart';

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


