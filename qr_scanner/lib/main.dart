import 'package:flutter/material.dart';

import 'package:qr_scanner/src/pages/home_page.dart';
import 'package:qr_scanner/src/pages/mapa_page.dart';

import 'package:provider/provider.dart';
import 'package:qr_scanner/src/providers/scan_list_provider.dart';
import 'package:qr_scanner/src/providers/ui_provider.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => new UiProvider()),
        ChangeNotifierProvider(create: (_) => new ScanListProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'QR Scanner',
        initialRoute: 'home',
        routes: {
          'home' : (_) => HomePage(),
          'mapa' : (_) => MapaPage(),
        },
        theme: ThemeData(
          primaryColor: Colors.lightBlueAccent,
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            selectedItemColor: Colors.lightBlueAccent,
            unselectedItemColor: Colors.black54
          ),
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: Colors.lightBlueAccent,
          )
        ),
      ),
    );
  }
}