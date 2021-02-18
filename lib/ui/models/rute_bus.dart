// import 'package:cloud_firestore/cloud_firestore.dart';

class RuteBus {
  String key;
  String name;
  List<RuteHalteBus> halteBus;
  RuteBus({this.key, this.name, this.halteBus});

  bool operator ==(o) => o is RuteBus && o.name == name;
  int get hashCode => name.hashCode;

  @override
  toString() => 'Name: $name';
}

class RuteHalteBus {
  String key;
  String name;
  String latitude;
  String longitude;
  String type;
  String rute;
  String pwt;
  String pbg;
  RuteHalteBus(
      {this.key,
      this.name,
      this.latitude,
      this.longitude,
      this.type,
      this.rute,
      this.pwt,
      this.pbg});

  bool operator ==(o) => o is RuteHalteBus && o.name == name;
  int get hashCode => name.hashCode;

  @override
  toString() => 'Name: $name';
}
