import 'package:basic_app/center_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Crud{
 static create(CenterModel center) async {
    final locationCollection = FirebaseFirestore.instance.collection( 'Centers');
    final docRef=locationCollection.doc();

    final newCenter=CenterModel(

        name: center.name,
        floors: center.floors,
        area: center.area,
        parking: center.parking
    ).toJson();
    try {
      await docRef.set(newCenter);
    }catch(e){
      print('Some error occured $e');
    }
  }
  static Stream<List<CenterModel>> read(){
   final centerCollection=FirebaseFirestore.instance.collection("Centers");
   return centerCollection.snapshots().map((querysnapshot) =>querysnapshot.docs.map((e) => CenterModel.fromSnapshot(e)).toList());
  }

}
