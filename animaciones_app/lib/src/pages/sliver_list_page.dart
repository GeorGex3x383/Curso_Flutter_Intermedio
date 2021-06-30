import 'package:flutter/material.dart';
import 'package:headers_app/src/theme/theme.dart';
import 'package:provider/provider.dart';


class SliverListPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: _ListaTareas(),
      //body: _Titulo(),
      body: Stack(
        children: [
          _MainScroll(),
          Positioned(
            bottom: 0,
            right: 0,
            child: _BotonNewList()
          ),
        ],
      ),
   );
  }
}

class _BotonNewList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final appTheme = Provider.of<ThemeChanger>(context);

    return ButtonTheme(
      child: ElevatedButton (
        style: ButtonStyle(
          backgroundColor: (appTheme.darkTheme) ? MaterialStateProperty.all<Color>(appTheme.currentTheme.accentColor) : MaterialStateProperty.all<Color>(Color(0xffED6762)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder> (
            RoundedRectangleBorder(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(50))
            )
          )
        ),
        child: Container(
          height: size.height * 0.1,
          width: size.width * 0.7,
          child: Center(
            child: Text(
              'CREATE A NEW LIST',
              style: TextStyle(
                color: appTheme.currentTheme.scaffoldBackgroundColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                letterSpacing: 2
              ),
            ),
          ),
        ),
        onPressed: (){}
      )
    );
  }
}

class _MainScroll extends StatelessWidget {

  final items = [
    _ListItem( 'Orange', Color(0xffF08F66) ),
    _ListItem( 'Family', Color(0xffF2A38A) ),
    _ListItem( 'Subscriptions', Color(0xffF7CDD5) ),
    _ListItem( 'Books', Color(0xffFCEBAF) ),
    _ListItem( 'Orange', Color(0xffF08F66) ),
    _ListItem( 'Family', Color(0xffF2A38A) ),
    _ListItem( 'Subscriptions', Color(0xffF7CDD5) ),
    _ListItem( 'Books', Color(0xffFCEBAF) ),
    _ListItem( 'Orange', Color(0xffF08F66) ),
    _ListItem( 'Family', Color(0xffF2A38A) ),
    _ListItem( 'Subscriptions', Color(0xffF7CDD5) ),
    _ListItem( 'Books', Color(0xffFCEBAF) ),
    _ListItem( 'Orange', Color(0xffF08F66) ),
    _ListItem( 'Family', Color(0xffF2A38A) ),
    _ListItem( 'Subscriptions', Color(0xffF7CDD5) ),
    _ListItem( 'Books', Color(0xffFCEBAF) ),
  ];

  @override
  Widget build(BuildContext context) {

    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return CustomScrollView(
      slivers: [
       // SliverAppBar(
       //   floating: true,
       //   elevation: 0,
       //   backgroundColor: Colors.red,
       // ),
        SliverPersistentHeader(
          floating: true,
          delegate: _SliveCustomHeaderDelegate(
            minHeight: 180,
            maxHeight: 200,
            child: Container(
              alignment: Alignment.centerLeft,
              color: appTheme.scaffoldBackgroundColor,
              child: _Titulo(),
            ),
          ),
        ),

        SliverList(
          delegate: SliverChildListDelegate([
            ...items,
            SizedBox(height: 100)
          ]),
        ),
      ],
    );
  }
}

class _SliveCustomHeaderDelegate extends SliverPersistentHeaderDelegate{

  final double minHeight;
  final double maxHeight;
  final Widget child;

  _SliveCustomHeaderDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child
  });

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(covariant _SliveCustomHeaderDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
           minHeight != oldDelegate.minHeight ||
           child != oldDelegate.child;
  }

}

class _Titulo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final appTheme = Provider.of<ThemeChanger>(context);

    return Column(
      children: [
        SizedBox(height: 30),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Text('New', style: TextStyle(color:(appTheme.darkTheme) ? Colors.grey : Colors.black, fontSize: 50)),
        ),
        Stack(
          children: [
            SizedBox(width: 100),
            Positioned(
              bottom: 8,
              child: Container(
                width: 150,
                height: 8,
                color:(appTheme.darkTheme) ? Colors.grey : Color(0xffF7CDD5),
              ),
            ),
            Container(
              child: Text('List', style: TextStyle(color: Colors.red, fontSize: 50, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ],
    );
  }
}

class _ListaTareas extends StatelessWidget {

    final items = [
    _ListItem( 'Orange', Color(0xffF08F66) ),
    _ListItem( 'Family', Color(0xffF2A38A) ),
    _ListItem( 'Subscriptions', Color(0xffF7CDD5) ),
    _ListItem( 'Books', Color(0xffFCEBAF) ),
    _ListItem( 'Orange', Color(0xffF08F66) ),
    _ListItem( 'Family', Color(0xffF2A38A) ),
    _ListItem( 'Subscriptions', Color(0xffF7CDD5) ),
    _ListItem( 'Books', Color(0xffFCEBAF) ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      physics: BouncingScrollPhysics(),
      itemBuilder: (BuildContext context, int index) => items[index]);
  }
}

class _ListItem extends StatelessWidget {

  final String titulo;
  final Color color;

  _ListItem(this.titulo, this.color);

  @override
  Widget build(BuildContext context) {

    final appTheme = Provider.of<ThemeChanger>(context);

    return Container(
      padding: EdgeInsets.all(30),
      alignment: Alignment.centerLeft,
      child: Text(titulo, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20)),
      height: 130,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: (appTheme.darkTheme)? Colors.grey : color,
        borderRadius: BorderRadius.circular(30),
      ),
    );
  }
}