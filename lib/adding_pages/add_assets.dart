import 'package:basic_app/DAO/assets_dao.dart';
import 'package:basic_app/main/base_page.dart';
import 'package:basic_app/models/assets_model.dart';
import 'package:flutter/material.dart';

class AddAsset extends StatefulWidget {
  const AddAsset({Key? key}) : super(key: key);

  @override
  AddAssetState createState() => AddAssetState();
}

class AddAssetState extends BasePageState<AddAsset> {
final AssetDao _assetDao=AssetDao();
 final TextEditingController _assetID=TextEditingController();
 final TextEditingController _assetName=TextEditingController();
 final TextEditingController _centreID=TextEditingController();
 final TextEditingController _privateOfficeID=TextEditingController();
 final TextEditingController _type=TextEditingController();
 final TextEditingController _description=TextEditingController();
 final TextEditingController _value=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(child:Column(
        children: <Widget>[
          textArea(_assetID, "Asset Id"),
          textArea(_assetName, "Asset Name"),
          textArea(_centreID, "Center Id"),
          textArea(_privateOfficeID, "Private OfficeId"),
          textArea(_type, "Type"),
          textArea(_description, "Description"),
          textArea(_value, "Value"),
        const SizedBox(height: 30,),
          ElevatedButton(onPressed: (){
            _assetDao.addAsset(AssetsModel(assetID: _assetID.text,
            assetName: _assetName.text,
            centreID: _centreID.text,
            privateOfficeID: _privateOfficeID.text,
            type: _type.text,
            description: _description.text,
            value: _value.text));
          }, child: const Text("Add"))

        ],
      ),

      ),

    );
  }
}




