import 'package:flutter/material.dart';
import 'package:wechat_demo/chat/chat_model.dart';
import 'package:wechat_demo/chat/search_page.dart';
import 'package:wechat_demo/const.dart';

class SearchCell extends StatelessWidget {
  const SearchCell(this._datas, {Key? key}) : super(key: key);
  final List<ChatModel> _datas;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => SearchPage(_datas)));
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 6, horizontal: 6),
        height: 44,
        color: WeChatThemeColor,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage("images/放大镜b.png"),
                  height: 22,
                ),
                SizedBox(width: 4,),
                Text(
                  "搜索",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
