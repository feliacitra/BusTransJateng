import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bus_trans_jateng/ui/models/rute_bus.dart';
import 'package:bus_trans_jateng/ui/services/database.dart';
import 'package:bus_trans_jateng/ui/pages/components/rute_list.dart';

class Rute extends StatefulWidget {
  @override
  _RuteState createState() => _RuteState();
}

class _RuteState extends State<Rute> {
  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text('Rute Bus', style: TextStyle(color: Colors.white)),
    //     backgroundColor: Color(0xFFff0000),
    //   ),
    // );
    return StreamProvider<List<RuteBus>>.value(
      value: DatabaseService().rutebuses,
      child: Scaffold(
        body: RuteList(),
      ),
    );
  }
}
