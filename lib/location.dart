import 'package:cloud_firestore/cloud_firestore.dart';

import 'center_model.dart';

class LocationModel {
  final String name;
 final List<CenterModel> center;
  final double totalarea;

  LocationModel({required this.name, required this.center,required this.totalarea});


  factory LocationModel.fromSnapshot(DocumentSnapshot snap){
    var snapshot = snap.data() as Map<String, dynamic>;
    return LocationModel(

        name: snapshot['name'],
        center:snapshot['centers'],
        totalarea:  snapshot['area'],

    );
  }
  Map<String,dynamic> toJson()=>{
    "name":name,
    "centers":center,
    "area":totalarea,
  };
}

