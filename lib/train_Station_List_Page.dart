import 'package:flutter/material.dart';
import 'package:flutter_train_app/hompage.dart';

class StationListPage extends StatefulWidget{

  StationListPage(this.end, this.station);

  String? end;
  String? station;

  @override
  State<StationListPage> createState() => _StationListPageState();
}

class _StationListPageState extends State<StationListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.end}')
      ),
      body:ListView(
        // "수서","동탄","평택지제","천안아산","오송","대전","김천구미","동대구","경주","울산","부산"
           padding:const EdgeInsets.all(8),
           children: [
            stationName("수서"),
            stationName("동탄"),
            stationName("평택지제"),
            stationName("천안아산"),
            stationName("오송"),
            stationName("대전"),
            stationName("김천구미"),
            stationName("동대구"),
            stationName("경주"),
            stationName("울산"),
            stationName("부산"),
           ],
         ),
    );
  }

  GestureDetector stationName(String name){
    return GestureDetector(
       onTap: () {
        Navigator.pop(context, name);
      },
      child: Container(
      height: 50,
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text("$name",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18
          ),
            ),
      ),
    decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color:Colors.grey[300]!),))));
  }
}
