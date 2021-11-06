import 'package:flutter/material.dart';
import 'package:wechat_demo/discover/discover_child_page.dart';

class DiscoverCell extends StatefulWidget {
  // const DiscoverCell({Key? key}) : super(key: key);
  final String title;
  String? countStr;
  final String? subTitle;
  final String imageName;
  final String? subImageName;
  //
  DiscoverCell({
    required this.title,
    this.countStr,
    this.subTitle,
    required this.imageName,
    this.subImageName,
  });
  @override
  _DiscoverCellState createState() => _DiscoverCellState();
}

class _DiscoverCellState extends State<DiscoverCell> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        print("on tap ...");
        Navigator.of(context).push(
          MaterialPageRoute(builder: (BuildContext context) => DiscoverChildPage(title: widget.title))
        );
        setState(() {
          if (widget.countStr != null)
            widget.countStr = "";
        });
      },
      onTapDown: (TapDownDetails details){
        print("on tap down...");
      },
      onTapCancel: (){
        print("on tap cancel...");
        setState(() {

        });
      },
      child: Container(
        padding: EdgeInsets.all(12),
        height: 60,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // left
            Container(
              // color: Colors.green,
              child: Row(
                children: [
                  Image.asset(
                    widget.imageName,
                    width: 20,
                    height: 20,
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Text(
                    widget.title,
                    style: TextStyle (
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),

                  if (widget.countStr != null)
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: widget.countStr != null ? Colors.red : Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      child: Text(
                        widget.countStr!,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    )
                  else
                    Container(
                      color: Colors.white,
                    ),
                ],
              ),
            ),

            // left
            Container(
              color: Colors.white,
              child: Row(
                children: [
                  widget.subTitle != null ? Text(widget.subTitle!) : Text(""),
                  SizedBox(width: 6,),
                  if (widget.subImageName != null)
                    Image(image: AssetImage(widget.subImageName!), width: 15,)
                  else
                    Container(),
                  Image.asset(
                    "images/icon_right.png",
                    height: 15,
                    width: 15,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
