
import 'package:cloud_firestore/cloud_firestore.dart';


class CenterModel {
  final String name;
  final String floors;
  final String area;
  final String parking;

  CenterModel(
      { required this.name, required this.floors,required this.area, required this.parking});

  factory CenterModel.fromSnapshot(DocumentSnapshot snap){
    var snapshot = snap.data() as Map<String, dynamic>;
    return CenterModel(

        name: snapshot['name'],
        floors:  snapshot['floors'],
        area:  snapshot['area'],
        parking:  snapshot['parking']
    );
  }
  Map<String,dynamic> toJson()=>{
    "name":name,
    "floors":floors,
    "area":area,
    "parking":parking
  };
}


