import 'package:flutter/material.dart';
import 'package:hm_shop/pages/cart/index.dart';
import 'package:hm_shop/pages/category/index.dart';
import 'package:hm_shop/pages/home/index.dart';
import 'package:hm_shop/pages/mine/index.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<Map<String, String>> _listTab = [
    {
      "icon": "lib/assets/ic_public_home_normal.png",
      "active_icon": "lib/assets/ic_public_home_active.png",
      "text": "首页",
    },
    {
      "icon": "lib/assets/ic_public_pro_normal.png",
      "active_icon": "lib/assets/ic_public_pro_active.png",
      "text": "分类",
    },
    {
      "icon": "lib/assets/ic_public_cart_normal.png",
      "active_icon": "lib/assets/ic_public_cart_active.png",
      "text": "购物车",
    },
    {
      "icon": "lib/assets/ic_public_my_normal.png",
      "active_icon": "lib/assets/ic_public_my_active.png",
      "text": "我的",
    },
  ];
  int _currentIndex = 0;
  List<BottomNavigationBarItem> _getTabBarWidget() {
    return List.generate(_listTab.length, (int index) {
      return BottomNavigationBarItem(
        icon: Image.asset(_listTab[index]["icon"]!, width: 30, height: 30),
        activeIcon: Image.asset(
          _listTab[index]["active_icon"]!,
          width: 30,
          height: 30,
        ),
        label: _listTab[index]["text"],
      );
    });
  }

  List<Widget> _getChildren() {
    return [HomeView(), CategoryView(), CartView(), MineView()];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: Text("主页"),),
      body: SafeArea(
        child: IndexedStack(index: _currentIndex, children: _getChildren()),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: _getTabBarWidget(),
        currentIndex: _currentIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.blue,
        showUnselectedLabels: true,
      ),
    );
  }
}
