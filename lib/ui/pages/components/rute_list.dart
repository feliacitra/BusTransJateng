import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bus_trans_jateng/ui/models/rute_bus.dart';
import 'package:bus_trans_jateng/ui/pages/components/rute_tile.dart';

class RuteList extends StatefulWidget {
  @override
  _RuteListState createState() => _RuteListState();
}

class _RuteListState extends State<RuteList> {
  @override
  Widget build(BuildContext context) {
    final rutebuses = Provider.of<List<RuteBus>>(context) ?? [];
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: rutebuses.length,
      itemBuilder: (context, index) {
        return RuteTile(ruteBus: rutebuses[index]);
      },
    );
  }
}
