import 'package:flutter/material.dart';
import 'package:headers_app/src/theme/theme.dart';
import 'package:headers_app/src/widgets/radial_progress.dart';
import 'package:provider/provider.dart';


class GraficasCircularesPage extends StatefulWidget {

  @override
  _GraficasCircularesPageState createState() => _GraficasCircularesPageState();
}

class _GraficasCircularesPageState extends State<GraficasCircularesPage> {

  double porcentaje = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh_rounded),
        onPressed: (){
          setState(() {
            porcentaje+=10;
            if(porcentaje>100){
              porcentaje = 0.0;
            }
          });
        },
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomRadialProgress(porcentaje: porcentaje, color: Colors.greenAccent),
              CustomRadialProgress(porcentaje: porcentaje * 1.2, color: Colors.indigoAccent),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomRadialProgress(porcentaje: porcentaje * 1.4, color: Colors.orangeAccent),
              CustomRadialProgress(porcentaje: porcentaje * 1.6, color: Colors.pinkAccent),
            ],
          ),
          
        ],
      ),
    );
  }
}

class CustomRadialProgress extends StatelessWidget {

  final Color color;

  const CustomRadialProgress({
    required this.porcentaje,
    required this.color,
  });

  final double porcentaje;

  @override
  Widget build(BuildContext context) {

    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return Container(
      width: 200,
      height: 200,
      //color: Colors.red,
      child: RadialProgress(
        porcentaje: porcentaje,
        colorPrimario: color,
        colorSecundario: appTheme.textTheme.bodyText2!.color!,
        grosorPrimario: 10.0,
        grosorSecundario: 8.0,  
      ),
      //child: Text('$porcentaje %', style: TextStyle(fontSize: 50.0)),
    );
  }
}