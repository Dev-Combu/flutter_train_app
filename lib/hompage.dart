import 'package:flutter/material.dart';
import 'package:flutter_train_app/train_Station_List_Page.dart';

class HomePage extends StatefulWidget{  
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{

  String? start = '';
  String? last = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('기차 예매'),
        ),
        backgroundColor: Colors.grey[200],
        body: Center(
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  station("$start", "$last"),
                  SizedBox(height: 20),
                  Seat_Choice(),
                ],
              )),
        ));
  }

  Widget station(String start, String last) {
    return SizedBox(
      child: Container(
        height: 200,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              label("출발역", start),
              Container(
                width: 2,
                height: 50,
                color: Colors.grey[400],
              ),
              label("도착역", last)
            ])
          ],
        ),
      ),
    );
  }

  GestureDetector label(String label, String? station) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => StationListPage('$label'),
          ),
        );
      },
      child: Column(
        children: [
          Text('$label',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              )),
          Text(
            station = station == '' ? '선택' : '$station',
            style: TextStyle(fontSize: 40),
          ),
        ],
      ),
    );
  }
}

class Seat_Choice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.purple,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12))),
        child: Text(
          "좌석 선택",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
