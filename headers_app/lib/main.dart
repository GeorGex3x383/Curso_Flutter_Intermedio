import 'package:flutter/material.dart';
import 'package:headers_app/src/pages/headers_page.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Headers App',
      home: HeadersPage(),
    );
  }
}