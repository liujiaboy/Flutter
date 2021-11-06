import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:wechat_demo/const.dart';

class IndexBar extends StatefulWidget {
  const IndexBar({Key? key, required this.indexBarCallBack}) : super(key: key);

  final void Function(String str) indexBarCallBack;


  @override
  _IndexBarState createState() => _IndexBarState();
}

class _IndexBarState extends State<IndexBar> {
  Color _bgColor = Color.fromRGBO(1, 1, 1, 0);
  Color _textColor = Colors.black;

  double _indicatorY = 0.0;
  String _indicatorText = "A";
  bool _isShow = false;

  int getSelectIndex(BuildContext context, double localPositionY) {
    // 获取每个字符的高度
    double itemHeight = screenHeight(context) / 2 / INDEX_WORDS.length;
    // 获取index, ~/ 为取整。 clamp设置整体范围
    int index = (localPositionY ~/ itemHeight).clamp(0, INDEX_WORDS.length - 1);
    print("选中的index=￥{index}, 字符为${INDEX_WORDS[index]}");
    return index;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _wordWidgets = [];
    for (int i = 0; i < INDEX_WORDS.length; i ++) {
      _wordWidgets.add(
        Expanded(child: Text(
            INDEX_WORDS[i],
            style: TextStyle(
                fontSize: 10,
                color: _textColor
            ),
          ),
        ),
      );
    }

    return Positioned(
      top: screenHeight(context) / 8,
      right: 0,
      width: 100,
      height: screenHeight(context) / 2,
      child: Row(
        children: [
          Container(
            alignment: Alignment(0, _indicatorY),
            // color: Colors.red,
            width: 80,
            child: _isShow ? Stack(
              alignment: Alignment(-0.2, 0),
              children: [
                Image(image: AssetImage("images/气泡.png"), width: 60,),
                Text(_indicatorText, style: TextStyle(fontSize: 25, color: Colors.white),),
              ],
            ) : Container(),
          ),
          GestureDetector(
            onVerticalDragDown: (DragDownDetails details){
              double y = details.localPosition.dy;
              int index = getSelectIndex(context, y);
              String itemStr = INDEX_WORDS[index];
              widget.indexBarCallBack(itemStr);

              setState(() {
                _bgColor = Color.fromRGBO(0, 0, 0, 0.5);
                _textColor = Colors.white;

                _indicatorY = 2.2 / INDEX_WORDS.length * index - 1.1;
                _indicatorText = itemStr;
                _isShow = true;
              });
              print("drag down");
            },
            onVerticalDragUpdate: (DragUpdateDetails details){
              // print("drag update");
              // RenderBox? box = context.findRenderObject() as RenderBox;
              // print("original global offset = ${details.globalPosition}");
              // print("original local offset = ${details.localPosition}");
              // print("original offset = ${box.globalToLocal(details.globalPosition)}");
              // 可以通过box转换globalPosition获取坐标，也可以直接通过 localPosition
              double y = details.localPosition.dy;
              int index = getSelectIndex(context, y);
              String itemStr = INDEX_WORDS[index];
              widget.indexBarCallBack(itemStr);

              setState(() {
                _indicatorY = 2.2 / INDEX_WORDS.length * index - 1.1;
                _indicatorText = itemStr;
                _isShow = true;
              });
            },
            onVerticalDragEnd: (DragEndDetails details){
              // widget.indexBarCallBack(itemStr);
              setState(() {
                _bgColor = Color.fromRGBO(1, 1, 1, 0.0);
                _textColor = Colors.black;

                _isShow = false;
              });
              print("drag end");
            },
            child: Container(
              width: 20,
              color: _bgColor,
              child: Column(
                children: _wordWidgets,
              ),
            ),
          ),
        ],

      )
    );
  }
}

const INDEX_WORDS = [
  '🔍',
  '☆',
  'A',
  'B',
  'C',
  'D',
  'E',
  'F',
  'G',
  'H',
  'I',
  'J',
  'K',
  'L',
  'M',
  'N',
  'O',
  'P',
  'Q',
  'R',
  'S',
  'T',
  'U',
  'V',
  'W',
  'X',
  'Y',
  'Z'
];
