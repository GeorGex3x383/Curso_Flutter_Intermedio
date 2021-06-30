import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner/src/providers/ui_provider.dart';


class CustomNavigationBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final uiProvider = Provider.of<UiProvider>(context);

    final currentIndex = uiProvider.selectedMenuIndex;

    return BottomNavigationBar(
      onTap: (int i) => uiProvider.selectedMenuIndex = i,
      currentIndex: currentIndex,
      elevation: 0,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.compass_calibration),
          label: 'Direcciones',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.map_outlined),
          label: 'Mapa',
        ),
      ],
    );
  }
}