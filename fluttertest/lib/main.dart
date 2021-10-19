import 'package:flutter/material.dart';
import 'my_drawer.dart';
import 'list_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

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

  Widget redBox = const DecoratedBox(
    decoration: BoxDecoration(color: Colors.red),
  );

  final Widget _avatarIcon = Image.network(
    "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
    width: 80.0,
    height: 80.0,
  );

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
        leading: Builder(builder: (context) {
          return IconButton(
              icon: const Icon(Icons.dashboard),
              onPressed: () {
                // 打开抽屉
                Scaffold.of(context).openDrawer();
              });
        }),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.

        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.start,

          children: <Widget>[
            const Text(
              'You have pushed the button this many times: this is too looooooooooong',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            ConstrainedBox(
              // 约束 控制子视图
              constraints: const BoxConstraints(
                minHeight: 50.0,
                minWidth: double.infinity,
              ),
              child: SizedBox(
                height: 5,
                child: redBox,
              ),
            ),
            ConstrainedBox(
              // 约束 控制子视图
              constraints: const BoxConstraints.tightFor(
                width: 100,
                height: 100,
              ),
              child: Container(
                // margin: const EdgeInsets.all(10.0),
                padding: const EdgeInsets.all(10.0),
                height: 5,
                child: redBox,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              // verticalDirection: VerticalDirection.down,
              children: const <Widget>[
                Text(
                  "Hello Word!",
                  style: TextStyle(fontSize: 30.0),
                ),
                SizedBox(
                  width: 200,
                  child: Text(
                    // 文字超长了，会出现问题 //
                    "I am Alan, from China, this is a test and I have many things to say.",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            Wrap(
              // 流式布局，row这种只会是一行，text超长之后不会换行
              spacing: 30, // 主轴（row）方向间距
              runSpacing: 10, // 纵轴（垂直）方向
              alignment: WrapAlignment.start,
              crossAxisAlignment: WrapCrossAlignment.end,
              children: const <Widget>[
                Text(
                  "Hello Word!",
                  style: TextStyle(fontSize: 30.0),
                ),
                Text(
                  "Hello Flutter!",
                  style: TextStyle(fontSize: 20.0),
                ),
                Text(
                    // 文字超长了，会出现问题 //
                    "I am Alan, from China, this is a test and I have many things to say.",
                    maxLines: 2),
              ],
            ),
            Padding(
              // Flex 布局
              padding: const EdgeInsets.all(20.0),
              child: Flex(
                // Row、Column都继承自Flex，单独使用Flex需要指定direction
                direction: Axis.horizontal,
                children: [
                  Expanded(
                      flex: 1,
                      child: Container(
                        height: 30,
                        color: Colors.black,
                      )),
                  const Spacer(
                    flex: 1,
                  ),
                  Expanded(
                      flex: 1,
                      child: Container(
                        height: 30,
                        color: Colors.red,
                      )),
                  const Spacer(
                    // 间隙
                    flex: 1,
                  ),
                  Expanded(
                      flex: 2,
                      child: Container(
                        height: 30,
                        color: Colors.green,
                      )),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                _avatarIcon,
                ClipOval(child: _avatarIcon), // 圆形
                ClipRRect(
                  // 圆角
                  borderRadius: BorderRadius.circular(12.0),
                  child: _avatarIcon,
                ),
                ClipRect(
                  child: Align(
                    // 设置裁剪 宽高 裁剪方向
                    child: _avatarIcon,
                    widthFactor: .5, // 宽高为原来的一半
                    heightFactor: .5,
                    alignment: Alignment.topRight,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                OutlinedButton(
                    child: const Text("list view1"),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => const MyListView()),
                      );
                    }),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => const MyListView()),
                      );
                    },
                    child: const Text("text button"))
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: _bottomBar2,
      drawer:
          const MyDrawer(), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  final BottomNavigationBar _bottomBar1 = BottomNavigationBar(
    // 底部 tab bar
    items: const <BottomNavigationBarItem>[
      BottomNavigationBarItem(icon: Icon(Icons.home), label: "home"),
      BottomNavigationBarItem(icon: Icon(Icons.business), label: "bussiness"),
      BottomNavigationBarItem(icon: Icon(Icons.school), label: "school"),
    ],
    selectedItemColor: Colors.red,
    unselectedItemColor: Colors.blue,
    onTap: (index) {
      // ignore: avoid_print
      print("clicked index = $index");
    },
  );

  final BottomAppBar _bottomBar2 = BottomAppBar(
    color: Colors.white,
    shape: const CircularNotchedRectangle(), // 圆形
    child: Row(
      children: const [
        IconButton(
          icon: Icon(Icons.home),
          onPressed: null,
        ),
        SizedBox(),
        IconButton(
          icon: Icon(Icons.business),
          onPressed: null,
        ),
      ],
      mainAxisAlignment: MainAxisAlignment.spaceAround,
    ),
  );
}
