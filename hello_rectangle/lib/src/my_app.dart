import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BodyFunc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title:Text('item 1'),
          subtitle: Text('subitem 1'), 
          onTap: (){
          print('Item1 am clicked!!');
          },
        ),
        ListTile(
          title:Text('item 2'),
          subtitle: Text('subitem 2'), 
          onTap: (){
          print('Item2 am clicked!!');
          },
        ),
        ListTile(
          title:Text('item 3'),
          subtitle: Text('subitem 3'), 
          onTap: (){
          print('Item3 am clicked!!');
          },
        ),
        ListTile(
          title:Text('item 4'),
          subtitle: Text('subitem 4'), 
          onTap: (){
          print('Item4 am clicked!!');
          },
        ),
      ],
    );
  }

}

