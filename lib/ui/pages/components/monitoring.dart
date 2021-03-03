import 'dart:async';

import 'package:bus_trans_jateng/ui/global/curve_painter.dart';
import 'package:flutter/material.dart';
import 'package:bus_trans_jateng/ui/models/halte_bus.dart';
import 'package:bus_trans_jateng/ui/models/aboutbus.dart';
// import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:bus_trans_jateng/ui/global/global_function.dart';
import 'package:bus_trans_jateng/ui/pages/components/monitoring_detail.dart';
// import 'package:numpakbis/shared/curve_painter.dart';
// import 'package:provider/provider.dart';

class Monitoring extends StatefulWidget {
  final HalteBus halteBus;
  Monitoring({this.halteBus});
  @override
  _MonitoringState createState() => _MonitoringState();
}

class _MonitoringState extends State<Monitoring> {
  List<HalteBus> halteBus = new List<HalteBus>();
  // final Set<Marker> _markers = {};
  // Completer<GoogleMapController> _controller = Completer();
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

  // final databaseDeviceC = FirebaseDatabase.instance.reference().root();
  // final databaseDeviceA =
  //     FirebaseDatabase.instance.reference().child('deviceA');
  // final databaseDeviceB =
  //     FirebaseDatabase.instance.reference().child('deviceB');

  GoogleMapController mapController;
  // List<Marker> allMarkers = [];
  Iterable marker = [];
  Set<Marker> getMarkerFromDb = Set();
  List<ListBus> listBus = new List<ListBus>();
  BitmapDescriptor iconMe;
  // BitmapDescriptor iconCar;

  void readData(var deviceName) {
    FirebaseDatabase.instance
        .reference()
        .child(deviceName)
        .onValue
        .listen((Event event) {
      print('Data : ${event.snapshot.value['latitude']}');
      print('Data : ${event.snapshot.value['longitude']}');

      var tempDistance = CalculationByDistance(
          double.parse(event.snapshot.value['latitude']),
          double.parse(event.snapshot.value['longitude']),
          double.parse(widget.halteBus.latitude),
          double.parse(widget.halteBus.longitude));
      print('Distance ${deviceName} : ${tempDistance}');
      if (double.parse(tempDistance) <= 3.0) {
        ListBus _bus = new ListBus(
          markerId: event.snapshot.value['markerId'],
          latitude: event.snapshot.value['latitude'],
          longitude: event.snapshot.value['longitude'],
          distance: tempDistance,
          // tempDistance: event.snapshot.value['tempDistance'],
        );
        listBus.add(_bus);
        Marker resultMarker = Marker(
            markerId: MarkerId(event.snapshot.value['markerId']),
            position: LatLng(double.parse(event.snapshot.value['latitude']),
                double.parse(event.snapshot.value['longitude'])),
            // icon: iconCar,
            // rotation: ,

            infoWindow: InfoWindow(title: event.snapshot.value['markerId']));
        setState(() {
          getMarkerFromDb.remove(resultMarker);
          getMarkerFromDb.add(resultMarker);
        });
      }
    });
  }

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      mapController = controller;
    });
  }

// void readDataB() {
//     databaseDeviceB.onValue.listen((Event event) {
//       print('Data : ${event.snapshot.value['latitude']}');
//       print('Data : ${event.snapshot.value['longitude']}');

//       var _distance = CalculationByDistance(
//           event.snapshot.value['latitude'],
//           event.snapshot.value['longitude'],
//           double.parse(widget.halteBus.latitude),
//           double.parse(widget.halteBus.longitude));
//       if ( double.parse(_distance)<= 3.0 ) {
//          ListBus _bus = new ListBus(
//           markerId: event.snapshot.value['markerId'],
//           latitude: event.snapshot.value['latitude'],
//           longitude: event.snapshot.value['longitude'],
//         );
//         listBus.add(_bus);
//           Marker resultMarker = Marker(
//           markerId: MarkerId(event.snapshot.value['markerId']),
//           position: LatLng(double.parse(event.snapshot.value['latitude']),
//               double.parse(event.snapshot.value['longitude'])),
//           // icon: iconCar,
//           // rotation: ,

//           infoWindow: InfoWindow(title: event.snapshot.value['markerId']));
//            setState(() {
//         getMarkerFromDb.remove(resultMarker);
//         getMarkerFromDb.add(resultMarker);
//       });
//       }

//     });
//   }

  void initState() {
    BitmapDescriptor.fromAssetImage(
            ImageConfiguration(devicePixelRatio: 2), 'assets/usermarker.png')
        .then((d) {
      iconMe = d;
    });
    // BitmapDescriptor.fromAssetImage(
    //         ImageConfiguration(devicePixelRatio: 2), 'assets/car.png')
    //     .then((c) {
    //   iconCar = c;
    // });
    readData("deviceA");
    readData("deviceB");
    // readDataB();
    getDocs();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('mymarker $getMarkerFromDb');
//  final listBus = Provider.of<List<ListBus>>(context) ?? [];
    // List<ListBus> listBus = new List<ListBus>() ?? [];
    ListTile makeListTile(ListBus listBus) => ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
          title: Text(
            listBus.markerId,
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          subtitle: Row(
            children: <Widget>[
              Text('Jarak : ' + listBus.distance + ' KM',
                  style: TextStyle(color: Colors.black))
            ],
          ),
          trailing: Icon(Icons.keyboard_arrow_right,
              color: Colors.black26, size: 30.0),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => MonitoringDetail(
                          bus: listBus,
                          haltelat: widget.halteBus.latitude,
                          haltelong: widget.halteBus.longitude,
                        )));
          },
        );

    Card makeCard(ListBus listBus) => Card(
          elevation: 0.0,
          margin: new EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: makeListTile(listBus),
          ),
        );
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
                                          color: Colors.blue,
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
                                      SizedBox(
                                        height: 5,
                                      ),
                                      SizedBox(
                                        height: 2,
                                        child: Container(
                                            decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(15),
                                              topLeft: Radius.circular(15)),
                                          color: Colors.black54,
                                        )),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(15),
                                          topLeft: Radius.circular(15)),
                                      color: Colors.white,
                                    ),
                                    child: ListView.builder(
                                      physics: NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount: listBus.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Row(
                                          children: <Widget>[
                                            Container(
                                              padding:
                                                  EdgeInsets.only(right: 10.0),
                                              decoration: new BoxDecoration(
                                                  border: new Border(
                                                      right: new BorderSide(
                                                          width: 2.0,
                                                          color: Colors.red))),
                                              child: Icon(
                                                Icons.directions_bus,
                                                color: Colors.red,
                                                size: 45,
                                              ),
                                            ),
                                            Expanded(
                                                child: Container(
                                                    child: makeCard(
                                                        listBus[index]))),
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
