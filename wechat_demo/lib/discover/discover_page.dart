import 'package:flutter/material.dart';

import 'discover_cell.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({Key? key}) : super(key: key);

  @override
  _DiscoverPageState createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("发现"),
      ),
      body: Center(
        child: ListView(
          children: [
            DiscoverCell(
              imageName: 'images/朋友圈.png',
              title: '朋友圈',
              countStr: "2",
            ),
            SizedBox(
              height: 10,
            ),
            DiscoverCell(
              imageName: 'images/扫一扫2.png',
              title: '扫一扫',
            ),
          ],
        ),
      ),
    );
  }
}
