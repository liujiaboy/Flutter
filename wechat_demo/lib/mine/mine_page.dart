import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:wechat_demo/const.dart';
import 'package:wechat_demo/discover/discover_cell.dart';

class MinePage extends StatefulWidget {
  const MinePage({Key? key}) : super(key: key);

  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {

  Color _bgColor = Color.fromRGBO(220, 220, 220, 0.6);
  File? _avatarFile;
  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      removeTop: true,
        context: context,
        child: Container(
          color: _bgColor,
          child: Stack(
            children: [
              // listview
              ListView.builder(
                itemBuilder: itemBuild,
                itemCount: 5,
              ),
              // camera
              Positioned(
                right: 20,
                top: 50,
                child: Image(
                  image: AssetImage("images/camera.png"),
                  width: 30,
                  height: 30,
                )
              ),
            ],
          ),
        ),
    );
  }

  Widget itemHeaderBuild() {
    return Container(
      height: 200,
      padding: EdgeInsets.only(top: 80, bottom: 10),
      color: Colors.white,
      child: Column(
        children: [
          Container(
            height: 100,
            // color: Colors.red,
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // left icon
                GestureDetector(
                  child: Container(
                    // width: 80,
                    // height: 80,
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      child: _avatarImage(),
                    ),
                  ),
                  onTap: _imagePickerAction,
                ),
                SizedBox(width: 10,),
                //  right
                Container(
                  width: screenWidth(context) - 114,
                  child: Column(
                    children: [
                      SizedBox(height: 25,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "This is Name",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("微信：123456789"),
                          Image.asset(
                            "images/icon_right.png",
                            height: 15,
                            width: 15,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 10,
            color: _bgColor,
          ),
        ],
      ),
    );
  }

  Widget _avatarImage() {
    if (_avatarFile == null) {
      return Image.network(
        "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
        width: 80,
        height: 80,
      );
    }
    else {
      return Image.file(
        _avatarFile!,
        fit: BoxFit.fill,
        width: 80,
        height: 80,
      );
    }
  }

  Widget itemBuild(BuildContext context, int index) {
    if (index == 0) {
      return itemHeaderBuild();
    }
    else {
      return DiscoverCell(title: "支付 $index", imageName: "images/shop.png");
    }
  }

  // 通过ImagePicker获取图片，需要现在info.plist中添加权限
  void _imagePickerAction() async {
    try {
      XFile? xFile = await ImagePicker().pickImage(source: ImageSource.gallery);
      String? path = xFile?.path; //xFile != null ? xFile.path : "";
      print("image path = $path");
      if (path != null) {
        setState(() {
          _avatarFile = File(path);
        });
      }
      else {
        setState(() {
          _avatarFile = null;
        });
        print("选择照片失败");
      }
    }
    catch (e) {
      print(e.toString());
      print("选择照片失败 catch error...");
    }
  }
}