import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'menu_items.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Theme.of(context).primaryColor,
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountEmail: Text('loaymohamed1999@gmail.com'),
              accountName: Text('Loay Mohamed Hamed'),
              currentAccountPicture: Image.asset('assets/images/loay.jpg'),
            ),
            SizedBox(
              height: 5,
            ),
            Divider(
              color: Colors.white,
            ),
            MenuItems(),
          ],
        ),
      ),
    );
  }
}
