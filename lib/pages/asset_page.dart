import 'package:basic_app/DAO/assets_dao.dart';
import 'package:basic_app/adding_pages/add_assets.dart';
import 'package:flutter/material.dart';

import '../models/assets_model.dart';

class AssetPage extends StatefulWidget {
  const AssetPage({Key? key}) : super(key: key);

  @override
  State<AssetPage> createState() => _AssetPageState();
}

class _AssetPageState extends State<AssetPage> {
  late Stream<List<AssetsModel>> _assetStream;
  final AssetDao _assetDao=AssetDao();

@override
  void initState() {
  _assetStream=_assetDao.getAsset();
  super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Assets"),
      ),
      body: StreamBuilder<List<AssetsModel>>(
        stream: _assetStream,
        builder:(context, snapshot){
          if(!snapshot.hasData){
            return const CircularProgressIndicator();
          }
          final asset=snapshot.data!;
          return SingleChildScrollView(
            child: Column(
              children: [
                //assetID assetName centreID privateOfficeID type description value
                DataTable(columns: const [
                  DataColumn(label: Text("Asset Id")),
                  DataColumn(label: Text("Asset Name")),
                  DataColumn(label: Text("Center Id")),
                  DataColumn(label: Text("Private Office Id")),
                  DataColumn(label: Text("Type")),
                  DataColumn(label: Text("Description")),
                  DataColumn(label: Text("Value"))

                ], rows:asset.map((e) =>  DataRow(cells: [
                 DataCell(Text(e.assetID)),
                  DataCell(Text(e.assetName)),
                  DataCell(Text(e.centreID)),
                  DataCell(Text(e.privateOfficeID)),
                  DataCell(Text(e.type)),
                  DataCell(Text(e.description)),
                  DataCell(Text(e.value))
                ])).toList()

                )
              ],
            ),
          );
        }, 
      ),
      floatingActionButton: FloatingActionButton.extended(onPressed: (){
        showDialog(context: context, builder: (_)=>const AddAsset());
      }, label: const Text("Add Asset")),

    );
  }
}
