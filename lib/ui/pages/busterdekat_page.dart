import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:firebase_database/firebase_database.dart';

class BusTerdekat extends StatefulWidget {
  @override
  _BusTerdekatState createState() => _BusTerdekatState();
}

class _BusTerdekatState extends State<BusTerdekat> {
  final databaseDeviceC = FirebaseDatabase.instance.reference().root();
  final databaseDeviceA =
      FirebaseDatabase.instance.reference().child('deviceA');
  final databaseDeviceB =
      FirebaseDatabase.instance.reference().child('deviceB');
  var busA = "";
  var busB = "";
  var busC = "";
  var busD = "";
  GoogleMapController mapController;
  List<Marker> allMarkers = [];
  Iterable marker = [];
  Set<Marker> getMarkerFromDb = Set();
  void readData() {
    databaseDeviceA.onValue.listen((Event event) {
      busA = event.snapshot.value['Latitude'];
      busB = event.snapshot.value['Longitude'];
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
      busC = event.snapshot.value['Latitude'];
      busD = event.snapshot.value['Longitude'];
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
          Container(
              margin: EdgeInsets.symmetric(
                horizontal: 10.0,
                vertical: 20.0,
              ),
              height: 125.0,
              width: 400.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        ('DataA : $busA'),
                        style: TextStyle(
                            fontSize: 12.5, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        ('DataB : $busB'),
                        style: TextStyle(
                            fontSize: 12.5, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        ('DataC : $busC'),
                        style: TextStyle(
                            fontSize: 12.5, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        ('DataD : $busD'),
                        style: TextStyle(
                            fontSize: 12.5, fontWeight: FontWeight.bold),
                      ),
                    ],
                  )
                ],
              )),
        ],
      ),
    );
  }
}
