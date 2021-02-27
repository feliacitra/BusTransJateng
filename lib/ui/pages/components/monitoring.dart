import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:bus_trans_jateng/ui/models/halte_bus.dart';
// import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:firebase_database/firebase_database.dart';

class Monitoring extends StatefulWidget {
  final HalteBus halteBus;
  Monitoring({this.halteBus});
  @override
  _MonitoringState createState() => _MonitoringState();
}

class _MonitoringState extends State<Monitoring> {
  List<HalteBus> halteBus = new List<HalteBus>();
  final Set<Marker> _markers = {};
  Completer<GoogleMapController> _controller = Completer();
  List<LatLng> points = [];

  Future getDocs() async {
    List<HalteBus> halteBus = new List<HalteBus>();

    QuerySnapshot querySnapshot = await Firestore.instance
        .collection("halte_bus")
        .orderBy(widget.halteBus.key.toString())
        .getDocuments();
    for (int i = 0; i < querySnapshot.documents.length; i++) {
      var doc = querySnapshot.documents[i];
      var temp = new HalteBus(
        key: doc.documentID ?? '',
        name: doc.data['name'] ?? '',
        latitude: doc.data['latitude'] ?? '',
        longitude: doc.data['longitude'] ?? '',
        type: doc.data['type'] ?? '',
        rute: doc.data['rute'] ?? '',
      );
      halteBus.add(temp);
    }
    LatLng latLng = LatLng(double.parse(widget.halteBus.latitude),
        double.parse(widget.halteBus.longitude));
    points.add(latLng);
    setState(() {
      addMarker(latLng, 'halte${widget.halteBus.key}', widget.halteBus.name,
          widget.halteBus);
    });
  }

  void addMarker(
      LatLng mLatLng, String mTitle, String mDescription, HalteBus halteBus) {
    getMarkerFromDb.add(Marker(
      // This marker id can be anything that uniquely identifies each marker.
      markerId: MarkerId(mTitle),
      position: mLatLng,
      infoWindow: InfoWindow(
        title: mDescription,
      ),
      // icon: mIcon,
    ));
  }

  final databaseDeviceC = FirebaseDatabase.instance.reference().root();
  final databaseDeviceA =
      FirebaseDatabase.instance.reference().child('deviceA');
  final databaseDeviceB =
      FirebaseDatabase.instance.reference().child('deviceB');

  GoogleMapController mapController;
  // List<Marker> allMarkers = [];
  Iterable marker = [];
  Set<Marker> getMarkerFromDb = Set();

  void readData() {
    databaseDeviceA.onValue.listen((Event event) {
      print('Data : ${event.snapshot.value['Latitude']}');
      print('Data : ${event.snapshot.value['Longitude']}');
      Marker resultMarker = Marker(
          markerId: MarkerId(event.snapshot.value['MarkerId']),
          position: LatLng(double.parse(event.snapshot.value['Latitude']),
              double.parse(event.snapshot.value['Longitude'])),
          infoWindow: InfoWindow(title: event.snapshot.value['MarkerId']));
      setState(() {
        getMarkerFromDb.remove(resultMarker);
        getMarkerFromDb.add(resultMarker);
      });
    });
  }

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      mapController = controller;
    });
  }

  void readDataB() {
    databaseDeviceB.onValue.listen((Event event) {
      print('Data : ${event.snapshot.value['Latitude']}');
      print('Data : ${event.snapshot.value['Longitude']}');
      print('Data ${event.snapshot.value}');
      Marker resultMarker = Marker(
          markerId: MarkerId(event.snapshot.value['MarkerId']),
          position: LatLng(double.parse(event.snapshot.value['Latitude']),
              double.parse(event.snapshot.value['Longitude'])),
          infoWindow: InfoWindow(title: event.snapshot.value['MarkerId']));
      setState(() {
        getMarkerFromDb.remove(resultMarker);
        getMarkerFromDb.add(resultMarker);
      });
    });
  }

  void initState() {
    readData();
    readDataB();
    getDocs();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('mymarker $getMarkerFromDb');
    return Scaffold(
      appBar: AppBar(
        title: Text('Bus Terdekat', style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xFFff0000),
      ),
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition:
                CameraPosition(target: LatLng(-7.431326, 109.248592), zoom: 15),
            markers: getMarkerFromDb,
            onMapCreated: _onMapCreated,
          ),
        ],
      ),
    );
  }
}
