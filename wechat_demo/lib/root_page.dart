import 'package:flutter/material.dart';
import 'package:wechat_demo/chat/chat_page.dart';
import 'package:wechat_demo/discover/discover_page.dart';
import 'package:wechat_demo/friends/friends_page.dart';
import 'package:wechat_demo/mine/mine_page.dart';

class RootPage extends StatefulWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int _currentIndex = 0;
  List<Widget> _pages = [ChatPage(), FriendsPage(), DiscoverPage(), MinePage()];
  PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _controller,
        children: _pages,
        onPageChanged: (int index) {
          _currentIndex = index;
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index){
          setState(() {
            _currentIndex = index;
            _controller.jumpToPage(_currentIndex);
          });
        },
        selectedFontSize: 12.0,
        currentIndex: _currentIndex,
        fixedColor: Colors.green,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset("images/tabbar_chat.png", height: 20, width: 20,),
            activeIcon: Image.asset(
              "images/tabbar_chat_hl.png",
              height: 20,
              width: 20,
            ),
            label: "微信",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: "通讯录",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: "发现",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: "我的",
          ),
        ],
      ),
    );
  }
}
