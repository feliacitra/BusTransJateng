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
  void readData() {
    databaseDeviceA.onValue.listen((Event event) {
      busA = event.snapshot.value['Latitude'];
      busB = event.snapshot.value['Longitude'];
      print('Data : ${event.snapshot.value['Latitude']}');
      print('Data : ${event.snapshot.value['Longitude']}');
      // mapController.animateCamera(CameraUpdate.newCameraPosition(
      //   CameraPosition(
      //       target: LatLng(event.snapshot.value['Latitude'],
      //           event.snapshot.value['Longitude']),
      //       zoom: 17),
      // ));
      // allMarkers.add(Marker(
      //     markerId: MarkerId('1'),
      //     position: LatLng(event.snapshot.value['Latitude'],
      //         event.snapshot.value['Longitude'])));
    });
  }

  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  void initMarker(specify, specifyId) async {
    var MarkerIdVal = specifyId;
    final MarkerId markerId = MarkerId(MarkerIdVal);
    final Marker marker = Marker(
        markerId: markerId,
        position: LatLng(
            specify['Latitude'].latitude, specify['Longitude'].longitude),
        infoWindow: InfoWindow(title: 'DeviceA'));
    setState(() {
      markers[markerId] = marker;
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
    });
  }

  void initState() {
    readData();
    readDataB();
    super.initState();
  }
  // void initState() {
  //   super.initState();
  //   allMarkers.add(
  //     Marker(
  //       markerId: MarkerId('busA'),
  //       draggable: false,
  //       position: LatLng(busA.latitude, busB.longitude),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
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
            markers: Set.from(allMarkers),
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
          // RaisedButton(
          //   child: Text('Tampil Data'),
          //   color: Colors.redAccent,
          //   onPressed: () {
          //     readData();
          //     readDataB();
          //   },
          //   shape: RoundedRectangleBorder(
          //       borderRadius: BorderRadius.all(Radius.circular(20))),
          // ),
          // SizedBox(
          //   height: 8,
          // ),
        ],
      ),
    );
  }
}
