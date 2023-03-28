import 'package:basic_app/main/crud.dart';
import 'package:flutter/material.dart';

import '../models/private_offices_model.dart';

class PrivateOfficePage extends StatefulWidget {
  const PrivateOfficePage({Key? key}) : super(key: key);

  @override
  State<PrivateOfficePage> createState() => _PrivateOfficePageState();
}

class _PrivateOfficePageState extends State<PrivateOfficePage> {
  late Stream<List<PrivateOfficeModel>> _privateOfficeStream;
  Crud crud=Crud();
  @override
  void initState() {
    _privateOfficeStream=crud.getPrivateOffice();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Private Office"),
      ),
      body: StreamBuilder<List<PrivateOfficeModel>>(
        stream: _privateOfficeStream,
        builder: (Context,snapshot){
          if(snapshot.hasData){

          }
        },
      ),

    );
  }
}
