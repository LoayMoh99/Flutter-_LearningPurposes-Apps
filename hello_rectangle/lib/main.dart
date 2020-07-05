import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:hello_rectangle/src/sec_screen.dart'; 

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Welcome to Flutter',
      theme: ThemeData.dark(),
      home: HomeScreen(),
  );
}


}
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<WordPair> _suggestions = <WordPair>[];
  final TextStyle _biggerFont = const TextStyle(fontSize: 20); 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
        appBar: AppBar(
          title: Text('Startup Name Builder App'),
          backgroundColor: Colors.blueGrey,
        ),
        body: _buildSuggestions() ,
        );
  }

  Widget _buildSuggestions() {
    return ListView.builder( //return a list(infinite) of specified row object
      padding: const EdgeInsets.all(12), // shaklyaat 
      itemBuilder: (BuildContext _context, int i) 
      { //responsible for building the specified item
        if (i.isOdd)  return Divider();
        final int index = i ~/ 2;
        // If you've reached the end of the available word pairings ..
        if (index >= _suggestions.length) {
          // .. then generate 10 more and add them to the suggestions list.
          _suggestions.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_suggestions[index]);
      }
    );
  }

  Widget _buildRow(WordPair pair) {
    return ListTile(
      leading: CircleAvatar(
        child: FlutterLogo(
          colors: Colors.red,
        ),
      ),
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: Icon(
        Icons.favorite ,
        color: Colors.red,
      ),
      onTap: ()
      {
        Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => SecondScreen(pair),
        ),
        );
      },
    );
  }
}


/*import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hello Rectangle',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Hello Rectangle'),
        ),
        body: HelloRectangle(),
      ),
    ),
  );
}

class HelloRectangle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Container(
          color: Colors.green,
          height: 400.0,
          width: 300.0,
          child: Center(
            child: Text(
              'Hello!',
              style: TextStyle(fontSize: 40.0),
              textAlign: TextAlign.center,
            ),
          ),

      ),
    );
  }
}*/

