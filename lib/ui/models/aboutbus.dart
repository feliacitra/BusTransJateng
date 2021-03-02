import 'package:firebase_database/firebase_database.dart';

class ListBus {
  final String key;
  final String latitude;
  final String longitude;
  final String markerId;
  ListBus({this.key, this.latitude, this.longitude, this.markerId});

  @override
  String toString() {
    return 'Bus{key: $key, latitude: $latitude, longitude: $longitude, markerId: $markerId}';
  }
}

final List<ListBus> _buses = [];
String _latitude = '';
String _longitude = '';
List<ListBus> get buses => _buses;
