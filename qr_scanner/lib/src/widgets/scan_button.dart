import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner/src/providers/scan_list_provider.dart';
import 'package:qr_scanner/src/utils/utils.dart';


class ScanButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BounceInDown(
      from: 60,
      duration: Duration(milliseconds: 2000),
      child: FloatingActionButton(
        elevation: 0,
        child: Icon(Icons.filter_center_focus_rounded),
        onPressed: () async{
          String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode('#3D8BEF', 'Cancelar', false, ScanMode.QR);
          //final barcodeScanRes = 'https://www.youtube.com';
          //final barcodeScanRes = 'geo:20.446133,-100.067196';
    
          if(barcodeScanRes == '-1'){
            return;
          }
    
          final scanListProvider = Provider.of<ScanListProvider>(context, listen: false);
    
          final nuevoScan = await scanListProvider.nuevoScan(barcodeScanRes);
    
          launchURL(context, nuevoScan);
        }
      ),
    );
  }
}