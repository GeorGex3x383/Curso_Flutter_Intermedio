import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:qr_scanner/src/models/scan_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class MapaPage extends StatefulWidget {

  @override
  _MapaPageState createState() => _MapaPageState();
}

class _MapaPageState extends State<MapaPage> {

  Completer<GoogleMapController> _controller = Completer();
  MapType mapType = MapType.normal;

  @override
  Widget build(BuildContext context) {

    final ScanModel scan = ModalRoute.of(context)!.settings.arguments as ScanModel;

    final CameraPosition puntoInicial = CameraPosition(
    target: scan.getLatLng(),
    zoom: 17.5,
    );

    Set<Marker> markers = new Set<Marker>();
    markers.add(new Marker(
      markerId: MarkerId('geo-location'),
      position: scan.getLatLng(),
    ));

    return Scaffold(
      appBar: AppBar(
        title: Text('Mapa'),
        actions: [
          ZoomIn(
            duration: Duration(seconds: 2),
            child: IconButton(
              icon: Icon(Icons.location_on_rounded),
              onPressed: () async{
                final GoogleMapController controller = await _controller.future;
                controller.animateCamera(CameraUpdate.newCameraPosition(
                  CameraPosition(
                    target: scan.getLatLng(),
                    zoom: 17.5,
                  ),
                ));
              },
            ),
          ),
        ],
      ),
      body: GoogleMap(
        myLocationButtonEnabled: false,
        zoomControlsEnabled: false,
        mapType: mapType,
        markers: markers,
        initialCameraPosition: puntoInicial,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: SlideInRight(
        child: FloatingActionButton(
          child: Icon(Icons.layers_rounded, color: Colors.black),
          onPressed: (){
            if(mapType == MapType.normal){
              mapType = MapType.satellite;
            } else {
              mapType = MapType.normal;
            }
      
            setState(() {});
          },
        ),
      ),
    );
  }
}