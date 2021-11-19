import 'package:flutter/material.dart';
import 'package:wechat_demo/chat/chat_model.dart';

import '../const.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key, required this.changedCallback}) : super(key: key);
  // const SearchBar({Key? key}) : super(key: key);
  final void Function(String text) changedCallback;

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {

  final TextEditingController _controller = TextEditingController();
  bool _showClear = false;

  void _onChanged(String text) {
    setState(() {
      _showClear = text.length >= 1;
    });
    widget.changedCallback(text);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 84,
      color: WeChatThemeColor,
      child: Column(
        children: [
          SizedBox(height: 40,),
          Container(
            height: 44,
            // color: Colors.red,
            child: Row(
              children: [
                Container(
                  width: screenWidth(context) - 40 - 12 - 12,
                  height: 34,
                  margin: EdgeInsets.only(left: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(width: 8,),
                      // 放大镜
                      Image.asset("images/放大镜b.png", width: 20, color: Colors.grey,),
                      Expanded(
                        flex: 1,
                        child: TextField(
                          controller: _controller,
                          onChanged: _onChanged,
                          autofocus: true, // 自动调起键盘
                          cursorColor: Colors.green,// 光标颜色
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.w300,
                          ),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 5, bottom: 10),// 设置内部边距
                            border: InputBorder.none, // 边框
                            hintText: "搜索", // 无内容时的文本
                          ),
                        ),
                      ),
                      // 取消按钮
                      if (_showClear) GestureDetector(
                          child: Icon(Icons.cancel, size: 20, color: Colors.grey,),
                          onTap: (){
                            setState(() {
                              // _controller.clear();
                            });
                            _controller.clear();
                            _onChanged("");
                          },
                        ),
                      SizedBox(width: 8,),
                    ],
                  ),
                ),
                SizedBox(width: 12,),
                GestureDetector(
                  child: Text("取消"),
                  onTap: (){
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ],
      ),

    );
  }
}
