import 'package:animate_do/animate_do.dart';
import 'package:animate_do_app/src/pages/navegacion_page.dart';
import 'package:animate_do_app/src/pages/twitter_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class Pagina1Page extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FadeIn(
          delay: Duration(milliseconds: 500),
          child: Text('Animate_do'),
        ),
        actions: [
          IconButton(
            icon: FaIcon(FontAwesomeIcons.twitter),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => TwitterPage()));
            },
          ),
          SlideInLeft(
            from: 70,
            child: IconButton(
              icon: Icon(Icons.navigate_next_rounded),
              onPressed: (){
                Navigator.push(context, CupertinoPageRoute(builder: (BuildContext context) => Pagina1Page()));
              },
            ),
          ),
        ],
      ),
      floatingActionButton: ElasticInRight(
        child: FloatingActionButton(
          child: FaIcon(FontAwesomeIcons.playCircle),
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => NavegacionPage()));
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElasticIn(
              delay: Duration(milliseconds: 1100),
              child: FaIcon(FontAwesomeIcons.solidHeart, color: Colors.blue, size: 40)
            ),
            FadeInDown(
              delay: Duration(milliseconds: 200),
              child: Text('Regina', style: TextStyle(fontSize: 40, fontWeight: FontWeight.w200))
            ),
            FadeInDown(
              delay: Duration(milliseconds: 900),
              child: Text('Te quiero mucho!', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400))
            ),
            FadeInLeft(
              delay: Duration(milliseconds: 1100),
              child: Container(
                width: 220,
                height: 2,
                color: Colors.blue,
              ),
            ),

          ],
        ),
      ),
   );
  }
}