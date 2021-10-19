import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    // print("drawer width = $_width");
    return Drawer(
      semanticLabel: "my drawer",
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 38.0, right: 12),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 20),
                    child: ClipOval(
                      child: Image.network(
                        "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
                        width: 80.0,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(right: 12.0, bottom: 12),
                        child: Text(
                          "this is test name ABCDE",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        "date：2021-10-18",
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Container(
                width: 300,
                color: Colors.blue,
                child: Text(
                  "1234666728292933030033-3339399383839393939",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 38.0, left: 12, right: 12),
            child: Row(
              children: [
                Container(
                  width: 100,
                  color: Colors.blue,
                  child: ClipOval(
                    child: Image.network(
                      "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
                      width: 80.0,
                    ),
                  ),
                ),
                Container(
                  color: Colors.yellow,
                  width: _width - 24 - 80 - 12,
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Text(
                      "this is test name ABCDE",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                // Positioned(
                //   left: 104,
                //   child: Column(
                //     mainAxisAlignment: MainAxisAlignment.start,
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: const [
                //       Padding(
                //         padding: EdgeInsets.only(right: 12.0, bottom: 12),
                //         child: Text(
                //           "this is test name ABCDE",
                //           maxLines: 1,
                //           overflow: TextOverflow.ellipsis,
                //           style: TextStyle(
                //               fontSize: 20.0, fontWeight: FontWeight.bold),
                //         ),
                //       ),
                //       Text(
                //         "date：2021-10-18",
                //       ),
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: const [
                ListTile(
                  leading: Icon(Icons.add),
                  title: Text("add account"),
                ),
                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text(
                    "manage accounts，this is too long value",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
