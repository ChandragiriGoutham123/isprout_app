import 'package:basic_app/models/assets_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AssetDao {
  final CollectionReference _assetRef =
      FirebaseFirestore.instance.collection("Assets");

  Future<void> addAsset(AssetsModel asset) {
    return _assetRef.doc(asset.assetID).set(asset.toJson());
  }

  Stream<List<AssetsModel>> getAsset() {
    return _assetRef.snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => AssetsModel.fromsnapshot(doc)).toList());
  }
}
