import 'dart:async';
import 'package:flutter/material.dart';

class cronoScreen extends StatefulWidget {
  const cronoScreen({Key? key}) : super(key: key);

  @override
  State<cronoScreen> createState() => _cronoScreenState();
}

class _cronoScreenState extends State<cronoScreen> {
  final cronoStream = StreamController<String>();

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
