import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bus_trans_jateng/ui/models/halte_bus.dart';
import 'package:bus_trans_jateng/ui/services/database.dart';
import 'package:bus_trans_jateng/ui/pages/components/bus_list.dart';

class Bus extends StatefulWidget {
  @override
  _BusState createState() => _BusState();
}

class _BusState extends State<Bus> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<HalteBus>>.value(
      value: DatabaseService().haltebuses,
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        body: BusList(),
      ),
    );
  }
}
