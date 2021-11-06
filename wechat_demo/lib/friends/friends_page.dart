import 'package:flutter/material.dart';
import 'package:wechat_demo/const.dart';
import 'package:wechat_demo/discover/discover_child_page.dart';
import 'package:wechat_demo/friends/index_bar.dart';

import 'friends_data.dart';

class FriendsPage extends StatefulWidget {
  const FriendsPage({Key? key}) : super(key: key);

  @override
  _FriendsPageState createState() => _FriendsPageState();
}

class _FriendsPageState extends State<FriendsPage> {

  final List<Friends> _headerData = [
    Friends(localImage:'images/新的朋友.png', name: '新的朋友'),
    Friends(localImage:'images/群聊.png', name: '群聊'),
    Friends(localImage:'images/标签.png', name: '标签'),
    Friends(localImage:'images/公众号.png', name: '公众号'),
  ];
  final List<Friends> _listData = [];
  final ScrollController _scrollController = ScrollController();

  // 字典 存放 A-高度，B-高度
  final double _cellHeight = 54;
  final double _groupHeight = 30;
  // 默认A的高度
  double _groupOffset = 0;

  final Map _groupOffsetMap = {
    INDEX_WORDS[0]: 0.0,
    INDEX_WORDS[1]: 0.0,
  };

  @override
  void initState() {
    super.initState();
    _listData..addAll(friendsDatas)..addAll(friendsDatas);
    _listData.sort((Friends a, Friends b) {
      return a.indexLetter!.compareTo(b.indexLetter!);
    });
    // 插入默认头数据
    _listData.insertAll(0, _headerData);

    _groupOffset = _cellHeight * _headerData.length;
    for(int i = _headerData.length; i < _listData.length; i ++){
      if (i == _headerData.length) {
        _groupOffsetMap.addAll({_listData[i].indexLetter : _groupOffset});
        _groupOffset += _cellHeight + _groupHeight;
      }
      else if (_listData[i].indexLetter == _listData[i-1].indexLetter) {
        _groupOffset += _cellHeight;
      }
      else {
        _groupOffsetMap.addAll({_listData[i].indexLetter : _groupOffset});
        _groupOffset += _cellHeight + _groupHeight;
      }
    }
  }

  Widget _itemForRow(BuildContext context, int index) {
    int headerCount = _headerData.length;
    bool isShow = (index - headerCount+1 > 0 && (_listData[index].indexLetter != _listData[index - 1].indexLetter));
    return _FriendsCell(friend: _listData[index], isShowGroupTitle: isShow);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("通讯录"),
        backgroundColor: WeChatThemeColor,
        actions: [
          GestureDetector(
            onTap: (){
              Navigator.of(context).push(
                MaterialPageRoute(builder: (BuildContext context) => DiscoverChildPage(title: "add friends",)),
              );
            },
            child: Container(
              margin: EdgeInsets.only(right: 12),
              // color: Colors.white,
              child: Image(
                image: AssetImage("images/icon_friends_add.png"),
                width: 25,
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            color: Colors.white,
            child: ListView.builder(
              controller: _scrollController,
              itemBuilder: _itemForRow,
              itemCount: _listData.length,
            ),
          ),
          IndexBar(indexBarCallBack: (String str){
            print("回调中的 $str, offset = ${_groupOffsetMap[str]}");
            if(_groupOffsetMap[str] != null) {
              _scrollController.animateTo(
                  _groupOffsetMap[str], duration: Duration(microseconds: 100),
                  curve: Curves.easeIn);
            }
          },),
        ],
      ),
    );
  }

}

// Cell
class _FriendsCell extends StatelessWidget {
  // const _FriendsCell({Key? key}) : super(key: key);
  _FriendsCell({required this.friend, required this.isShowGroupTitle});
  final Friends friend;
  final bool isShowGroupTitle;

  @override
  Widget build(BuildContext context) {
    // 使用这种方式获取图片
    var decorationImage;
    if (friend.imageUrl != null) {
      decorationImage = DecorationImage(
        image: NetworkImage(friend.imageUrl!),
      );
    }
    else if (friend.localImage != null) {
      decorationImage = DecorationImage(
          image: AssetImage(friend.localImage!),
      );
    }
    else {
      // decorationImage = DecorationImage();
    }

    return Container(
      child: Column(
        children: [
          // group title
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 12),
            color: WeChatThemeColor,
            height: isShowGroupTitle ? 30 : 0,
            child: isShowGroupTitle ? Text(friend.indexLetter!) : Text(""),
          ),
          Row(
            children: [
              // 图片
              Container(
                margin: EdgeInsets.all(10),
                width: 34,
                height: 34,
                // 设置圆角
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6),
                  image: decorationImage,
                ),
              ),
              Container(
                width: screenWidth(context) - 54,
                child: Column(
                  children: [
                    // text
                    Container(
                      alignment: AlignmentDirectional.centerStart,
                      height: 32,
                      // color: Colors.green,
                      child: Text(
                        friend.name,
                      ),
                    ),

                    // line
                    Container(
                      color: WeChatThemeColor,
                      height: 0.5,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
