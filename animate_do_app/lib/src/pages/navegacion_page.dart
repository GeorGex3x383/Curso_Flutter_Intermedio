import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';


class NavegacionPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _NotificationModel(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink,
          title: Text('Notificaciones'),
        ),
        floatingActionButton: BotonFlotante(),
        bottomNavigationBar: BottomNavigator(),
       ),
    );
  }
}


class BottomNavigator extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final int numero = Provider.of<_NotificationModel>(context).numero;

    return BottomNavigationBar(
      currentIndex: 0,
      selectedItemColor: Colors.pink,
      items: [
        BottomNavigationBarItem(
          label: 'Bomba',
          icon: FaIcon(FontAwesomeIcons.bomb)
        ),
        BottomNavigationBarItem(
          label: 'Notificaciones',
          icon: Stack(
            children: [
              FaIcon(FontAwesomeIcons.bell),
              Positioned(
                top: 0,
                right: 0,
                //child: Icon(Icons.brightness_1, size: 8, color: Colors.redAccent),
                child: BounceInDown(
                  from: 10,
                  animate: (numero > 0)? true : false,
                  child: Bounce(
                    from: 10,
                    controller: (controller) => Provider.of<_NotificationModel>(context).bounceController = controller,
                    child: Container(
                      child: Text('$numero', style: TextStyle(color: Colors.white, fontSize: 7)),
                      alignment: Alignment.center,
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        color: Colors.redAccent,
                        shape: BoxShape.circle
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        BottomNavigationBarItem(
          label: 'Perros',
          icon: FaIcon(FontAwesomeIcons.dog)
        ),
      ],
    );
  }
}

class BotonFlotante extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.pink,
      child: FaIcon(FontAwesomeIcons.playCircle),
      onPressed: (){
        int numero = Provider.of<_NotificationModel>(context, listen: false).numero;
        numero++;
        Provider.of<_NotificationModel>(context, listen: false).numero = numero;
        if(numero>=2){
          final controller = Provider.of<_NotificationModel>(context, listen: false).bounceController;
          controller.forward(from: 0);
        }
      },
    );
  }
}

class _NotificationModel extends ChangeNotifier{

int _numero = 0;
late AnimationController _bounceController;

int get numero => this._numero;

set numero(int valor){
  this._numero = valor;
  notifyListeners();
}

AnimationController get bounceController => this._bounceController;

set bounceController(AnimationController controller){
  this._bounceController = controller;
  notifyListeners();
}

}