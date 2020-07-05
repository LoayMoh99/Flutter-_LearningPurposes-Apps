import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:studyjam/models/photo.dart';
import 'package:studyjam/models/photo_list.dart';
import 'package:studyjam/widgets/drawer.dart';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class Screen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text('Screen1 Title',
            style: TextStyle(
              fontSize: 30,
            )),
      ),
      body: Center(
        //this way is used with stateless widget
        //it can be functioned with the stateful widget and initializing 
        //list with initial Constructor..
        child: FutureBuilder(
          future: fetchPhotos(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            return snapshot.hasData
            ? PhotoList(photos: snapshot.data,)
            : Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}

Future<List<Photo>> fetchPhotos() async{
  //just this get the photos from the url.. 
    final response =
    await http.get('http://jsonplaceholder.typicode.com/photos');
    final responseBody = response.body;
    //here it also isolate it ta5wofa to take alot of time to get the photos
    return compute(parsePhotos, responseBody);
}

List<Photo> parsePhotos(String responseBody)
{
  //now we need to decode this json to get out of it the url..
  //here the map -> i.e. String -> id/title and duynamic as it may be int,String ..
  final parsedResponse = json.decode(responseBody).cast<Map<String,dynamic>>();

  //here we will convert this decoded json to List of photos b2a with the 'map' method..
  return parsedResponse.map<Photo>((js)=>Photo.fromJson(js)).toList();
}
