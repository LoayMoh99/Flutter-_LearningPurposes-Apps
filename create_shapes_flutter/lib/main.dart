import 'package:flutter/material.dart';
import 'dart:io';

List<int> code = [
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0
];
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Create Shapes with Pixels',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Color> colors = [
    Colors.lightBlue,
    Colors.lightBlue,
    Colors.lightBlue,
    Colors.lightBlue,
    Colors.lightBlue,
    Colors.lightBlue,
    Colors.lightBlue,
    Colors.lightBlue,
    Colors.lightBlue,
    Colors.lightBlue,
    Colors.lightBlue,
    Colors.lightBlue,
    Colors.lightBlue,
    Colors.lightBlue,
    Colors.lightBlue,
    Colors.lightBlue,
    Colors.lightBlue,
    Colors.lightBlue,
    Colors.lightBlue,
    Colors.lightBlue,
    Colors.lightBlue,
    Colors.lightBlue,
    Colors.lightBlue,
    Colors.lightBlue,
    Colors.lightBlue,
    Colors.lightBlue,
    Colors.lightBlue,
    Colors.lightBlue,
    Colors.lightBlue,
    Colors.lightBlue,
    Colors.lightBlue,
    Colors.lightBlue,
    Colors.lightBlue,
    Colors.lightBlue,
    Colors.lightBlue,
    Colors.lightBlue,
    Colors.lightBlue,
    Colors.lightBlue,
    Colors.lightBlue,
    Colors.lightBlue,
    Colors.lightBlue,
    Colors.lightBlue,
    Colors.lightBlue,
    Colors.lightBlue,
    Colors.lightBlue,
    Colors.lightBlue,
    Colors.lightBlue,
    Colors.lightBlue,
    Colors.lightBlue,
    Colors.lightBlue,
    Colors.lightBlue,
    Colors.lightBlue,
    Colors.lightBlue,
    Colors.lightBlue,
    Colors.lightBlue,
    Colors.lightBlue,
    Colors.lightBlue,
    Colors.lightBlue,
    Colors.lightBlue,
    Colors.lightBlue,
    Colors.lightBlue,
    Colors.lightBlue,
    Colors.lightBlue,
    Colors.lightBlue,
    Colors.lightBlue,
    Colors.lightBlue,
    Colors.lightBlue,
    Colors.lightBlue,
    Colors.lightBlue,
    Colors.lightBlue,
    Colors.lightBlue,
    Colors.lightBlue,
    Colors.lightBlue,
    Colors.lightBlue,
    Colors.lightBlue,
    Colors.lightBlue,
    Colors.lightBlue,
    Colors.lightBlue,
    Colors.lightBlue,
    Colors.lightBlue,
    Colors.lightBlue,
    Colors.lightBlue,
    Colors.lightBlue,
    Colors.lightBlue,
    Colors.lightBlue,
    Colors.lightBlue,
    Colors.lightBlue,
    Colors.lightBlue,
    Colors.lightBlue,
    Colors.lightBlue,
    Colors.lightBlue,
    Colors.lightBlue,
    Colors.lightBlue,
    Colors.lightBlue,
    Colors.lightBlue,
    Colors.lightBlue,
    Colors.lightBlue,
    Colors.lightBlue,
    Colors.lightBlue,
    Colors.lightBlue,
  ];
  Widget createRow(int rowInd) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              code[rowInd * 10 + 9] = (code[rowInd * 10 + 9] == 1) ? 0 : 1;

              setState(() {
                colors[rowInd * 10 + 9] =
                    (Colors.yellowAccent != colors[rowInd * 10 + 9])
                        ? Colors.yellowAccent
                        : Colors.lightBlue;
              });
            },
            child: Container(
              color: colors[rowInd * 10 + 9],
              child: Text('${rowInd}9'),
            ),
          ),
          GestureDetector(
            onTap: () {
              code[rowInd * 10 + 8] = (code[rowInd * 10 + 8] == 1) ? 0 : 1;

              setState(() {
                colors[rowInd * 10 + 8] =
                    (Colors.yellowAccent != colors[rowInd * 10 + 8])
                        ? Colors.yellowAccent
                        : Colors.lightBlue;
              });
            },
            child: Container(
              color: colors[rowInd * 10 + 8],
              child: Text('${rowInd}8'),
            ),
          ),
          GestureDetector(
            onTap: () {
              code[rowInd * 10 + 7] = (code[rowInd * 10 + 7] == 1) ? 0 : 1;

              setState(() {
                colors[rowInd * 10 + 7] =
                    (Colors.yellowAccent != colors[rowInd * 10 + 7])
                        ? Colors.yellowAccent
                        : Colors.lightBlue;
              });
            },
            child: Container(
              color: colors[rowInd * 10 + 7],
              child: Text('${rowInd}7'),
            ),
          ),
          GestureDetector(
            onTap: () {
              code[rowInd * 10 + 6] = (code[rowInd * 10 + 6] == 1) ? 0 : 1;

              setState(() {
                colors[rowInd * 10 + 6] =
                    (Colors.yellowAccent != colors[rowInd * 10 + 6])
                        ? Colors.yellowAccent
                        : Colors.lightBlue;
              });
            },
            child: Container(
              color: colors[rowInd * 10 + 6],
              child: Text('${rowInd}6'),
            ),
          ),
          GestureDetector(
            onTap: () {
              code[rowInd * 10 + 5] = (code[rowInd * 10 + 5] == 1) ? 0 : 1;

              setState(() {
                colors[rowInd * 10 + 5] =
                    (Colors.yellowAccent != colors[rowInd * 10 + 5])
                        ? Colors.yellowAccent
                        : Colors.lightBlue;
              });
            },
            child: Container(
              color: colors[rowInd * 10 + 5],
              child: Text('${rowInd}5'),
            ),
          ),
          GestureDetector(
            onTap: () {
              code[rowInd * 10 + 4] = (code[rowInd * 10 + 4] == 1) ? 0 : 1;

              setState(() {
                colors[rowInd * 10 + 4] =
                    (Colors.yellowAccent != colors[rowInd * 10 + 4])
                        ? Colors.yellowAccent
                        : Colors.lightBlue;
              });
            },
            child: Container(
              color: colors[rowInd * 10 + 4],
              child: Text('${rowInd}4'),
            ),
          ),
          GestureDetector(
            onTap: () {
              code[rowInd * 10 + 3] = (code[rowInd * 10 + 3] == 1) ? 0 : 1;

              setState(() {
                colors[rowInd * 10 + 3] =
                    (Colors.yellowAccent != colors[rowInd * 10 + 3])
                        ? Colors.yellowAccent
                        : Colors.lightBlue;
              });
            },
            child: Container(
              color: colors[rowInd * 10 + 3],
              child: Text('${rowInd}3'),
            ),
          ),
          GestureDetector(
            onTap: () {
              code[rowInd * 10 + 2] = (code[rowInd * 10 + 2] == 1) ? 0 : 1;

              setState(() {
                colors[rowInd * 10 + 2] =
                    (Colors.yellowAccent != colors[rowInd * 10 + 2])
                        ? Colors.yellowAccent
                        : Colors.lightBlue;
              });
            },
            child: Container(
              color: colors[rowInd * 10 + 2],
              child: Text('${rowInd}2'),
            ),
          ),
          GestureDetector(
            onTap: () {
              code[rowInd * 10 + 1] = (code[rowInd * 10 + 1] == 1) ? 0 : 1;

              setState(() {
                colors[rowInd * 10 + 1] =
                    (Colors.yellowAccent != colors[rowInd * 10 + 1])
                        ? Colors.yellowAccent
                        : Colors.lightBlue;
              });
            },
            child: Container(
              color: colors[rowInd * 10 + 1],
              child: Text('${rowInd}1'),
            ),
          ),
          GestureDetector(
            onTap: () {
              code[rowInd * 10 + 0] = (code[rowInd * 10 + 0] == 1) ? 0 : 1;

              setState(() {
                colors[rowInd * 10 + 0] =
                    (Colors.yellowAccent != colors[rowInd * 10 + 0])
                        ? Colors.yellowAccent
                        : Colors.lightBlue;
              });
            },
            child: Container(
              color: colors[rowInd * 10 + 0],
              child: Text('${rowInd}0'),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          for (int i = 0; i < 100; i++) {
            if (code[i] == 0)
              stdout.write('0');
            else
              stdout.write('1');
          }
        },
        child: Icon(Icons.add_alert),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return createRow(index);
          },
        ),
      ),
    );
  }
}
