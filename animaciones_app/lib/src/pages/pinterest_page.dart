import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:headers_app/src/theme/theme.dart';
import 'package:headers_app/src/widgets/pinterest_menu.dart';
import 'package:provider/provider.dart';


class PinterestPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
      create: (_) => new _MenuModel(),
      child: Scaffold(
        //body: PinterestMenu(),
        //body: PinterestGrid(),
        body: Stack(
          children: [
            PinterestGrid(),
            _PinterestMenuLocation(),
          ],
        ),
       ),
    );
  }
}

class _PinterestMenuLocation extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final widthPantalla = MediaQuery.of(context).size.width;
    final mostrar = Provider.of<_MenuModel>(context).mostrar;

    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return Positioned(
      bottom: 30,
      child: Container(
        width: widthPantalla,
        child: Align(
          child: PinterestMenu(
            items: [
              PinterestButton(
                icon: Icons.pie_chart_outline_outlined,
                onPressed: (){print('pie_chart_outline_outlined');},
              ),
              PinterestButton(
                icon: Icons.search,
                onPressed: (){print('search');},
              ),
              PinterestButton(
                icon: Icons.notifications_none,
                onPressed: (){print('notifications_none');},
              ),
              PinterestButton(
                icon: Icons.supervised_user_circle_outlined,
                onPressed: (){print('supervised_user_circle_outlined');},
              ),
            ],
            mostrar: mostrar,
            activeColor: appTheme.accentColor,
            //inactiveColor: Colors.blue,
            backgroundColor: appTheme.scaffoldBackgroundColor,
          ),
        ),
      ),
    );
  }
}

class PinterestGrid extends StatefulWidget {

  @override
  _PinterestGridState createState() => _PinterestGridState();
}

class _PinterestGridState extends State<PinterestGrid> {

  final List<int> items = List.generate(200, (i) => i);
  ScrollController conroller = new ScrollController();
  double scrollAnterior = 0.0;

  @override
  void initState() {

    conroller.addListener(() {
      if(conroller.offset > scrollAnterior && conroller.offset > 150){
        Provider.of<_MenuModel>(context, listen: false).mostrar = false;
      } else {
        Provider.of<_MenuModel>(context, listen: false).mostrar = true;
      }

    scrollAnterior = conroller.offset;

    });

    super.initState();
  }

  @override
  void dispose() { 
    conroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new StaggeredGridView.countBuilder(
      controller: conroller,
      crossAxisCount: 4,
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) => _PinterestItem(index),
      staggeredTileBuilder: (int index) =>
          new StaggeredTile.count(2, index.isEven ? 2 : 3),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
    );
  }
}

class _PinterestItem extends StatelessWidget {

  final int index;

  _PinterestItem(this.index);

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: EdgeInsets.all(2),
      decoration: BoxDecoration(
      color: Colors.orangeAccent,
      borderRadius: BorderRadius.all(Radius.circular(20)),
    ),
    child: new Center(
      child: new CircleAvatar(
        backgroundColor: Colors.white,
        child: new Text('$index'),
      ),
    ));
  }
}


class _MenuModel with ChangeNotifier{

  bool _mostrar = true;

  bool get mostrar => this._mostrar;

  set mostrar(bool valor){
    this._mostrar = valor;
    notifyListeners();
  }

}