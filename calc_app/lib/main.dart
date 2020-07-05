import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
String result ='0';

String output ='0';
String operend ='';
double num1=0.0;
double num2=0.0;

  calculation(String btnStr)
  {
    if(btnStr=='Clear') 
    {
       output ='0';
       operend ='';
       num1=0.0;
       num2=0.0;
    }
    //else one of the operends-> num1 =output(Temp/old) w n operate 3leeh num2..
    else if(btnStr=='+' ||btnStr=='-' ||btnStr=='x' ||btnStr=='/' ) 
    {
      num1 = double.parse(output);
      operend = btnStr;
      output ='0';
    }
    else if(btnStr=='.')
    {
      if(!output.contains('.')) output+=btnStr;
    }
    else if(btnStr=='=')
    {
      num2 = double.parse(output);
      if (operend == '+')
        output=(num1+num2).toString();
      if (operend == '-')
        output=(num1-num2).toString();
      if (operend == 'x')
        output=(num1*num2).toString();
      if (operend == '/')
        output=(num1/num2).toString();

      operend ='';
      num1=0.0;
      num2=0.0;
    }
    else output+=btnStr;

    setState(() {
      try{
      result=double.parse(output).toStringAsFixed(2);
      }
      catch(E){
        result = '0';
      }
     }
    );
  }

  Widget btnBuild(String s)
  {final String st =s;
    return Expanded(
                  child: OutlineButton(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      st,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    textColor: Colors.black,
                    onPressed: () => calculation(st),
                  ),
                );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.symmetric(
                vertical: 24,
                horizontal: 12,
              ),
              child: Text(
                result,
                style: TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            Expanded(
              child: Divider(),
            ),

            Row(
              children: <Widget>[
                btnBuild('7'),
                btnBuild('8'),
                btnBuild('9'),
                btnBuild('/'),
              ],
            ),
            Row(
              children: <Widget>[
                btnBuild('4'),
                btnBuild('5'),
                btnBuild('6'),
                btnBuild('x'),
              ],
            ),
            Row(
              children: <Widget>[
                btnBuild('1'),
                btnBuild('2'),
                btnBuild('3'),
                btnBuild('+'),
              ],
            ),
            Row(
              children: <Widget>[
                btnBuild('.'),
                btnBuild('0'),
                btnBuild('00'),
                btnBuild('-'),
              ],
            ),
            Row(
              children: <Widget>[
                btnBuild('Clear'),
                btnBuild('='),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
