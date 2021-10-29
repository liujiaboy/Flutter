import 'package:flutter/material.dart';
import 'package:wechat_demo/chart_page.dart';
import 'package:wechat_demo/discover_page.dart';
import 'package:wechat_demo/friends_page.dart';
import 'package:wechat_demo/mine_page.dart';

class RootPage extends StatefulWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int _counter = 0;
  int currentIndex = 0;
  var pageList = const [ChartPage(), FriendsPage(), DiscoverPage(), MinePage()];

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageList[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: "微信",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: "通讯录"),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: "发现"),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: "我"),
        ],
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.black,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });

          // ignore: avoid_print
          print("clicked index = $index");
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
