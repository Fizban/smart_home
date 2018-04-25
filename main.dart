import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:smart_home/log_out.dart';
import 'package:flutter_circular_chart/flutter_circular_chart.dart';
import 'package:smart_home/accumulated_data.dart';

void main() => runApp(new myApp());

class myApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return new MaterialApp
    (
      theme: new ThemeData
      (
        primarySwatch: Colors.lightBlue,

      ),
      home: new HomePage(),
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>
      {
        "/a": (BuildContext context) => new LogOut("Log Out"),
        "/d": (BuildContext context) => new AccumulatedData(),
      },
    );
  }
}




class HomePage extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return new Scaffold
      (
      appBar: new AppBar
        (
        title: new Text("Smart Home"),
        elevation: defaultTargetPlatform == TargetPlatform.android ? 5.0 : 0.0,
      ),
      drawer: new Drawer
        (
        child: new ListView
          (
          children: <Widget>
          [
            new UserAccountsDrawerHeader
              (
              accountName: new Text("Smart Home User"),
              accountEmail: new Text("c3232675@uon.edu.au"),
              currentAccountPicture: new CircleAvatar
                (
                backgroundColor: Colors.green,
                child: new Text("S"),
              ),
            ),
            new ListTile
              (
              title: new Text("Home Details"),
              trailing: new Icon(Icons.edit),
            ),
            new ListTile
              (
              title: new Text("Accumulated Data"),
              trailing: new Icon(Icons.equalizer),
              onTap: ()
                  => Navigator.of(context).pushNamed("/d"),
            ),
            new Divider(),
            new ListTile
              (
              title: new Text("Logout"),
              trailing: new Icon(Icons.exit_to_app),
              onTap: ()
              => Navigator.of(context).pushNamed("/a"),
            ),
          ],
        ),
      ),
      body: new Container
        (
        child: new Center
          (
            child: new Text('Smart Home'),
          ),
        )
    );
  }
}
