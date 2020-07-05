import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App Demo',
      theme: ThemeData.dark().copyWith(
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.redAccent,
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool switched = false;
  double sliderVal = 10;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Text("Slider value=$sliderVal + $switched"),
          Row(
            children: <Widget>[
              FlatButton(
                onPressed: () {},
                child: Text("Flat btn"),
              ),
              RaisedButton(
                onPressed: () {},
                child: Text("Raised btn"),
              ),
              OutlineButton(
                onPressed: () {},
                child: Text("Outline btn"),
              )
            ],
          ),
          Switch(
            value: switched,
            onChanged: (isSwitched) {
              setState(() {
                switched = isSwitched;
              });
            },
          ),
          Slider(
            value: sliderVal,
            onChanged: (newValue) {
              setState(() {
                sliderVal = newValue;
              });
            },
            min: 0,
            max: 100,
          ),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Input",
              hintText: "Write Here..",
            ),
            obscureText: true, //for passwords
            keyboardType: TextInputType.number, //for number inputs only
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.home),
      ),
    );
  }
}
