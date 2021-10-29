import 'package:flutter/material.dart';

class LayoutDemo extends StatelessWidget {
  const LayoutDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stack Demo"),
      ),
      body: stackDemo(),
    );
  }

  // stack
  Widget stackDemo() {
    return Container(
      color: Colors.yellow,
      child: Column(
        children: [
          Container(
            color: Colors.red,
            height: 100,
          ),
          Container(
            color: Colors.white,
            width: 100,
            height: 100,
            child: Positioned(
              child: Icon(Icons.add),
              left: 30,
              bottom: 100,
            ),
          ),
        ],
      ),
    );
  }
}
