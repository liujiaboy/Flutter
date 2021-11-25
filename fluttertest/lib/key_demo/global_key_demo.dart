import 'package:flutter/material.dart';

class GlobalKeyDemo extends StatelessWidget {
  GlobalKeyDemo({Key? key}) : super(key: key);

  final GlobalKey<_GlobalStfPageState> stfKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Global Key Demo"),),
      body: GlobalStfPage(key: stfKey,),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _buttonAddAction,
      ),
    );
  }

  void _buttonAddAction() {
    stfKey.currentState?.setState(() {
      stfKey.currentState?.count += 1;
      stfKey.currentState?.data = "hello ${stfKey.currentState?.count}";
    });
  }
}


class GlobalStfPage extends StatefulWidget {
  const GlobalStfPage({Key? key}) : super(key: key);

  @override
  _GlobalStfPageState createState() => _GlobalStfPageState();
}

class _GlobalStfPageState extends State<GlobalStfPage> {
  int count = 0;
  String data = "hello";
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("$count"),
        Text(data),
      ],
    );
  }
}

