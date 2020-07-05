import 'package:flutter/material.dart';

class MobileNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical:20.0,horizontal: 40),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              Text('LMHM Official Website ..',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Home',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(width: 20,),
                Text('About Us',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(width: 20,),
                Text('Portofollio',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                ],
              ),
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
        ),
      ),
    );
  }
}