import 'package:flutter/material.dart';
import 'package:qr_scanner/src/models/scan_model.dart';
import 'package:url_launcher/url_launcher.dart';

launchURL(BuildContext context, ScanModel scan) async {
  final url = scan.valor;
  if(scan.tipo == 'http'){
    await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';
   /* if (await canLaunch(url)) {
    await launch(url);
    } else {
      throw 'Could not launch $url';
    }*/
  } else {
    Navigator.pushNamed(context, 'mapa', arguments: scan);
  }
}