import 'package:flutter/material.dart';

// 主体色 使用驼峰命名，需要注意，需要使用const
const Color WeChatThemeColor = Color.fromRGBO(220, 220, 220, 0.6);

// 屏幕宽高 这里不用使用const，因为需要计算
double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;
double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;