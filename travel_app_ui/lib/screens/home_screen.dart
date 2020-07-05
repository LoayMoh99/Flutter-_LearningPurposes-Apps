import 'package:flutter/material.dart';
import 'package:flutter_travel_ui_starter/widgets/destination_carousel.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  List<IconData> _icons = [
    FontAwesomeIcons.plane,
    FontAwesomeIcons.bed,
    FontAwesomeIcons.walking,
    FontAwesomeIcons.biking,
  ];

  Widget _iconsBuilder() {
    List<Widget> _temp;
    for (int i = 0; i < _icons.length; i++) {
      _temp[i] = _buildIcon(i);
    }
    return Row(
      children: _temp,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
    );
  }

  Widget _buildIcon(int index) {
    // return CircleAvatar(
    //   radius: 30,
    //   child: Icon(_icons[index]),
    // );
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          color: (_selectedIndex == index)
              ? Theme.of(context).accentColor
              : Colors.grey[400],
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        child: Icon(
          _icons[index],
          size: 25,
          color: (_selectedIndex == index)
              ? Theme.of(context).primaryColor
              : Colors.grey[800],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(
            vertical: 30,
          ),
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                  left: 20, right: 120), //here try to not hardcode paddings!!
              child: Text(
                'What you would like to find?',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.8,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            //_iconsBuilder(), //alternative way than ((below one))..
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: _icons
                  .asMap()
                  .entries
                  .map((map) => _buildIcon(map.key))
                  .toList(),
            ),
            SizedBox(
              height: 20,
            ),
            DestinationCarousel(),
          ],
        ),
      ),
    );
  }
}
