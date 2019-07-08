import 'package:flutter/material.dart';
import 'music.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Play Music'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Music> maListeMusique = [
    new Music('Down the road', 'michelle Tor', 'assets/un.jpg'),
    new Music('Heart don\'t break', 'Ed sheeran', 'assets/deux.jpg'),
  ];

  Music actuallyMusic;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    actuallyMusic = maListeMusique[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[400],
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.green[900],
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Card(
              elevation: 5,
              child: Container(
                height: MediaQuery.of(context).size.height / 2.5,
                child: Image.asset(actuallyMusic.pathMusic),
              ),
            ),
            addText(actuallyMusic.title, 3),
            addText(actuallyMusic.artist, 2),
            Center(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                addIcon(Icons.fast_rewind, 44),
                addIcon(Icons.play_arrow,75),
                addIcon(Icons.fast_forward, 45),
              ],
            )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[addText('0:00', 1), addText('4:20', 1)],
            )
          ],
        ),
      ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Text addText(String data, double scale) {
    return Text(
      data,
      textScaleFactor: scale,
      style: TextStyle(
        color: Colors.white,
        fontSize: 12,
      ),
    );
  }

  IconButton addIcon(IconData iconItem, double size) {
    return IconButton(iconSize: size, icon:new Icon(iconItem), onPressed: () {});
  }
}
