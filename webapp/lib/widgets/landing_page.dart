import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
List<Widget> _pageChildren(double wid,double fontScale,bool isDesktop)
{
  return <Widget>[
        Container(
        width: wid-20,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: isDesktop ? CrossAxisAlignment.start : CrossAxisAlignment.center ,
          children: <Widget>[
            Text('Welcome \nEveryBody',
              style: TextStyle(
                  fontSize: 60/fontScale,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
            ),
            SizedBox(height: 30,),
            Text("I hope you enjoy our Site,\nand Don't forget to take a look of our Projects",
              style: TextStyle(
                  fontSize: 30/fontScale,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
            ),
            SizedBox(height: 30,),
             MaterialButton(
                onPressed: (){},
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius:BorderRadius.all(Radius.circular(15))
               ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                   'Our Projects',
                    style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                    fontSize: 20/fontScale,
                      ),
                     ),
                ),
              ),
          ],
        ),
      ),
    Padding(
      padding: const EdgeInsets.symmetric(vertical:30),
      child: Image.asset('assets/images/loay.jpg',width: wid-20,),
    ),
  ];
}

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context,constraints){
        if (constraints.maxWidth>800) //desktop display
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: _pageChildren(constraints.biggest.width/2,1,true)
          );
        else //mobile size
           return Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: _pageChildren(constraints.biggest.width,1.5,false)
          ); 
      },
    );
  }
}