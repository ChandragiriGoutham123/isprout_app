import 'package:basic_app/models/vendors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class VendorsDao {
  final CollectionReference _vendor =
      FirebaseFirestore.instance.collection('Vendors');

  Future<void> addVendor(VendorModel vendor) {
    return _vendor.doc(vendor.vendorID).set(vendor.toJson());
  }

  Stream<List<VendorModel>> getVendor() {
    return _vendor.snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => VendorModel.fromsnapshot(doc)).toList());
  }
}
