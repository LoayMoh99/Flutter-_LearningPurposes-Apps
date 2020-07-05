import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:studyjam/models/photo.dart';
import 'package:studyjam/widgets/drawer.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> myList =
  [

  ];
  //offlineList
    // 'https://picsum.photos/id/900/800/800',
    // 'https://picsum.photos/id/800/800/800',
    // 'https://picsum.photos/id/700/800/800',
    // 'https://picsum.photos/id/500/800/800',
    // 'https://picsum.photos/id/400/800/800',
    // 'https://picsum.photos/id/300/800/800',
    // 'https://picsum.photos/id/200/800/800',
  Widget _builder(String img)
  {
    return Container(
      padding: EdgeInsets.only(bottom: 10),
      child: Card(
        child: Image.network(img),
      ),
    );
  }
  _addPhoto() async{
    final num = Random().nextInt(100);
    final response =
    await http.get('http://jsonplaceholder.typicode.com/photos/$num');
    //now we need to decode this json to get out of it the url..
    final parsedRes = jsonDecode(response.body);
    final photo = new Photo(
      id: parsedRes['id'],
      albumId: parsedRes['albumId'],
      title: parsedRes['title'],
      url: parsedRes['url'],
      thumbnailUrl: parsedRes['thumbnailUrl']
    );
    setState(() {
      myList.add(photo.url);
    });

    /*final response = http.get('http://jsonplaceholder.typicode.com/photos/1').then((res)
    {
      print(res.body);
    });*/
    //Do something in the future
    // Future.delayed(Duration(seconds: 4),
    // (){ //anomynous function
    //   print('After 4 sec');
    // },
    // );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer:MyDrawer(),
      appBar: AppBar(
        title: Text('Home Screen Title',
          style: TextStyle(fontSize: 30,)
        ),
      ),
      body: Center(
        child: myList.length>0 //condition 
        ? Container( //if true
          width: MediaQuery.of(context).size.width * 0.9,
          child: ListView.builder(
            itemCount: myList.length,
            itemBuilder: (BuildContext context, int index) {
              return _builder(myList[index]);
          },
          ),
        )
        :CircularProgressIndicator(), //if false
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
        ),
        onPressed: ()=>_addPhoto(),
      ),
      // body: Container(
      //   //color: Theme.of(context).accentColor,
      //   child: Column(
      //     children: <Widget>[
      //       Center(
      //         child: Text('Welcome to Home Screen!!',
      //         textAlign: TextAlign.center,
      //          style: TextStyle(
      //            fontSize: 50,
      //          ),
      //         ),
      //       ),
      //       SizedBox(
      //         height: 160,
      //       ),
      //       Row(
      //         children: <Widget>[
      //           Expanded(
      //            child: FloatingActionButton(
      //              heroTag: "btn1",
      //                 child: Icon(
      //                    Icons.favorite,
      //                 color: Colors.red,
      //               ),
      //               onPressed: ()=>{},
      //              ),
      //           ),
      //            Expanded(
      //             child: FloatingActionButton(
      //               heroTag: "btn2",
      //                 child: Icon(
      //                    Icons.favorite,
      //                 color: Colors.red,
      //               ),
      //               onPressed: ()=>{},
      //              ),
      //            ),
      //         ],
      //       ),
        //     SizedBox(
        //       height: 60,
        //     ),
        //     Center(
        //       child: CupertinoButton(
        //         child: Icon(
        //            Icons.favorite,
        //         color: Colors.red,
        //       ),
        //       onPressed: ()=>{},
        //       )
        //     ),
    //       ],
    //      ),
    //   ),
     );
  }
}