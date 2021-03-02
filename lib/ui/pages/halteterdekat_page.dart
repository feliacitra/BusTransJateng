import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:dio/dio.dart';
import 'package:bus_trans_jateng/ui/global/custom_info_widget.dart';
import 'package:bus_trans_jateng/ui/models/distance.dart';
// import 'package:bus_trans_jateng/ui/global/global_function.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:bus_trans_jateng/ui/models/halte_bus.dart';

class Halte extends StatefulWidget {
  @override
  _HalteState createState() => _HalteState();
}

class _HalteState extends State<Halte> {
  GoogleMapController _controller;

  Position _currentPosition;
  final Set<Marker> _markers = {};
  BitmapDescriptor iconMe;

  InfoWidgetRoute _infoWidgetRoute;
  StreamSubscription _mapIdleSubscription;
  LatLng _initialLocation = LatLng(-7.437726, 109.330851);
  Circle _circle;
  BitmapDescriptor iconHalte;
  var _API = 'AIzaSyB5DAWFw7QfviInDgsmiNSblskzqkUVSGk';
  Dio dio = new Dio();
  DistanceMatrix _distanceMatrix;
  List<PointObject> _points = [];
  var _jarak;

  _getCurrentLocation() {
    final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
        _controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
            target: LatLng(position.latitude, position.longitude),
            zoom: 16.00)));
        createCurrentMarker(position);
        print(position);
      });
    }).catchError((e) {
      print(e);
    });
  }

  /// This method sets selectedLocation to current location.
  void setCurrentLocation() async {
    if (_controller != null) {
      setState(() {
        createCurrentMarker(_currentPosition);
      });
      await _controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(
              _currentPosition.latitude - 0.0001,
              _currentPosition.longitude,
            ),
            zoom: 16,
          ),
        ),
      );
      await _controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(
              _currentPosition.latitude,
              _currentPosition.longitude,
            ),
            zoom: 16,
          ),
        ),
      );
    }
  }

  void createCurrentMarker(Position pos) {
    this.setState(() {
      _markers.add(Marker(
        markerId: MarkerId('Me'),
        icon: iconMe,
        infoWindow: InfoWindow(
          title: 'Me',
        ),
        position: LatLng(pos.latitude, pos.longitude),
      ));
    });
  }

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      _controller = controller;
    });
  }

  // _onCalculateDistance(lat1, long1, lat2, long2) async {
  //   try {
  //     Response response = await dio.get(
  //         "https://maps.googleapis.com/maps/api/distancematrix/json?units=imperial&origins=$lat1,$long1&destinations=$lat2,$long2&key=$_API");
  //     _distanceMatrix = new DistanceMatrix.fromJson(response.data);
  //     print('Jarak : ' +
  //         (_distanceMatrix.elements[0].distance.value / 1000)
  //             .toStringAsFixed(1) +
  //         ' km');
  //     setState(() {
  //       _jarak = (_distanceMatrix.elements[0].distance.value / 1000)
  //           .toStringAsFixed(1);
  //     });
  //     Scaffold.of(context).showSnackBar(SnackBar(
  //       backgroundColor: Theme.of(context).primaryColorDark,
  //       content: Text('Jarak dari posisi sekarang : $_jarak km'),
  //     ));
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  @override
  void dispose() {
    // TODO: implement dispose
    Future.delayed(Duration.zero, () {
      Scaffold.of(context).removeCurrentSnackBar();
    });

    super.dispose();
  }

  @override
  void initState() {
    BitmapDescriptor.fromAssetImage(
            ImageConfiguration(devicePixelRatio: 2), 'assets/usermarker.png')
        .then((d) {
      iconMe = d;
    });

    // print(_getLastKnownLat());
    // print(_getLastKnownLong());
    super.initState();
  }

  // _getLastKnownLat() async {
  //   Position _position = await Geolocator()
  //       .getLastKnownPosition(desiredAccuracy: LocationAccuracy.high);
  //   return _position.latitude.toString();
  // }

  // _getLastKnownLong() async {
  //   Position _position = await Geolocator()
  //       .getLastKnownPosition(desiredAccuracy: LocationAccuracy.high);
  //   return _position.longitude.toString();
  // }

  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection("halte_bus").snapshots(),
      builder: (context, snapshot) {
        for (int i = 0; i < snapshot.data.documents.length; i++) {
          DocumentSnapshot snap = snapshot.data.documents[i];
          // var _text = snap.data['rute'].split(',');
          _points.add(PointObject(
            location: LatLng(double.parse(snap.data['latitude']),
                double.parse(snap.data['longitude'])),
            // child: Card(
            //   child: ListTile(
            //     contentPadding:
            //         EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            //     title: Text(
            //       snap.data['name'],
            //       style: TextStyle(fontSize: 16),
            //     ),
            //     // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

            //     subtitle: Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: <Widget>[
            //         Text(getType(snap.data['type']),
            //             style: TextStyle(fontSize: 14)),

            //         Container(
            //           height: 28,
            //           child: Row(
            //             mainAxisAlignment: MainAxisAlignment.start,
            //             children: <Widget>[
            //               Expanded(
            //                 child: new ListView.builder(
            //                   scrollDirection: Axis.horizontal,
            //                   shrinkWrap: true,
            //                   itemCount: _text.length,
            //                   itemBuilder: (context, index) {
            //                     return Padding(
            //                       padding:
            //                           const EdgeInsets.fromLTRB(0, 3, 4, 5),
            //                       child: Container(
            //                         padding: const EdgeInsets.symmetric(
            //                             vertical: 1, horizontal: 1),
            //                         decoration: new BoxDecoration(
            //                             border: new Border.all(
            //                                 color:
            //                                     getColor(_text[index].trim())),
            //                             borderRadius:
            //                                 BorderRadius.circular(5.0)),
            //                         child: new Text(
            //                           _text[index].trim(),
            //                           style: TextStyle(
            //                               color: getColor(_text[index].trim()),
            //                               fontSize: 14),
            //                           textAlign: TextAlign.center,
            //                         ),
            //                       ),
            //                     );
            //                   },
            //                 ),
            //               )
            //               // Text( _text[0], style: TextStyle(color: Colors.black54)),
            //             ],
            //           ),
            //         ),
            //         //Text( halteBus.rute, style: TextStyle(color: Colors.black54)),
            //       ],
            //     ),
            //   ),
            // ),
          ));
          _markers.add(Marker(
            markerId: MarkerId(snap.documentID),
            icon: iconHalte,
            position: LatLng(double.parse(snap.data['latitude']),
                double.parse(snap.data['longitude'])),
            // onTap: () => _onTap(_points[i]),
          ));
        }
        return GestureDetector(
          onTap: () {
            Scaffold.of(context).removeCurrentSnackBar();
          },
          child: Scaffold(
            body: GoogleMap(
              mapType: MapType.normal,
              markers: Set.of((_markers != null) ? _markers : []),
              // circles: Set.of((_circle != null) ? [_circle] : []),
              initialCameraPosition: CameraPosition(
                target: _initialLocation,
                zoom: 11,
              ),
              onMapCreated: (GoogleMapController controller) {
                _controller = controller;
              },
              onTap: (LatLng coord) {
                Scaffold.of(context).removeCurrentSnackBar();
              },
              onCameraMove: (newPosition) {
                _mapIdleSubscription?.cancel();
                _mapIdleSubscription =
                    Future.delayed(Duration(milliseconds: 150))
                        .asStream()
                        .listen((_) {
                  if (_infoWidgetRoute != null) {
                    Navigator.of(context, rootNavigator: true)
                        .push(_infoWidgetRoute)
                        .then<void>(
                      (newValue) {
                        _infoWidgetRoute = null;
                      },
                    );
                  }
                });
              },
            ),
            floatingActionButton: FloatingActionButton(
                child: Icon(Icons.location_searching),
                onPressed: () {
                  _getCurrentLocation();
                }),
          ),
        );
      },
    );
  }

  // _onTap(PointObject point) async {
  //   final RenderBox renderBox = context.findRenderObject();
  //   Rect _itemRect = renderBox.localToGlobal(Offset.zero) & renderBox.size;

  //   if (_currentPosition == null) {
  //     final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
  //     geolocator
  //         .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
  //         .then((Position position) {
  //       if (position != null) {
  //         setState(() {
  //           _currentPosition = position;
  //         });
  //       }
  //     }).catchError((e) {
  //       print(e);
  //     });
  //   }

  //   _infoWidgetRoute = InfoWidgetRoute(
  //     child: point.child,
  //     buildContext: context,
  //     mapsWidgetSize: _itemRect,
  //   );

  //   await _controller.animateCamera(
  //     CameraUpdate.newCameraPosition(
  //       CameraPosition(
  //         target: LatLng(
  //           point.location.latitude - 0.0001,
  //           point.location.longitude,
  //         ),
  //         zoom: 16,
  //       ),
  //     ),
  //   );

  //   await _controller.animateCamera(
  //     CameraUpdate.newCameraPosition(
  //       CameraPosition(
  //         target: LatLng(
  //           point.location.latitude,
  //           point.location.longitude,
  //         ),
  //         zoom: 16,
  //       ),
  //     ),
  //   );

  //   _onCalculateDistance(point.location.latitude, point.location.longitude,
  //       _currentPosition.latitude, _currentPosition.longitude);
  // }
}

class PointObject {
  final Widget child;
  final LatLng location;

  PointObject({this.child, this.location});
}
