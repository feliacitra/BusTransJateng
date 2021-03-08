import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:bus_trans_jateng/ui/models/halte_bus.dart';
import 'package:bus_trans_jateng/ui/global/global_function.dart';
import 'package:bus_trans_jateng/ui/pages/components/bus_stop_info.dart';

class BusList extends StatefulWidget {
  @override
  _BusListState createState() => _BusListState();
}

class _BusListState extends State<BusList> {
  Position _currentPosition;
  TextEditingController editingController = TextEditingController();
  String filter;
  bool filtered = false;

  _getCurrentLocation() {
    final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
        print(position);
      });
    }).catchError((e) {
      print(e);
    });
  }

  @override
  void initState() {
    super.initState();
    editingController.addListener(() {
      setState(() {
        if (editingController.text == '' || editingController.text == null) {
          filtered = false;
        } else {
          filtered = true;
        }
        filter = editingController.text;
      });
    });
  }

  @override
  void dispose() {
    editingController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    final haltebuses = Provider.of<List<HalteBus>>(context) ?? [];
    if (_currentPosition == null) {
      _getCurrentLocation();
    }
    return Padding(
      padding: const EdgeInsets.only(top: 2),
      child: Column(
        children: <Widget>[
          Center(
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Card(
                child: TextField(
                  controller: editingController,
                  decoration: InputDecoration(
                    labelText: "Dihalte manakah anda?",
                    hintText: "Halte",
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            //mendapatkan daftar halte yang jaraknya <= 3KM
            child:
                filter == null || filter == "" || editingController.text.isEmpty
                    ? ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: haltebuses.length,
                        itemBuilder: (context, index) {
                          var tempDistance = CalculationByDistance(
                              _currentPosition == null
                                  ? 0
                                  : _currentPosition.latitude,
                              _currentPosition == null
                                  ? 0
                                  : _currentPosition.longitude,
                              double.parse(haltebuses[index].latitude),
                              double.parse(haltebuses[index].longitude));
                          return double.parse(tempDistance) <= 3.0 ||
                                  double.parse(tempDistance) == 0.0
                              ? BusStopInfo(
                                  halteBus: haltebuses[index],
                                  distance: tempDistance)
                              : Container();
                        },
                      )
                    : ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: haltebuses.length,
                        itemBuilder: (context, index) {
                          var tempDistance = CalculationByDistance(
                              _currentPosition == null
                                  ? 0
                                  : _currentPosition.latitude,
                              _currentPosition == null
                                  ? 0
                                  : _currentPosition.longitude,
                              double.parse(haltebuses[index].latitude),
                              double.parse(haltebuses[index].longitude));
                          return haltebuses[index]
                                  .name
                                  .toLowerCase()
                                  .contains(filter.toLowerCase())
                              ? BusStopInfo(
                                  halteBus: haltebuses[index],
                                  distance: tempDistance)
                              : Container();
                        },
                      ),
          ),
        ],
      ),
    );
  }
}
