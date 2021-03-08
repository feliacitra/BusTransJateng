import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bus_trans_jateng/ui/models/halte_bus.dart';
import 'package:bus_trans_jateng/ui/global/global_function.dart';
import 'package:bus_trans_jateng/ui/pages/components/monitoring.dart';

//untuk tampilan list bus di menu bus terdekat
class BusStopInfo extends StatelessWidget {
  final HalteBus halteBus;
  final String distance;
  BusStopInfo({this.halteBus, this.distance});
  @override
  Widget build(BuildContext context) {
    var _text = halteBus.rute.split(',');
    return Padding(
      padding: EdgeInsets.all(2.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(8, 6, 8, 0),
        child: ListTile(
          contentPadding:
              EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          title: Text(
            halteBus.name,
            style:
                TextStyle(color: Colors.black54, fontWeight: FontWeight.bold),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Jarak: $distance km',
                  style: TextStyle(color: Colors.black54)),
              Text(getType(halteBus.type),
                  style: TextStyle(color: Colors.black54)),
              Container(
                height: 35,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: new ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: _text.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.fromLTRB(0, 5, 5, 10),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 1, horizontal: 1),
                              decoration: new BoxDecoration(
                                  border: new Border.all(
                                      color: getColor(_text[index].trim())),
                                  borderRadius: BorderRadius.circular(5.0)),
                              child: new Text(
                                _text[index].trim(),
                                style: TextStyle(
                                    color: getColor(_text[index].trim())),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          trailing: Icon(Icons.keyboard_arrow_right,
              color: Colors.black45, size: 30.0),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Monitoring(halteBus: halteBus)));
          },
        ),
      ),
    );
  }
}
