import 'package:bus_trans_jateng/ui/models/rute_bus.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});
  // // collection reference
  final CollectionReference ruteHalteBusCollection =
      Firestore.instance.collection('halte_bus');
  final CollectionReference ruteBusCollection =
      Firestore.instance.collection('rute_bus');

  // Halte Bus list from snapshot
  List<RuteHalteBus> _ruteHalteBusListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return RuteHalteBus(
          key: doc.documentID ?? '',
          name: doc.data['name'] ?? '',
          latitude: doc.data['latitude'] ?? '',
          longitude: doc.data['longitude'] ?? '',
          type: doc.data['type'] ?? '',
          rute: doc.data['rute'] ?? '',
          pwt: doc.data['pwt'] ?? '',
          pbg: doc.data['pbg'] ?? '');
    }).toList();
  }

  // get rute bus stream
  Stream<List<RuteHalteBus>> get rutehaltebuses {
    return ruteHalteBusCollection
        .snapshots()
        .map(_ruteHalteBusListFromSnapshot);
  }

  List<RuteBus> _ruteBusListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return RuteBus(
        key: doc.documentID ?? '',
        name: doc.data['nama'] ?? '',
      );
    }).toList();
  }

// get rute bus stream
  Stream<List<RuteBus>> get rutebuses {
    return ruteBusCollection.snapshots().map(_ruteBusListFromSnapshot);
  }
}

// Rute Bus list from snapshot
