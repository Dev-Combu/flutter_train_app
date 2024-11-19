import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_train_app/train_Station_List_Page.dart';
import 'package:flutter_train_app/train_seat_page.dart';

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
                  station(start ?? '', last ?? ''),
                  SizedBox(height: 20),
                  SeatChoice(),
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
              Expanded(
                child: label("출발역", start, true),
              ),
              Container(
                width: 2,
                height: 50,
                color: Colors.grey[400],
              ),
              Expanded(
                child: label("도착역", last, false),
              ),
            ])
          ],
        ),
      ),
    );
  }

  GestureDetector label(String label, String? station, bool isStart) {
    return GestureDetector(
      onTap: () async {
        String? selectedStation = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => StationListPage(label, station),
          ),
        );
        if (selectedStation != null) {
          setState(() {
            if (isStart) {
              start = selectedStation; // 출발역 업데이트
            } else {
              last = selectedStation; // 도착역 업데이트
            }
          });
        }
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

  Widget SeatChoice() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          start == '' || last == ''
              ? showCupertinoDialog(
                  context: context,
                  builder: (context) {
                    return CupertinoAlertDialog(
                      title: Text('경고!'),
                      content: Text('역을 선택하십시오'),
                      actions: [
                        CupertinoDialogAction(
                            isDefaultAction: false,
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('확인'))
                      ],
                    );
                  })
              : 
                  Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SeatPage(start, last),
                  ),
                );
        },
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.purple,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20))),
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
