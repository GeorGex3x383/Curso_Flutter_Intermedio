import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:headers_app/src/theme/theme.dart';
import 'package:headers_app/src/widgets/slideshow.dart';
import 'package:provider/provider.dart';

class SlideShowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: MiSlideshow()),
          Expanded(child: MiSlideshow()),
        ],
      ),
    );
  }
}

class MiSlideshow extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final appTheme = Provider.of<ThemeChanger>(context);
    final accentColor = appTheme.currentTheme.accentColor;

    return Slideshow(
      bulletPrimario: 15,
      bulletSecundario: 12,
      //puntosArriba: false,
      colorPrimario: (appTheme.darkTheme) ? accentColor : Colors.orangeAccent,
      //colorSecundario: Colors.black,
      slides: [
        SvgPicture.asset('assets/svgs/1.svg'),
        SvgPicture.asset('assets/svgs/2.svg'),
        SvgPicture.asset('assets/svgs/3.svg'),
        SvgPicture.asset('assets/svgs/4.svg'),
        SvgPicture.asset('assets/svgs/5.svg'),
      ],
    );
  }
}