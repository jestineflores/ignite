import 'dart:async';
import 'package:ignite/widgets/BrandDivider.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
import 'dart:io';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MainPage extends StatefulWidget {
  static const String id = 'mainpage';
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  double searchSheetHeight = (Platform.isIOS) ? 300 : 275;
  Completer<GoogleMapController> _controller = Completer();
  GoogleMapController mapController;
  double mapButtonPadding = 0;

  static final CameraPosition _kGooglePlex =
      CameraPosition(target: LatLng(39.765030, -105.032480), zoom: 14.4746);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        GoogleMap(
          padding: EdgeInsets.only(bottom: mapButtonPadding),
          mapType: MapType.normal,
          myLocationButtonEnabled: true,
          initialCameraPosition: _kGooglePlex,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
            mapController = controller;

            setState(() {
              mapButtonPadding = (Platform.isAndroid) ? 280 : 270;
            });
          },
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: Container(
              height: searchSheetHeight,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 15,
                      spreadRadius: 0.5,
                      offset: Offset(
                        0.7,
                        0.7,
                      ),
                    ),
                  ]),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 5,
                    ),
                    Text('Nice to see you!', style: TextStyle(fontSize: 10)),
                    Text(
                      'Where are you going?',
                      style: TextStyle(fontSize: 18, fontFamily: 'Brand-Bold'),
                    ),
                    SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 5,
                              spreadRadius: 0.5,
                              offset: Offset(0.7, 0.7),
                            ),
                          ]),
                      child: Padding(
                        padding: EdgeInsets.all(12),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              OMIcons.search,
                              color: Colors.green[800],
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text('Search Destination'),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 22),
                    Row(
                      children: <Widget>[
                        Icon(
                          OMIcons.home,
                          color: Colors.green[800],
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('Add Home'),
                            SizedBox(height: 3),
                            Text(
                              'Your Residential Address',
                              style: TextStyle(
                                fontSize: 11,
                                color: Colors.green[800],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    BrandDivider(),
                    SizedBox(height: 16),
                    Row(
                      children: <Widget>[
                        Icon(
                          OMIcons.workOutline,
                          color: Colors.green[800],
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('Add Work'),
                            SizedBox(height: 3),
                            Text(
                              'Your Office Address',
                              style: TextStyle(
                                fontSize: 11,
                                color: Colors.green[800],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              )),
        ),
      ],
    ));
  }
}
