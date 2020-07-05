import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';

class SecondScreen extends StatefulWidget {
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  FlutterBlue flutterBlue = FlutterBlue.instance;
  String status = 'Dis-Connected';
  BluetoothDevice device;

  void bluetooth() async {
    // Start scanning
    flutterBlue.startScan(timeout: Duration(seconds: 4));

    await device.connect();
    // Listen to scan results
      //var subscription = flutterBlue.scanResults.listen((scanResult) {
    // do something with scan result
        //device = scanResult.;
        //print('${device.name} found! rssi: ${scanResult.rssi}');
    //});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            FloatingActionButton(onPressed: (){
              bluetooth();
            },),
            Text(status),
          ],
        ),
      ),
    );
  }
}