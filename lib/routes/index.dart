import 'package:flutter/material.dart';
import 'package:hm_shop/pages/login/index.dart';
import 'package:hm_shop/pages/main/index.dart';

Widget getRootWidget() {
  return MaterialApp(
    //命名路由
    initialRoute: "/",
    routes: getRootRoutes(),
  );
}

//返回该 app 的路由函数
Map<String, Widget Function(BuildContext)> getRootRoutes() {
  return {"/": (context) => MainPage(), "/login": (context) => LoginPage()};
}
