import 'package:google_maps_flutter/google_maps_flutter.dart';

class HalteList {
  String halteName;
  String description;
  String thumbNail;
  LatLng locationCoords;

  HalteList({
    this.halteName,
    this.description,
    this.thumbNail,
    this.locationCoords,
  });
}

final List<HalteList> daftarhalte = [
  HalteList(
    halteName: 'Simpang 4 Karangbawang 2',
    description: 'Halte PWT',
    locationCoords: LatLng(-7.4387595, 109.2493917),
  ),
  HalteList(
    halteName: 'Simpang 4 Karangbawang 1',
    description: 'Halte PWT',
    locationCoords: LatLng(-7.438908, 109.2484683),
  )
];
