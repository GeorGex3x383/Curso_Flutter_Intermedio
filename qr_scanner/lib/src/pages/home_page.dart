import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner/src/providers/scan_list_provider.dart';
import 'package:qr_scanner/src/providers/ui_provider.dart';
import 'package:qr_scanner/src/widgets/custom_navigatorbar.dart';
import 'package:qr_scanner/src/widgets/scan_button.dart';
import 'package:qr_scanner/src/widgets/scan_tiles.dart';


class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Historial'),
        actions: [
          ZoomIn(
            duration: Duration(seconds: 2),
            child: IconButton(
               icon: Icon(Icons.delete_forever_rounded),
              onPressed: (){
                Provider.of<ScanListProvider>(context, listen: false).borrarTodos();
              },
            ),
          ),
        ],
      ),
      body: _HomePageBody(),
     bottomNavigationBar: CustomNavigationBar(),
     floatingActionButton: ScanButton(),
     floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
   );
  }
}

class _HomePageBody extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final uiProvider = Provider.of<UiProvider>(context);
    
    final currentIndex = uiProvider.selectedMenuIndex;

    final scanListProvider = Provider.of<ScanListProvider>(context, listen: false);

    switch(currentIndex){

      case 0:
        scanListProvider.cargarScansPorTipo('http'); 
        return ScanTiles(tipo: 'http');

      case 1:
        scanListProvider.cargarScansPorTipo('geo');
        return ScanTiles(tipo: 'geo'); 

      default:
        return ScanTiles(tipo: 'http');
    }
  }
}