import 'dart:async';
import 'package:flutter/material.dart';
import 'package:bus_trans_jateng/ui/models/rute_bus.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
// import 'package:bus_trans_jateng/ui/global/global_function.dart';
import 'package:geolocator/geolocator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bus_trans_jateng/ui/global/curve_painter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RuteDetail extends StatefulWidget {
  final RuteBus ruteBus;
  RuteDetail({this.ruteBus});
  @override
  _RuteDetailState createState() => _RuteDetailState();
}

class _RuteDetailState extends State<RuteDetail> {
  Completer<GoogleMapController> _controller = Completer();
  GoogleMapController mapController;
  LatLng _lastMapPosition = _center;
  Position _currentPosition;
  static const LatLng _center = const LatLng(-7.437726, 109.330851);
  final Set<Marker> _markers = {};
  List<LatLng> points = [];

  // polyline halte
  Set<Polyline> _polylines = Set<Polyline>();
  List<LatLng> polylineCoordinates = [];
  PolylinePoints polylinePoints;
  final _API = "AIzaSyB5DAWFw7QfviInDgsmiNSblskzqkUVSGk";

//dapatkan data dari firestore
  Future getDocs() async {
    List<RuteHalteBus> listRuteHalteBus = new List<RuteHalteBus>();

    QuerySnapshot querySnapshot = await Firestore.instance
        .collection("halte_bus")
        .orderBy(widget.ruteBus.key.toString())
        .getDocuments();
    for (int i = 0; i < querySnapshot.documents.length; i++) {
      var doc = querySnapshot.documents[i];
      var temp = new RuteHalteBus(
        key: doc.documentID ?? '',
        name: doc.data['name'] ?? '',
        latitude: doc.data['latitude'] ?? '',
        longitude: doc.data['longitude'] ?? '',
        type: doc.data['type'] ?? '',
        rute: doc.data['rute'] ?? '',
      );
      listRuteHalteBus.add(temp);
    }
    setState(() => ruteHalteBusList = listRuteHalteBus);
  }

//inisialisasi rutehalte terbaru
  List<RuteHalteBus> ruteHalteBusList = [];

//pada map tambahkan polyline dan marker
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    _controller.complete(controller);

    _polylines = Set<Polyline>();

    if (ruteHalteBusList != null) {
      for (var i = 0; i < ruteHalteBusList.length; i++) {
        LatLng latLng = LatLng(double.parse(ruteHalteBusList[i].latitude),
            double.parse(ruteHalteBusList[i].longitude));
        points.add(latLng);
        setState(() {
          addMarker(latLng, 'halte${ruteHalteBusList[i].key}',
              ruteHalteBusList[i].name, ruteHalteBusList[i]);
        });

        setPolylines(
            ruteHalteBusList[i].latitude,
            ruteHalteBusList[i].longitude,
            ruteHalteBusList[i + 1].latitude,
            ruteHalteBusList[i + 1].longitude,
            '$i');
      }
    }
  }

//fungsi penambahan marker
  void addMarker(LatLng mLatLng, String mTitle, String mDescription,
      RuteHalteBus ruteHalteBus) {
    _markers.add(Marker(
      // This marker id can be anything that uniquely identifies each marker.
      markerId: MarkerId(mTitle),
      position: mLatLng,
      infoWindow: InfoWindow(
        title: mDescription,
      ),
      // icon: mIcon,
    ));
  }

  void _onCameraMove(CameraPosition position) {
    _lastMapPosition = position.target;
  }

  void setPolylines(
      String lat1, String lon1, String lat2, String lon2, String id) async {
    List<PointLatLng> result = await polylinePoints.getRouteBetweenCoordinates(
        _API,
        double.parse(lat1),
        double.parse(lon1),
        double.parse(lat2),
        double.parse(lon2));
    if (result.isNotEmpty) {
      polylineCoordinates = [];
      result.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
      setState(() {
        _polylines.add(Polyline(
            width: 5, // set the width of the polylines
            polylineId: PolylineId('poly_$id'),
            color: Colors.blue,
            points: polylineCoordinates));
      });
    }
  }

  @override
  void initState() {
    getDocs();

    polylinePoints = PolylinePoints();

    super.initState();
  }

  Widget build(BuildContext context) {
    //list halte
    ListTile makeListTile(RuteHalteBus ruteHalteBus) => ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
          title: Text(
            ruteHalteBus.name,
            style: TextStyle(
              color: Colors.black54,
            ),
          ),
          // trailing: Icon(Icons.keyboard_arrow_right,
          //     color: Colors.black26, size: 30.0),
        );
    Card makeCard(RuteHalteBus ruteHalteBus) => Card(
          elevation: 0.0,
          margin: new EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: makeListTile(ruteHalteBus),
          ),
        );
    return Scaffold(
      body: Stack(
        children: <Widget>[
          GoogleMap(
            mapType: MapType.normal,
            markers: Set.of((_markers != null) ? _markers : []),
            polylines: Set.of((_polylines != null) ? _polylines : []),
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 11,
            ),
            onMapCreated: _onMapCreated,
            onCameraMove: _onCameraMove,
          ),
          //button back di pojok
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
                child: Column(
                  children: <Widget>[
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
                              Card(
                                elevation: 1,
                                child: ListTile(
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 10.0, vertical: 10.0),
                                  leading: Container(
                                    padding:
                                        EdgeInsets.only(right: 12.0, left: 5),
                                    decoration: new BoxDecoration(
                                        border: new Border(
                                            right: new BorderSide(
                                                width:
                                                    3.0, //untuk garis setelah icon rute
                                                color: Colors.blue))),
                                    child: FaIcon(
                                      //untuk icon rute
                                      FontAwesomeIcons.route,
                                      color: Colors.red,
                                      size: 40,
                                    ),
                                  ),
                                  title: Text(
                                    //untuk nama rute
                                    widget.ruteBus.name,
                                    style: TextStyle(
                                        color: Colors.black54,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 24),
                                  ),
                                ),
                              ),
                              Card(
                                child: ListTile(
                                  title: Text(
                                    'ALL HALTE',
                                    style: TextStyle(
                                        color: Colors.black38,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),
                                  ),
                                ),
                              ),
                              //list halte
                              Container(
                                child: ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: ruteHalteBusList.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Row(
                                      children: <Widget>[
                                        Container(
                                          child: CustomPaint(
                                            painter: CurvePainter(
                                                color: Colors.amber),
                                          ),
                                          color: Colors.white,
                                          width: 60,
                                          height: 60,
                                        ),
                                        Expanded(
                                            child: Container(
                                                child: makeCard(
                                                    ruteHalteBusList[index]))),
                                      ],
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
