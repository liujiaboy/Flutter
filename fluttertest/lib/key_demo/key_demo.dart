import 'dart:math';

import 'package:flutter/material.dart';

class KeyDemo extends StatefulWidget {
  const KeyDemo({Key? key}) : super(key: key);

  @override
  _KeyDemoState createState() => _KeyDemoState();
}

class _KeyDemoState extends State<KeyDemo> {
  
  List<Widget> items = [_stfulItem(title: "1111",),_stfulItem(title: "2222",), _stfulItem(title: "3333",)];
  
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(

        title: const Text("key demo"),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: items,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
          onPressed: (){
            items.removeAt(0);
            setState(() {

            });
          }),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class _stfulItem extends StatefulWidget {
  final String title;
  const _stfulItem({required this.title, Key? key}) : super(key: key);

  @override
  _stfulItemState createState() => _stfulItemState();
}

class _stfulItemState extends State<_stfulItem> {
  final color = Color.fromRGBO(Random().nextInt(256), Random().nextInt(256), Random().nextInt(256), 1);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      color: color,
      child: Text(widget.title),
    );
  }
}

