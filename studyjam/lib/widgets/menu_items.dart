import 'package:flutter/material.dart';


class MenuItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Card(
          elevation: 10, //الظل اللي تحتيه
          child: ListTile(
            leading: CircleAvatar(
              child: FlutterLogo(),
            ),
            title: Text(
              'Home Screen',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            trailing: Icon(
              Icons.favorite,
              color: Colors.red,
            ),
            onTap: () => {
              Navigator.of(context).pushNamed('/'),
            },
          ),
        ),

        Card(
          elevation: 10, //الظل اللي تحتيه
          child: ListTile(
            leading: CircleAvatar(
              child: FlutterLogo(),
            ),
            title: Text(
              'First Screen',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () => {
             Navigator.of(context).pushNamed('/first'),
            },
          ),
        ),

        Card(
          elevation: 10, //الظل اللي تحتيه
          child: ListTile(
            leading: CircleAvatar(
              child: FlutterLogo(),
            ),
            title: Text(
              'Second Screen',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () => {
             //Navigator.of(context).pushNamed('/first'),
            },
          ),
        ),
      ],
    );
  }
}


