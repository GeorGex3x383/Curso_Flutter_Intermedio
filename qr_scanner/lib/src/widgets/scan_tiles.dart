import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner/src/models/scan_model.dart';
import 'package:qr_scanner/src/providers/scan_list_provider.dart';
import 'package:qr_scanner/src/utils/utils.dart';

class ScanTiles extends StatelessWidget {
  final String tipo;

  const ScanTiles({ required this.tipo });

  @override
  Widget build(BuildContext context) {
    final widthDevice = MediaQuery.of(context).size.width;
    final scanListProvider = Provider.of<ScanListProvider>(context);
    final scans = scanListProvider.scans;
    
    return (scans.length > 0) 
      ? ScansList(scans: scans, tipo: tipo)
      : EmptyScans(widthDevice: widthDevice);
  }
}

class EmptyScans extends StatelessWidget {
  EmptyScans({ required this.widthDevice });

  final double widthDevice;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          margin: EdgeInsets.symmetric(horizontal: 50),
          child: SvgPicture.asset('assets/svgs/svg1.svg', width: widthDevice * 0.9),
        ),
        Text('No hay scans disponibles', style: TextStyle(fontSize: 18.0),)
      ],
    );
  }
}


class ScansList extends StatefulWidget {

  final List<ScanModel> scans;
  final String tipo;

  const ScansList({required this.tipo, required this.scans});

  @override
  _ScansListState createState() => _ScansListState();
}

class _ScansListState extends State<ScansList> {
  @override
  Widget build(BuildContext context) {

    return ListView.builder(
      itemCount: widget.scans.length,
      itemBuilder: (_, i) => Dismissible(
        direction: DismissDirection.endToStart,
        key: Key(widget.scans[i].id.toString()),
        background: Container(
          padding: EdgeInsets.only(left: 350.0),
          color: Colors.red,
          child: Icon(Icons.delete, color: Colors.white),
        ),
        onDismissed: (DismissDirection direction){
          Provider.of<ScanListProvider>(context, listen: false).borrarScansPorId(widget.scans[i].id);
        },
        child: FadeInUp(
          delay: Duration(milliseconds: 100),
          duration: Duration(milliseconds: 500),
          child: ListTile(
            leading: Icon(
              this.widget.tipo == 'http'
              ? Icons.compass_calibration_rounded
              : Icons.map,
              color: Theme.of(context).primaryColor
            ),
            title: Text(widget.scans[i].valor),
            subtitle: Text('ID: ${widget.scans[i].id}'),
            trailing: Icon(Icons.keyboard_arrow_right_rounded),
            onTap: () => launchURL(context, widget.scans[i]),
          ),
        ),
      )
    );
  }
}