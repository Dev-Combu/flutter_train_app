import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SeatPage extends StatefulWidget {
  SeatPage(this.start, this.last);

  String? start;
  String? last;

  @override
  State<SeatPage> createState() => _SeatPageState();
}

class _SeatPageState extends State<SeatPage> {
  int? selectedRow;
  int? selectedCol;

  void onSelected(int row, int col) {
    setState(() {
      selectedRow = row;
      selectedCol = col;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('좌석 선택'),
      ),
      body: Center(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                StartToLast(),
                
                BookButton(context),
              ],
            )),
      ),
    );
  }

  Row StartToLast() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Expanded(
        child: Text(
          '${widget.start}',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.purple, fontSize: 30),
        ),
      ),
      Icon(Icons.arrow_circle_right_outlined, size: 30), // 아이콘 크기 조정
      Expanded(
        child: Text(
          '${widget.last}',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.purple, fontSize: 30),
        ),
      ),
    ],
  );
  }



  SizedBox BookButton(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            showCupertinoDialog(
                context: context,
                builder: (context) {
                  return CupertinoAlertDialog(
                      title: Text('예약확인'),
                      content: Text('예약 하시겠습니까?'),
                      actions: [
                        CupertinoDialogAction(
                          isDefaultAction: true,
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('취소'),
                        ),
                        CupertinoDialogAction(
                            isDestructiveAction: true,
                            onPressed: () {},
                            child: Text('확인')),
                      ]);
                });
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.purple,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20))),
          child: Text(
            "예매 하기",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ));
  }
}
