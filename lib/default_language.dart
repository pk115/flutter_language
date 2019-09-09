import 'package:flutter/material.dart';

class DefaultPage extends StatefulWidget {
  @override
  _DefaultPageState createState() => _DefaultPageState();
}

class _DefaultPageState extends State<DefaultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Default Flutter"),
      ),
      body: Column(
        children: <Widget>[
          RaisedButton(
            onPressed: () => {},
            color: Colors.deepPurpleAccent,
            child: Text(MaterialLocalizations.of(context).okButtonLabel,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}
