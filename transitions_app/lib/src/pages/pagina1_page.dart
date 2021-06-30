import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:transitions_app/src/pages/pagina2_page.dart';


class Pagina1Page extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina 1'),
      ),
      body: Center(
        child: Text('Pagina 1'),
     ),
     floatingActionButton: FloatingActionButton(
       child: Icon(Icons.access_time_outlined),
       onPressed: (){
         Navigator.push(context, _crearRuta());
       },
     ),
   );
  }

  Route _crearRuta() {
    return PageRouteBuilder(
      pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) => Pagina2Page(),
      transitionDuration: Duration(milliseconds: 450),
      transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, child){
        final curvedAnimation = CurvedAnimation(parent: animation, curve: Curves.easeInOut);

       /* return SlideTransition(
          position: Tween<Offset>(
            begin: Offset(0.0, 1.0),
            end: Offset.zero,
          ).animate(curvedAnimation),
          child: child,
        );*/

        /*return ScaleTransition(
          scale: Tween<double>(begin: 0.0, end: 1.0).animate(curvedAnimation),
          child: child,
        );*/

        /*return RotationTransition(
          turns: Tween<double>(begin: 0.0, end: 1.0).animate(curvedAnimation),
          child: child,
          );*/

        return FadeTransition(
          opacity: Tween<double>(begin: 0.0, end: 1.0).animate(curvedAnimation),
          child: child,
        );
      }  
    );
  }
}