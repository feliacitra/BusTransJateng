// import 'package:firebase_database/firebase_database.dart';

class ListBus {
  final String key;
  final String latitude;
  final String longitude;
  final String markerId;
  final String distance;
  ListBus(
      {this.key, this.latitude, this.longitude, this.markerId, this.distance});

  @override
  String toString() {
    return 'Bus{key: $key, latitude: $latitude, longitude: $longitude, markerId: $markerId,distance: $distance}';
  }
}
