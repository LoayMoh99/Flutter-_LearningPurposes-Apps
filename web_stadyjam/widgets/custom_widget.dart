import 'package:flutter/material.dart';

class CustomWidget extends StatelessWidget {

  final String content;
  final Color textColor;
  final Color backgroundColor;

  CustomWidget({@required this.content, this.textColor=Colors.black ,this.backgroundColor =Colors.blueAccent});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      width: MediaQuery.of(context).size.width,
      child: Text(
        content,
        style: TextStyle(
          color: textColor,
        ),
      ),
    );
  }
}