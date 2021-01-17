import 'package:flutter/material.dart';

class CompletedList extends StatefulWidget {
  @override
  _CompletedListState createState() => _CompletedListState();
}

class _CompletedListState extends State<CompletedList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Completed Tasks'),
        backgroundColor: Colors.blue[900],
      ),
    );
  }
}
