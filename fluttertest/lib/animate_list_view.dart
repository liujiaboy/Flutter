import 'package:flutter/material.dart';

class MyAnimateList extends StatefulWidget {
  const MyAnimateList({Key? key}) : super(key: key);

  @override
  _MyAnimateListState createState() => _MyAnimateListState();
}

class _MyAnimateListState extends State<MyAnimateList> {
  final _data = <String>[];
  late int _counter = 5;
  final _globalKey = GlobalKey<AnimatedListState>();

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < _counter; i++) {
      _data.add("${i + 1}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animate List View"),
      ),
      body: Stack(
        // 使用stack 可以使view重叠
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          AnimatedList(
            key: _globalKey,
            initialItemCount: _data.length,
            padding: const EdgeInsets.only(bottom: 34),
            itemBuilder:
                (BuildContext context, int index, Animation<double> animation) {
              return FadeTransition(
                opacity: animation,
                child: buildItem(context, index),
              );
            },
          ),
          buildAddBtn(),
        ],
      ),
    );
  }

  // 右下角加号
  Widget buildAddBtn() {
    return Positioned(
      child: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          // 添加一个item
          addNewItem();
        },
      ),
      bottom: 100,
      // left: 100,
      right: 20,
    );
  }

  void addNewItem() {
    _data.add("${++_counter}");
    _globalKey.currentState!.insertItem(_data.length - 1);
    print("添加了一个 index=$_counter");
  }

  void deleteItem(context, index) {
    _counter -= 1;
    var item = buildItem(context, index);
    _data.removeAt(index);
    print("添加了一个 index=${index + 1}");
    _globalKey.currentState!.removeItem(index, (context, animation) {
      return FadeTransition(
        opacity: CurvedAnimation(
          parent: animation,
          curve: const Interval(0.5, 1),
        ),
        child: SizeTransition(
          sizeFactor: animation,
          axisAlignment: 0.0,
          child: item,
        ),
      );
    }, duration: const Duration(milliseconds: 200));
  }

  // 创建item
  Widget buildItem(context, index) {
    String value = _data[index];
    // if (index % 3 == 0)
    {
      return buildBigItem(context, index);
    }
    // return ListTile(
    //   key: ValueKey(value),
    //   title: Text(value),
    //   trailing: IconButton(
    //     icon: const Icon(Icons.delete),
    //     onPressed: () {
    //       // delete
    //       deleteItem(context, index);
    //     },
    //   ),
    // );
  }

  Widget buildBigItem(context, index) {
    bool isShowSummay = index % 4 == 0;
    double _height = isShowSummay ? 100 : 72;
    int maxLine = isShowSummay ? 2 : 1;
    return Container(
        height: _height,
        padding: const EdgeInsets.fromLTRB(12, 0, 0, 0),
        color: Colors.white,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  // width: 60,
                  // color: Colors.green,
                  child: ClipOval(
                    child: Image.network(
                      "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
                      width: 60.0,
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width - 12 - 48 - 60,
                  padding: const EdgeInsets.only(top: 10, left: 12),
                  // color: Colors.red,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "这个是标题 ${index + 1}，我需要展示很多很多内容,是否超长了，那就截断", //
                        maxLines: maxLine,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Text(
                          isShowSummay
                              ? "这个是summary ${index + 1}，我需要展示很多很多内容,是否超长了，那就截断"
                              : "",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                    width: 48,
                    // color: Colors.orange,
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            // delete
                            deleteItem(context, index);
                          },
                        ),
                      ],
                    )),
              ],
            ),
            Container(
              color: Colors.grey,
              height: 0.5,
            )
          ],
        ));
  }

  Widget buildSmallItem(context, index) {
    int currentIndex = index + 1;
    String value = _data[index];
    return ListTile(
      key: ValueKey(value),
      leading: Padding(
        padding: const EdgeInsets.all(10),
        child: ClipOval(
          child: Image.network(
            "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
            width: 60.0,
          ),
        ),
      ),
      title: Padding(
        padding: const EdgeInsets.only(top: 12, bottom: 4),
        child: Text(
          "这个是标题 ${currentIndex}，我需要展示很多很多内容,是否超长了，那就截断", //
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: () {
          // delete
          deleteItem(context, index);
        },
      ),
    );
  }
}
