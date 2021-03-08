import 'dart:async';

import 'package:flutter/material.dart';
import 'package:bus_trans_jateng/ui/models/aboutbus.dart';
import 'package:dio/dio.dart'; //untuk membuka http
import 'package:bus_trans_jateng/ui/models/distance.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart'; //untuk position
import 'package:bus_trans_jateng/ui/global/global_function.dart';
import 'package:bus_trans_jateng/ui/models/halte_bus.dart';
import 'package:firebase_database/firebase_database.dart';

const double CAMERA_ZOOM = 16;
const double CAMERA_TILT = 80;
const double CAMERA_BEARING = 30;

class MonitoringDetail extends StatefulWidget {
  ListBus bus;

  HalteBus halteBus;
  MonitoringDetail({this.bus, this.halteBus});
  @override
  _MonitoringDetailState createState() => _MonitoringDetailState();
}

class _MonitoringDetailState extends State<MonitoringDetail> {
  final _API = "AIzaSyB5DAWFw7QfviInDgsmiNSblskzqkUVSGk";

  Dio dio = new Dio();
  DistanceMatrix _distanceMatrix;
  var lat, long;
  Completer<GoogleMapController> _controller = Completer();
  GoogleMapController mapController;
  LatLng _lastMapPosition = _center;
  static const LatLng _center = const LatLng(-7.797068, 110.370529);
  Position _currentPosition;
  BitmapDescriptor iconMe;
  BitmapDescriptor iconCar;
  final Set<Marker> _markers = {};
  String _infoTracking;

  // for my drawn routes on the map
  Set<Polyline> _polylines = Set<Polyline>();
  List<LatLng> polylineCoordinates = [];
  PolylinePoints polylinePoints;

  List<HalteBus> halteBus = new List<HalteBus>();

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    _controller.complete(controller);

    LatLng latLng_2 = LatLng(double.parse(widget.halteBus.latitude),
        double.parse(widget.halteBus.longitude));
    LatLng latLng_1 = LatLng(
        double.parse(widget.bus.latitude), double.parse(widget.bus.longitude));

    LatLng mid = MidPoint(
        double.parse(widget.halteBus.latitude),
        double.parse(widget.halteBus.longitude),
        double.parse(widget.bus.latitude),
        double.parse(widget.bus.longitude));

    setState(() {
      _markers.clear();
      addMarker(latLng_2, 'halte${widget.halteBus.key}', widget.halteBus.name,
          iconMe);
      addMarker(
          latLng_1, 'bus${widget.bus.markerId}', widget.bus.markerId, iconCar);
    });

    mapController.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: mid, zoom: 16.00)));

    setPolylines();
  }

  void addMarker(LatLng mLatLng, String mTitle, String mDescription,
      BitmapDescriptor mIcon) {
    _markers.add(Marker(
      // This marker id can be anything that uniquely identifies each marker.
      markerId: MarkerId(mTitle),
      position: mLatLng,
      infoWindow: InfoWindow(
        title: mDescription,
      ),
      icon: mIcon,
    ));
  }

  void _onCameraMove(CameraPosition position) {
    _lastMapPosition = position.target;
  }

  Future<void> _onCalculateDistance(String lat1, String long1) async {
    //menggunakan distance matrix API
    try {
      Response response = await dio.get(
          "https://maps.googleapis.com/maps/api/distancematrix/json?units=imperial&origins=$lat1,$long1&destinations=${widget.halteBus.latitude},${widget.halteBus.longitude}&key=$_API");
      _distanceMatrix = new DistanceMatrix.fromJson(response.data);
      print(_distanceMatrix.elements[0].distance.text +
          ' - ' +
          _distanceMatrix.elements[0].distance.value.toString());
      print(_distanceMatrix.elements[0].duration.text +
          ' - ' +
          _distanceMatrix.elements[0].duration.value.toString());
      setState(() {
        _infoTracking =
            '${_distanceMatrix.elements[0].duration.text} (${(_distanceMatrix.elements[0].distance.value / 1000).toStringAsFixed(1)} KM)';
      });
    } catch (e) {
      print(e);
    }
  }

  void setPolylines() async {
    //menggunakan direction API
    List<PointLatLng> result = await polylinePoints.getRouteBetweenCoordinates(
        _API,
        double.parse(widget.bus.latitude),
        double.parse(widget.bus.longitude),
        double.parse(widget.halteBus.latitude),
        double.parse(widget.halteBus.longitude));
    print(result);
    if (result.isNotEmpty) {
      result.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
      setState(() {
        _polylines.add(Polyline(
            width: 5, // set the width of the polylines
            polylineId: PolylineId("poly"),
            color: Colors.blue,
            points: polylineCoordinates));
      });
    }
  }

  void updatePinOnMap() async {
    // create a new CameraPosition instance
    // every time the location changes, so the camera
    // follows the pin as it moves with an animation
    CameraPosition cPosition = CameraPosition(
      zoom: CAMERA_ZOOM,
      tilt: CAMERA_TILT,
      bearing: CAMERA_BEARING,
      target: LatLng(double.parse(lat), double.parse(long)),
    );

    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(
        cPosition)); // do this inside the setState() so Flutter gets notified
    // that a widget update is due
    setState(() {
      // updated position
      var pinPosition = LatLng(double.parse(lat), double.parse(long));
      // the trick is to remove the marker (by id)
      // and add it again at the updated location
      _markers
          .removeWhere((m) => m.markerId.value == 'bus${widget.bus.markerId}');
      _markers.add(Marker(
          markerId: MarkerId('bus${widget.bus.markerId}'),
          position: pinPosition, // updated position
          icon: iconCar));
    });
  }

  /// This method sets selectedLocation to current location.
  void setCurrentLocation() async {
    if (mapController != null) {
      await mapController.animateCamera(
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
      await mapController.animateCamera(
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

  @override
  void initState() {
    super.initState();
    _onCalculateDistance(widget.bus.latitude, widget.bus.longitude);

    BitmapDescriptor.fromAssetImage(
            ImageConfiguration(devicePixelRatio: 2), 'assets/usermarker.png')
        .then((d) {
      iconMe = d;
    });
    BitmapDescriptor.fromAssetImage(
            ImageConfiguration(devicePixelRatio: 2), 'assets/markerbus.png')
        .then((c) {
      iconCar = c;
    });
    polylinePoints = PolylinePoints();
    readData() {
      FirebaseDatabase.instance
          .reference()
          .child(widget.bus.markerId)
          .onValue
          .listen((Event event) {
        print('Data : ${event.snapshot.value['latitude']}');
        print('Data : ${event.snapshot.value['longitude']}');

        setState(() {
          lat = event.snapshot.value['latitude'];
          long = event.snapshot.value['longitude'];
        });
        updatePinOnMap();

        _onCalculateDistance(lat, long);

        var distance = CalculationByDistance(
            double.parse(lat),
            double.parse(long),
            double.parse(widget.halteBus.latitude),
            double.parse(widget.halteBus.longitude));
        print('Distance ${widget.bus.markerId} : $distance}');
        if (double.parse(distance) < 0.1) {
          _sampaiTujuan();
        }
      });
    }

    readData();
  }

  _sampaiTujuan() {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text(
            'Bus ${widget.bus.markerId} telah sampai di ${widget.halteBus.name}'),
        actions: <Widget>[
          FlatButton(
            //kembali ke list bus radius 3km
            child: Text('OK'),
            onPressed: () {
              var count = 0;
              Navigator.popUntil(context, (route) {
                return count++ == 2;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: <Widget>[
        GoogleMap(
          mapType: MapType.normal,
          markers: Set.of((_markers != null) ? _markers : []),
          polylines: Set.of((_polylines != null) ? _polylines : []),
          initialCameraPosition: CameraPosition(
              target: LatLng(double.parse(widget.halteBus.latitude),
                  double.parse(widget.halteBus.longitude)),
              zoom: 13),
          onMapCreated: _onMapCreated,
          onCameraMove: _onCameraMove,
        ),
        Positioned(
          left: 8.0,
          top: 35.0,
          child: Container(
            color: Colors.white,
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back,
                color: Colors.lightBlue,
                size: 35,
              ),
            ),
          ),
        ),
        DraggableScrollableSheet(
            initialChildSize: 0.3,
            minChildSize: 0.13,
            maxChildSize: 0.8,
            builder: (BuildContext context, myscrollController) {
              return Container(
                  height: MediaQuery.of(context).size.height * 0.8,
                  child: Column(children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Expanded(
                        child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(15),
                            topLeft: Radius.circular(15)),
                        color: Colors.white,
                        boxShadow: [
                          //shadow di luar kotak list
                          BoxShadow(
                            color: Colors.black45,
                            offset: new Offset(0.0, 10.0),
                            blurRadius: 15.0,
                          )
                        ],
                      ),
                      child: Column(children: <Widget>[
                        //untuk garis biru atas
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Container(
                            child: SizedBox(height: 5, width: 50),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              color: Colors.blue,
                            ),
                          ),
                        ),
                        //perluas untuk list
                        Expanded(
                            child: Container(
                                child: ListView(
                                    controller: myscrollController,
                                    children: <Widget>[
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      '    REAL-TIME TRACKING',
                                      style: TextStyle(
                                          color: Colors.black38,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14),
                                    ),
                                    Card(
                                      elevation: 1,
                                      child: ListTile(
                                        contentPadding: EdgeInsets.symmetric(
                                          horizontal: 10.0,
                                        ),
                                        title: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              _infoTracking == null
                                                  ? ''
                                                  : _infoTracking,
                                              style: TextStyle(
                                                color: Colors.blueAccent,
                                                fontSize: 25,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Card(
                                      elevation: 1,
                                      //margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
                                      child: ListTile(
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 10.0, vertical: 10.0),
                                        leading: Container(
                                          padding: EdgeInsets.only(right: 12.0),
                                          decoration: new BoxDecoration(
                                              border: new Border(
                                                  right: new BorderSide(
                                                      width: 1.0,
                                                      color: Colors.red))),
                                          child: Icon(
                                            Icons.directions_bus,
                                            color: Colors.red,
                                            size: 60,
                                          ),
                                        ),
                                        title: Text(
                                          widget.bus.markerId,
                                          style: TextStyle(
                                              color: Colors.black54,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                        ),
                                        subtitle: Text(
                                            "Menuju ke " +
                                                '${widget.halteBus.name}',
                                            style:
                                                TextStyle(color: Colors.black)),
                                      ),
                                    ),
                                  ])
                            ]))),
                      ]),
                    )),
                  ]));
            })
      ]),
    );
  }
}
