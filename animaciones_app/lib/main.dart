import 'package:flutter/material.dart';
import 'package:headers_app/src/pages/launcher_page.dart';
import 'package:headers_app/src/theme/theme.dart';
import 'package:provider/provider.dart';
 
void main() => runApp(
  ChangeNotifierProvider(
    create: (_) => ThemeChanger(2),
    child: MyApp()
  )
);
 
class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

    final currentTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return MaterialApp(
      theme: currentTheme,
      debugShowCheckedModeBanner: false,
      title: 'Headers App',
      home: LauncherPage(),
    );
  }
}