import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
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
                  station("서울", "부산"),
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
              label("시작", start),
              Container(
                width: 2,
                height: 50,
                color: Colors.grey[400],
              ),
              label("도착", last)
            ])
          ],
        ),
      ),
    );
  }

  Column label(String label, String station) {
    return Column(
      children: [
        Text('$label',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            )),
        Text(
          '$station',
          style: TextStyle(fontSize: 40),
        ),
      ],
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
