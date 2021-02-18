import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:bus_trans_jateng/ui/pages/halte_list.dart';
import 'package:location/location.dart';
// import 'package:permission_handler/permission_handler.dart';

class Halte extends StatefulWidget {
  @override
  _HalteState createState() => _HalteState();
}

class _HalteState extends State<Halte> {
  GoogleMapController _controller;

  List<Marker> allMarkers = [];
  PageController _pageController;
  Location _location = Location();

  int prevPage;

  @override
  void initState() {
    super.initState();
    daftarhalte.forEach((element) {
      allMarkers.add(Marker(
          markerId: MarkerId(element.halteName),
          draggable: false,
          infoWindow: InfoWindow(
              title: element.halteName, snippet: element.description),
          position: element.locationCoords));
    });
    _pageController = PageController(initialPage: 1, viewportFraction: 0.8)
      ..addListener(_onScroll);
  }

  void _onScroll() {
    if (_pageController.page.toInt() != prevPage) {
      prevPage = _pageController.page.toInt();
    }
  }

  _daftarHalteList(index) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (BuildContext context, Widget widget) {
        double value = 1;
        if (_pageController.position.haveDimensions) {
          value = _pageController.page - index;
          value = (1 - (value.abs() * 0.3) + 0.06).clamp(0.0, 1.0);
        }
        return Center(
          child: SizedBox(
            height: Curves.easeInOut.transform(value) * 125.0,
            width: Curves.easeInOut.transform(value) * 350.0,
            child: widget,
          ),
        );
      },
      //jika salah satu halte di pilih
      child: InkWell(
          onTap: () {
            moveCamera();
          },
          child: Stack(children: [
            Center(
              child: Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 20.0,
                ),
                height: 125.0,
                width: 275.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black54,
                          offset: Offset(0.0, 4.0),
                          blurRadius: 10.0),
                    ]),
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.white,
                    ),
                    child: Row(
                      children: [
                        Container(
                            height: 90.0,
                            width: 90.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10.0),
                                  topLeft: Radius.circular(10.0),
                                ),
                                image: DecorationImage(
                                    image: AssetImage('assets/halte2.png'),
                                    fit: BoxFit.cover))),
                        SizedBox(width: 5.0),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              daftarhalte[index].halteName,
                              style: TextStyle(
                                  fontSize: 12.5, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              daftarhalte[index].description,
                              style: TextStyle(
                                  fontSize: 12.5, fontWeight: FontWeight.bold),
                            ),
                          ],
                        )
                      ],
                    )),
              ),
            )
          ])),
    );
  }

  ///user current location
  void mapCreaterd(controller) {
    setState(() {
      _controller = controller;
      _location.onLocationChanged.listen((event) {
        _controller.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: LatLng(event.latitude, event.longitude),
              zoom: 15,
            ),
          ),
        );
      });
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Halte Terdekat", style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xFFff0000),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            child: GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: CameraPosition(
                target: LatLng(-7.431326, 109.248592),
                zoom: 12,
              ),
              markers: Set.from(allMarkers),
              onMapCreated: mapCreaterd,
              myLocationEnabled: true,
            ),
          ),
          Positioned(
            bottom: 20.0,
            child: Container(
              height: 200.0,
              width: MediaQuery.of(context).size.width,
              child: PageView.builder(
                  controller: _pageController,
                  itemCount: daftarhalte.length,
                  itemBuilder: (BuildContext context, int index) {
                    return _daftarHalteList(index);
                  }),
            ),
          ),
        ],
      ),
    );
  }

  moveCamera() {
    _controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: daftarhalte[_pageController.page.toInt()].locationCoords,
      zoom: 18.0,
      bearing: 45.0,
      tilt: 45.0,
    )));
  }
}

// class Halte extends StatefulWidget {
//   @override
//   _HalteState createState() => _HalteState();
// }

// class _HalteState extends State<Halte> {
//   GoogleMapController _controller;
//   Position position;
//   Widget _child;

//   Future<void> getPermission() async {
//     PermissionStatus permission = await PermissionHandler()
//         .checkPermissionStatus(PermissionGroup.location);
//     if (permission == PermissionStatus.denied) {
//       await PermissionHandler()
//           .requestPermissions([PermissionGroup.locationAlways]);
//     }
//     var geolocator = Geolocator();
//     GeolocationStatus geolocationStatus =
//         await geolocator.checkGeolocationPermissionStatus();
//     switch (geolocationStatus) {
//       // case GeolocationStatus.denied:
//       //   break;
//       case GeolocationStatus.granted:
//         _getCurrentLocation();
//     }
//   }

//   void _getCurrentLocation() async {
//     Position res = await Geolocator().getCurrentPosition();
//     setState(() {
//       position = res;
//       _child = _mapWidget();
//     });
//   }

//   Set<Marker> _createMarker() {
//     return <Marker>[
//       Marker(
//           markerId: MarkerId('Me'),
//           position: LatLng(position.latitude, position.longitude),
//           icon: BitmapDescriptor.defaultMarker,
//           infoWindow: InfoWindow(title: 'My Location'))
//     ].toSet();
//   }

//   // void showToast(message){
//   //   Fluttertoas
//   // }
//   void initState() {
//     getPermission();

//     super.initState();
//   }

//   void _onMapCreated(GoogleMapController controller) {
//     setState(() {
//       _controller = controller;
//     });
//   }

//   Widget _mapWidget() {
//     return GoogleMap(
//       mapType: MapType.normal,
//       markers: _createMarker(),
//       initialCameraPosition:
//           CameraPosition(target: LatLng(position.latitude, position.longitude)),
//       onMapCreated: _onMapCreated,
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Halte Terdekat", style: TextStyle(color: Colors.white)),
//         backgroundColor: Color(0xFFff0000),
//       ),
//       body: Stack(
//         children: <Widget>[
//           Container(
//             child: GoogleMap(
//               mapType: MapType.normal,
//               initialCameraPosition: CameraPosition(
//                 target: LatLng(-7.431326, 109.248592),
//                 zoom: 12,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
