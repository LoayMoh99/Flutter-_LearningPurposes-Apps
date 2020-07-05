import 'package:flutter/material.dart';

class DesktopNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical:20.0,horizontal: 40),
      child: Container(
        constraints: BoxConstraints(minWidth: 1200),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text('LMHM Official Website ..',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
             Row(
               children: <Widget>[
                Text('Home',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(width: 25,),
              Text('About Us',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(width: 25,),
              Text('Portofollio',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(width: 25,),
              //GF Button
              MaterialButton(
              onPressed: (){},
              color: Colors.pink,
              shape: RoundedRectangleBorder(
                borderRadius:BorderRadius.all(Radius.circular(15))
             ),
              child: Text(
               'Get Started',
                style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                  ),
                 ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

