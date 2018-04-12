import 'package:flutter/material.dart';
import 'package:libraries_in_japan/entity/library.dart';

class Detail extends StatelessWidget {
  final Library _library;

  Detail(this._library);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Detail'),
        ),
        body: new ListView(children: [
          new Row(children: <Widget>[
            new Container(
                margin: const EdgeInsets.only(left: 16.0),
                child: new Image.asset('images/${_library.category}.png')),
            new Container(
                margin: const EdgeInsets.all(16.0),
                child: new Text(_library.formalName,
                    style: new TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w400,
                    )))
          ]),
          new Container(
              margin: const EdgeInsets.all(16.0),
              child: new Text('${_library.post} ${_library.address}')),
          new Container(
              margin: const EdgeInsets.all(16.0),
              child: new Text(_library.tel)),
          new Container(
              margin: const EdgeInsets.all(16.0),
              child: new Text(_library.urlPC)),
        ]));
  }
}
