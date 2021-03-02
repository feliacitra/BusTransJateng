import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bus_trans_jateng/ui/models/halte_bus.dart';
import 'package:bus_trans_jateng/ui/models/rute_bus.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});
  // // collection reference
  final CollectionReference ruteHalteBusCollection =
      Firestore.instance.collection('halte_bus');
  final CollectionReference ruteBusCollection =
      Firestore.instance.collection('rute_bus');

  // Halte Bus list from snapshot
  List<HalteBus> _ruteHalteBusListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return HalteBus(
        key: doc.documentID ?? '',
        name: doc.data['name'] ?? '',
        latitude: doc.data['latitude'] ?? '',
        longitude: doc.data['longitude'] ?? '',
        type: doc.data['type'] ?? '',
        rute: doc.data['rute'] ?? '',
      );
    }).toList();
  }

  // get rute bus stream
  Stream<List<HalteBus>> get haltebuses {
    return ruteHalteBusCollection
        .snapshots()
        .map(_ruteHalteBusListFromSnapshot);
  }

  List<RuteBus> _ruteBusListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return RuteBus(
        key: doc.documentID ?? '',
        name: doc.data['name'] ?? '',
      );
    }).toList();
  }

// get rute bus stream
  Stream<List<RuteBus>> get rutebuses {
    return ruteBusCollection.snapshots().map(_ruteBusListFromSnapshot);
  }
}
