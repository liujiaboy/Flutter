import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wechat_demo/chat/chat_model.dart';
import 'package:wechat_demo/chat/search_bar.dart';
import 'package:wechat_demo/const.dart';

class SearchPage extends StatefulWidget {
  const SearchPage(this._datas, {Key? key}) : super(key: key);
  final List<ChatModel> _datas;
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  String _searchText = "";
  List<ChatModel> _searchResultList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            // 导航搜索
            SearchBar(changedCallback:(String text){
              // print("search text = $text");
              searchChanged(text);
            }),
            // 搜索结果List
            Expanded(
              child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: ListView.builder(
                    itemCount: _searchResultList.length,
                    itemBuilder: _itemBuilderForRow,
                  ),
              ),
            ),
          ],
        ),


      ),
    );
  }

  searchChanged(String text) {
    _searchText = text;
    List<ChatModel> tempList = [];
    if (text.length > 0) {
      for (int i = 0; i < widget._datas.length; i ++) {
        ChatModel item = widget._datas[i];
        if (item.name != null && item.name!.contains(text)) {
          tempList.add(item);
        }
      }
    }

    setState(() {
      _searchResultList = tempList;
    });
  }

  TextStyle _normalStyle = TextStyle(
    fontSize: 16,
    color: Colors.black,
  );
  TextStyle _highlightStyle = TextStyle(
    fontSize: 16,
    color: Colors.red,
  );

  Widget _createTitle(String name) {
    List<TextSpan> spans = [];
    // print("for out $_searchText");
    List<String> strList = name.split(_searchText);
    print("list = $strList, length = ${strList.length})");

    if (strList.length > 1 && _searchText.isNotEmpty) {
      for(int i = 0; i < strList.length; i++) {
        String str = strList[i];
        spans.add(TextSpan(text: str, style: _normalStyle));
        if (i < strList.length - 1) {
          spans.add(TextSpan(text: _searchText, style: _highlightStyle));
        }
      }
    }
    else {
      spans.add(TextSpan(text: name, style: _normalStyle));
    }
    return RichText(text: TextSpan(children: spans));
  }

  Widget _itemBuilderForRow(BuildContext context, int index) {
    ChatModel item = _searchResultList[index];
    return ListTile(
      leading: item.imageUrl != null
          ? Container(
        width: 44,
        height: 44,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            image: DecorationImage(image: NetworkImage(item.imageUrl!))
        ),
      )
          : Container(width: 44, height: 44, color: WeChatThemeColor,),
      title: item.name != null ? _createTitle(item.name!) : Text(""),
      subtitle:
      item.messageDetail != null
          ? Text(item.messageDetail!, maxLines: 1, overflow: TextOverflow.ellipsis,)
          : Text(""),
    );
  }
}
