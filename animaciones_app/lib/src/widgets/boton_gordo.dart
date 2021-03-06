import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class BotonGordo extends StatelessWidget {

  final IconData icon;
  final String texto;
  final Color color1;
  final Color color2;
  final Function()? onPressed;

  const BotonGordo({
    required this.icon,
    required this.texto,
    this.color1 = Colors.pink,
    this.color2 = Colors.pinkAccent,
    required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onPressed,
      child: Stack(
        children: [
          _BotonGordoBackground(icon: this.icon, color1: this.color1, color2: this.color2),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 140, width: 40),
              FaIcon(this.icon, color: Colors.white, size: 40),
              SizedBox(width: 20),
              Expanded(child: Text(this.texto, style: TextStyle(color: Colors.white, fontSize: 18),)),
              FaIcon(FontAwesomeIcons.chevronRight, color: Colors.white),
              SizedBox(width: 40),
            ],
          ),
        ],
      ),
    );
  }
}

class _BotonGordoBackground extends StatelessWidget {

  final IconData icon;
  final Color color1;
  final Color color2;

  const _BotonGordoBackground({required this.icon,required this.color1,required this.color2});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        child: Stack(
          children: [
            Positioned(
              right: -20,
              top: -20,
              child: FaIcon(this.icon, size: 150.0, color: Colors.white.withOpacity(0.2)),
            ),
          ],
        ),
      ),
      width: double.infinity,
      height: 100.0,
      margin: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.red,
        boxShadow: <BoxShadow> [
          BoxShadow(color: Colors.black.withOpacity(0.2), offset: Offset(4,6), blurRadius: 10),
        ],
        borderRadius: BorderRadius.circular(15.0),
        gradient: LinearGradient(
          colors: <Color>[
            this.color1,
            this.color2,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
    );
  }
}