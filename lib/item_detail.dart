import 'package:diynner_alt/app_controller.dart';
import 'package:flutter/material.dart';
import 'myhomepage.dart';
import 'main.dart';
import 'myapp.dart';

class itemDetail extends StatefulWidget {
  const itemDetail({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  _itemDetailState createState() => _itemDetailState();
}

class _itemDetailState extends State<itemDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions: [CustomSwitch()],
        ),
        body: Column(
          children: [Text(widget.title)],
        ));
  }
}
