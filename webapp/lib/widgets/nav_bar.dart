import 'package:flutter/material.dart';

import 'desktop_navbar.dart';
import 'mobile_navbar.dart';


class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context,constraints){
        if (constraints.maxWidth>=1200) //desktop display
          return DesktopNavBar();
        else if(constraints.maxWidth >=800 && constraints.maxWidth <1200) //tablet size 
          return DesktopNavBar(); 
        else //mobile size
          return MobileNavBar();
      },
    );
  }
}
