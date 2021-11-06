import 'package:flutter/material.dart';
import 'package:wechat_demo/const.dart';
import 'package:http/http.dart' as http;

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);


  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {

  @override
  void initState() {
    super.initState();

    getDatas();
  }

  // 异步操作 添加async
  getDatas() async {
    final url = Uri.parse("http://rap2api.taobao.org/app/mock/293294/api/chat/chat_list");
    // 耗时操作
    final response = await http.get(url);
    print(response.body);

    print(await http.read(url));
  }


  Widget _buildPopupMenuItem(String imgAsset, String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image(image: AssetImage(imgAsset), width: 20,),
        SizedBox(width: 12,),
        Text(title, style: TextStyle(color: Colors.white, fontSize: 16),),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: WeChatThemeColor,
        title: Text("微信"),
        centerTitle: true,
        actions: [
          Container(
            margin: EdgeInsets.only(right: 12),
            child: PopupMenuButton(
              color: Color.fromRGBO(0, 0, 0, 0.7),
              child: Image(image: AssetImage("images/圆加.png"), width: 25,),
              offset: Offset(0, 60),
              padding: EdgeInsets.symmetric(horizontal: 20),
              itemBuilder: (BuildContext context) {
                return <PopupMenuItem<String>>[

                  PopupMenuItem(child: _buildPopupMenuItem("images/发起群聊.png", "发起群聊")),
                  PopupMenuItem(child: _buildPopupMenuItem("images/添加朋友.png", "添加朋友")),
                  PopupMenuItem(child: _buildPopupMenuItem("images/扫一扫1.png", "扫一扫")),
                  PopupMenuItem(child: _buildPopupMenuItem("images/收付款.png", "收付款")),
                ];
              },
            ),
          ),
        ],
      ),
      body: Center(
        child: Text("微信页面"),
      ),
    );
  }


}
