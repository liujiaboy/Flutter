import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:wechat_demo/chat/search_cell.dart';
import 'package:wechat_demo/const.dart';
import 'package:wechat_demo/tools/http_manager.dart';
import 'package:wechat_demo/tools/network_error.dart';
// import 'package:http/http.dart' as http;

import 'chat_model.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage>
    with AutomaticKeepAliveClientMixin<ChatPage> {

  List<ChatModel> _dataList = [];

  @override
  bool get wantKeepAlive => true;

  // var _timer;
  @override
  void dispose() {
    super.dispose();

  }

  @override
  void initState() {
    super.initState();

    // _timer = Timer(Duration(seconds: 1), (){
    // });
    
    // getHttpData();

    getHttpRequest();
    // 之前的Future请求
    // getDatas().then((value) {
    //   // print(value);
    // });
  }

  // 网络请求
  void getHttpRequest() async {
    HttpManager.shared.get("http://rap2api.taobao.org/app/mock/293294/api/chat/chat_list").then((value) {
      value.fold(
            (left) {
                print(left.message ?? NetworkError.CommonErrorMessage);
              },
              (right) {
                if (right != null) {
                  List responseList = right["data"]["list"];
                  // 获取model
                  List<ChatModel> modelList = responseList.map((e) {
                    return ChatModel.fromJson(e);
                  }).toList();

                  setState(() {
                    _dataList = modelList;
                  });
                }
            },
      );
    }).whenComplete(() {
      print("request complete...");
    }).catchError((e){
      print("catch error...");
      print(NetworkError.CommonErrorMessage);
    });
  }

  void getHttpData() async {
    try {
      var response = await Dio().get("http://rap2api.taobao.org/app/mock/293294/api/chat/chat_list");

      if (response.data is Map) {
        List responseList = response.data["data"]["list"];
        print(responseList);
        // 获取model
        List<ChatModel> modelList = responseList.map((e) {
          return ChatModel.fromJson(e);
        }).toList();

        setState(() {
          _dataList = modelList;
        });
        // print(_dataList);
      }
      // print(response.data is Map);
      // print(response);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Widget _buildItem(BuildContext context, int index) {
    if (index == 0) {
      return SearchCell(_dataList);
    }
    ChatModel item = _dataList[index-1];
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
      title: item.name != null ? Text(item.name!) : Text(""),
      subtitle:
      item.messageDetail != null
          ? Text(item.messageDetail!, maxLines: 1, overflow: TextOverflow.ellipsis,)
          : Text(""),
    );
  }

  Widget _buildSeparator(BuildContext context, int index) {
    return Divider(height: 1.0, color: WeChatThemeColor, indent: 80.0,);
  }

  Widget _buildBody(BuildContext context) {
    if (_dataList.length == 0) {
      return Center(child: Text("Loading..."),);
    }
    else {
      return ListView.separated(
        itemCount: _dataList.length + 1,
        itemBuilder: (BuildContext context, int index) {
          return _buildItem(context, index);
        },
        separatorBuilder: _buildSeparator,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: WeChatThemeColor,
        title: Text("微信"),
        centerTitle: true,
        actions: [
          Container(
            margin: EdgeInsets.only(right: 12),
            child: PopupMenuButton(
              color: Color.fromRGBO(0, 0, 0, 0.7),
              child: Image(
                image: AssetImage("images/圆加.png"),
                width: 25,
              ),
              offset: Offset(0, 60),
              padding: EdgeInsets.symmetric(horizontal: 20),
              itemBuilder: (BuildContext context) {
                return <PopupMenuItem<String>>[
                  PopupMenuItem(
                      child: _buildPopupMenuItem("images/发起群聊.png", "发起群聊")),
                  PopupMenuItem(
                      child: _buildPopupMenuItem("images/添加朋友.png", "添加朋友")),
                  PopupMenuItem(
                      child: _buildPopupMenuItem("images/扫一扫1.png", "扫一扫")),
                  PopupMenuItem(
                      child: _buildPopupMenuItem("images/收付款.png", "收付款")),
                ];
              },
            ),
          ),
        ],
      ),
      body: Container(
        child: _buildBody(context),
      ),
    );
  }

  // 创建头部popup menu item
  Widget _buildPopupMenuItem(String imgAsset, String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image(
          image: AssetImage(imgAsset),
          width: 20,
        ),
        SizedBox(
          width: 12,
        ),
        Text(
          title,
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ],
    );
  }


  // --------- 以下内容为 使用Future ---------
  // 根据future数据创建 widget
  // Widget _buildFutureWidget(BuildContext context) {
  //   return FutureBuilder(
  //     future: getDatas(),
  //     builder: (BuildContext context, AsyncSnapshot snapshot) {
  //       List<ChatModel>? chatArray = snapshot.data;
  //       if (snapshot.connectionState == ConnectionState.waiting) {
  //         return Center(
  //           child: Text("加载中"),
  //         );
  //       }
  //       if (chatArray == null) {
  //         Container();
  //       }
  //       return ListView(
  //         children: chatArray!.map((item) {
  //           return ListTile(
  //             leading: item.iconUrl != null
  //                 ? Container(
  //               width: 44,
  //               height: 44,
  //               decoration: BoxDecoration(
  //                   borderRadius: BorderRadius.circular(22),
  //                   image: DecorationImage(image: NetworkImage(item.iconUrl!))
  //               ),
  //             )
  //                 : Container(),
  //             title: item.name != null ? Text(item.name!) : Text(""),
  //             subtitle:
  //             item.messageDetail != null
  //                 ? Text(item.messageDetail!, maxLines: 1, overflow: TextOverflow.ellipsis,)
  //                 : Text(""),
  //           );
  //         }).toList(),
  //       );
  //       // print("data = ${snapshot.data}");
  //     },
  //   );
  // }

// 异步操作 添加async
// Future<List<ChatModel>> getDatas() async {
// final url = Uri.parse(
//     "http://rap2api.taobao.org/app/mock/293294/api/chat/chat_list");
// // 耗时操作
// final response = await http.get(url);
// // print(response.body);
//
// // print(await http.read(url));
// if (response.statusCode == 200) {
//   // json 转 map
//   final responseBody = jsonDecode(response.body);
//   List responseArray = responseBody["array"];
//   List<ChatModel> chatList =
//       responseArray.map((item) => ChatModel.fromMap(item)).toList();
//   return chatList;
// } else {
//   throw Exception("error code = ${response.statusCode}");
// }
// }

  // --------- 以上内容为 使用Future ---------
}