import 'package:basic_app/adding_pages/add_conferenceRoom.dart';
import 'package:basic_app/main/crud.dart';
import 'package:basic_app/models/conferenceRoom_model.dart';
import 'package:flutter/material.dart';

class ConferenceRoomPage extends StatefulWidget {
  const ConferenceRoomPage({Key? key}) : super(key: key);

  @override
  State<ConferenceRoomPage> createState() => _ConferenceRoomPageState();
}

class _ConferenceRoomPageState extends State<ConferenceRoomPage> {
  Crud crud = Crud();
  late Stream<List<ConferenceRoomModel>> _conferenceRoomStream;

  @override
  void initState() {
    _conferenceRoomStream = crud.getConferenceRoom();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Conference Rooms"),
      ),
      body: StreamBuilder<List<ConferenceRoomModel>>(
          stream: _conferenceRoomStream,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const CircularProgressIndicator();
            }
            final conferenceRoom = snapshot.data!;
            return Column(
              children: <Widget>[
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                      columns: const [
                        DataColumn(label: Text("meetingRoomId")),
                        DataColumn(label: Text("meetingRoomName")),
                        DataColumn(label: Text("Center Id")),
                        DataColumn(label: Text("Size")),
                        DataColumn(label: Text("Informal Seats")),
                        DataColumn(label: Text("Credit For 30 Mins")),
                        DataColumn(label: Text("Av"))
                      ],
                      rows: conferenceRoom
                          .map((cr) =>
                          DataRow(cells: [
                            DataCell(Text(cr.centerId)),
                            DataCell(Text(cr.meetingRoomName)),
                            DataCell(Text(cr.centerId)),
                            DataCell(Text(cr.size)),
                            DataCell(Text(cr.informalSeats)),
                            DataCell(Text(cr.creditFor30Mins)),
                            DataCell(Text(cr.av))
                          ]))
                          .toList()),
                )
              ],
            );
          }),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            showDialog(context: context,
                builder: (_)=>const AddConferenceRoom());
          },
          tooltip:"Add Conference Room",
          icon: const Icon(Icons.add),
          label: const Text("Create")),


    );
  }
}
