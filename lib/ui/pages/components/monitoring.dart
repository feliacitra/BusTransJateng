import 'dart:async';

import 'package:flutter/material.dart';
import 'package:bus_trans_jateng/ui/models/halte_bus.dart';
// import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:bus_trans_jateng/ui/global/global_function.dart';
import 'package:bus_trans_jateng/ui/pages/components/monitoring_detail.dart';

class Monitoring extends StatefulWidget {
  final HalteBus halteBus;
  Monitoring({this.halteBus});
  @override
  _MonitoringState createState() => _MonitoringState();
}

class _MonitoringState extends State<Monitoring> {
  List<HalteBus> halteBus = new List<HalteBus>();
  // final Set<Marker> _markers = {};
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
      icon: iconMe,
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
  BitmapDescriptor iconMe;
  BitmapDescriptor iconCar;

  void readData() {
    databaseDeviceA.onValue.listen((Event event) {
      print('Data : ${event.snapshot.value['latitude']}');
      print('Data : ${event.snapshot.value['longitude']}');
      Marker resultMarker = Marker(
          markerId: MarkerId(event.snapshot.value['markerId']),
          position: LatLng(double.parse(event.snapshot.value['latitude']),
              double.parse(event.snapshot.value['longitude'])),
          icon: iconCar,
          // rotation: event.snapshot.value.getBearing(),
          infoWindow: InfoWindow(title: event.snapshot.value['markerId']));
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
      print('Data : ${event.snapshot.value['latitude']}');
      print('Data : ${event.snapshot.value['longitude']}');
      Marker resultMarker = Marker(
          markerId: MarkerId(event.snapshot.value['markerId']),
          position: LatLng(double.parse(event.snapshot.value['latitude']),
              double.parse(event.snapshot.value['longitude'])),
          icon: iconCar,
          infoWindow: InfoWindow(title: event.snapshot.value['markerId']));
      setState(() {
        getMarkerFromDb.remove(resultMarker);
        getMarkerFromDb.add(resultMarker);
      });
    });
  }

  void initState() {
    BitmapDescriptor.fromAssetImage(
            ImageConfiguration(devicePixelRatio: 2), 'assets/usermarker.png')
        .then((d) {
      iconMe = d;
    });
    BitmapDescriptor.fromAssetImage(
            ImageConfiguration(devicePixelRatio: 2), 'assets/car.png')
        .then((c) {
      iconCar = c;
    });
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
            initialCameraPosition: CameraPosition(
                target: LatLng(double.parse(widget.halteBus.latitude),
                    double.parse(widget.halteBus.longitude)),
                zoom: 13),
            markers: getMarkerFromDb,
            onMapCreated: _onMapCreated,
          ),
          //dragable
          DraggableScrollableSheet(
              initialChildSize: 0.3,
              minChildSize: 0.13,
              maxChildSize: 0.8,
              builder: (BuildContext context, myscrollController) {
                return Container(
                    height: MediaQuery.of(context).size.height * 0.8,
                    child: Column(children: <Widget>[
                      SizedBox(
                        height: 10,
                      ), //bayangan atas
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(15),
                                topLeft: Radius.circular(15)),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black,
                                offset: new Offset(0.0, 10.0),
                                blurRadius: 15.0,
                              )
                            ],
                          ),
                          child: SingleChildScrollView(
                            controller: myscrollController,
                            physics: ScrollPhysics(),
                            child: Column(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    // crossAxisAlignment:
                                    //     CrossAxisAlignment.start,
                                    children: <Widget>[
                                      SizedBox(height: 10),
                                      Text(
                                        '3 KM RADIUS REAL-TIME DEPARTURE',
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        'JADWAL OPERASI PUKUL 6:00 -18:00 WIB',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        'Setiap 15 menit',
                                        style: TextStyle(
                                            color: Colors.black54,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(15),
                                          topLeft: Radius.circular(15)),
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black,
                                          offset: new Offset(0.0, 10.0),
                                          blurRadius: 15.0,
                                        )
                                      ],
                                    ),
                                    child: ListView.builder(
                                      physics: NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount: 10,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Row(
                                          children: <Widget>[
                                            Expanded(
                                              child: ListView.builder(
                                                scrollDirection: Axis.vertical,
                                                shrinkWrap: true,
                                                itemCount: 20,
                                                itemBuilder: (context, index) {
                                                  var tempDistance = CalculationByDistance(
                                                      double.parse(widget.halteBus.latitude) == null
                                                          ? 0
                                                          : double.parse(widget
                                                              .halteBus
                                                              .latitude),
                                                      double.parse(widget
                                                                  .halteBus
                                                                  .longitude) ==
                                                              null
                                                          ? 0
                                                          : double.parse(widget
                                                              .halteBus
                                                              .longitude),
                                                      double.parse(widget
                                                          .halteBus.latitude),
                                                      double.parse(
                                                          widget.halteBus.longitude));
                                                  return double.parse(
                                                                  tempDistance) <=
                                                              3.0 ||
                                                          double.parse(
                                                                  tempDistance) ==
                                                              0.0
                                                      ? MonitoringDetail()
                                                      // bus: buses[index],
                                                      // distance: tempDistance)
                                                      : Container();
                                                },
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ]));
              })
        ],
      ),
    );
  }
}
