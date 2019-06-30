import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart'
    show debugDefaultTargetPlatformOverride;
import 'package:flutter/material.dart';
import 'package:libraries_in_japan/detail.dart';
import 'package:libraries_in_japan/entity/library.dart';
import 'package:libraries_in_japan/service/library_service.dart';

/// If the current platform is desktop, override the default platform to
/// a supported platform (iOS for macOS, Android for Linux and Windows).
/// Otherwise, do nothing.
void _setTargetPlatformForDesktop() {
  TargetPlatform targetPlatform;
  if (Platform.isMacOS) {
    targetPlatform = TargetPlatform.iOS;
  } else if (Platform.isLinux || Platform.isWindows) {
    targetPlatform = TargetPlatform.android;
  }
  if (targetPlatform != null) {
    debugDefaultTargetPlatformOverride = targetPlatform;
  }
}

void main() {
  _setTargetPlatformForDesktop();
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Libraries In Japan',
      theme: new ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting
        // the app, try changing the primarySwatch below to Colors.green
        // and then invoke "hot reload" (press "r" in the console where
        // you ran "flutter run", or press Run > Hot Reload App in IntelliJ).
        // Notice that the counter didn't reset back to zero -- the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Libraries In Japan'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful,
  // meaning that it has a State object (defined below) that contains
  // fields that affect how it looks.

  // This class is the configuration for the state. It holds the
  // values (in this case the title) provided by the parent (in this
  // case the App widget) and used by the build method of the State.
  // Fields in a Widget subclass are always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Library> _libraries = [];

  Future<Null> _searchLibraries() async {
    LibraryService libraryService = new LibraryService();
    libraryService.getLibraries().then((List<Library> libraries) {
      setState(() {
        // This call to setState tells the Flutter framework that
        // something has changed in this State, which causes it to rerun
        // the build method below so that the display can reflect the
        // updated values. If we changed _counter without calling
        // setState(), then the build method would not be called again,
        // and so nothing would appear to happen.
        _libraries = libraries;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance
    // as done by the _incrementCounter method above.
    // The Flutter framework has been optimized to make rerunning
    // build methods fast, so that you can just rebuild anything that
    // needs updating rather than having to individually change
    // instances of widgets.
    return new Scaffold(
      appBar: new AppBar(
        // Here we take the value from the MyHomePage object that
        // was created by the App.build method, and use it to set
        // our appbar title.
        title: new Text(widget.title),
      ),
      body: new Scrollbar(
          child: new ListView(
              padding: new EdgeInsets.symmetric(vertical: 8.0),
              children: _libraries.map((library) {
                return new ListTile(
                  isThreeLine: false,
                  dense: false,
                  leading: new CircleAvatar(child: new Image.asset('images/${library.category}.png')),
                  title: new Text(library.formalName),
                  subtitle: new Text(library.address),
                  trailing: new Icon(Icons.info, color: Theme.of(context).disabledColor),
                  onTap: () {
                    Navigator.push(context, new MaterialPageRoute<Null>(
                      settings: const RouteSettings(name: "/detail"),
                      builder: (BuildContext context) => new Detail(library)
                    ));
                  },
                );
              }).toList()
          )
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _searchLibraries,
        tooltip: 'Search',
        child: new Icon(Icons.search),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
