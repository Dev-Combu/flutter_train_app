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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    label('선택됨', Colors.purple),
                    SizedBox(width: 20),
                    label('선택안됨', Colors.grey[300]!),
                  ],
                ),
                Expanded(
                  child: ListView(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'A',
                            style: TextStyle(fontSize: 18),
                          ),
                          Text(
                            'B',
                            style: TextStyle(fontSize: 18),
                          ),
                          Text(
                            '   ',
                            style: TextStyle(fontSize: 18),
                          ),
                          Text(
                            'C',
                            style: TextStyle(fontSize: 18),
                          ),
                          Text(
                            'D',
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                      row(1),
                      row(2),
                      row(3),
                      row(4),
                      row(5),
                      row(6),
                      row(7),
                      row(8),
                      row(9),
                      row(10),
                      row(11),
                      row(12),
                      row(13),
                      row(14),
                      row(15),
                      row(16),
                      row(17),
                      row(18),
                      row(19),
                      row(20),
                    ],
                  ),
                ),
                BookButton(context),
              ],
            )),
      ),
    );
  }

  //홈 화면에서 출발역과 도착역 정보를 넘겨받아서 보여주는 위젯
  Row StartToLast() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: Text(
            '${widget.start}',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.purple,
                fontSize: 30),
          ),
        ),
        Icon(Icons.arrow_circle_right_outlined, size: 30), // 아이콘 크기 조정
        Expanded(
          child: Text(
            '${widget.last}',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.purple,
                fontSize: 30),
          ),
        ),
      ],
    );
  }

  // 예약 버튼의 기능을 정의한 위젯
  Widget BookButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              if(selectedRow == null && selectedCol == null){}
              else{
              showCupertinoDialog(
                  context: context,
                  builder: (context) {
                    String? col;
                    switch (selectedCol) {
                      case 1:
                      col = "A";
                      case 2:
                      col = "B";
                      case 3:
                      col = "C";
                      case 4:
                      col = "D";
                    }
                    return CupertinoAlertDialog(
                        title: Text('예매 하시겠습니까?'),
                        content: Text(
                          selectedRow == null && selectedCol == null
                              ? '선택된 좌석 없음'
                              : '좌석 : $selectedRow-$col'
                        ),
                        actions: [
                          CupertinoDialogAction(
                            isDestructiveAction: true,
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('취소'),
                          ),
                          CupertinoDialogAction(
                              isDefaultAction: true,
                              onPressed: () {
                                Navigator.popUntil(context, (route) => route.isFirst);
                              },
                              child: Text('확인')),
                        ]);
                  });};
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
          )),
    );
  }

  //좌석의 상태가 어떤것인지를 나타내주는 메뉴의 상자를 정의한 위젯
  Widget label(String text, Color color) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          SizedBox(width: 4),
          Text(text),
        ],
      ),
    );
  }

  // 좌석을 한 행을 정의한 위젯
  Widget row(int rowNum) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          seat(rowNum, 1),
          seat(rowNum, 2),
          Expanded(
            child: Center(
              child: Text(
                '$rowNum',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          seat(rowNum, 3),
          seat(rowNum, 4),
        ],
      ),
    );
  }

  //좌석의 상태를 표현하는 위젯
  Widget seat(int rowNum, int colNum) {
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
      child: GestureDetector(
        onTap: () {
          onSelected(rowNum, colNum);
        },
        child: AspectRatio(
          aspectRatio: 1,
          child: Container(
              decoration: BoxDecoration(
            color: rowNum == selectedRow && colNum == selectedCol
                ? Colors.purple
                : Colors.grey[300],
            borderRadius: BorderRadius.circular(8),
          )),
        ),
      ),
    ));
  }
}
