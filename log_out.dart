import 'package:flutter/material.dart';

class LogOut extends StatelessWidget
{
  final String title;

  LogOut(this.title);
  @override
  Widget build(BuildContext context)
  {
    return new Scaffold
    (
      appBar: new AppBar
      (
        title: new Text(title),
      ),
    );
  }
}