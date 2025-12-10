import 'package:flutter/cupertino.dart';
import 'package:hm_shop/components/home/hmCategory.dart';
import 'package:hm_shop/components/home/hmHot.dart';
import 'package:hm_shop/components/home/hmMoreList.dart';
import 'package:hm_shop/components/home/hmSlider.dart';
import 'package:hm_shop/components/home/hmSuggestion.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  //获取滚动容器的内容
  List<Widget> _getScrollChildren() {
    return [
      //包裹普通 widget 的 sliver 家族的组件
      SliverToBoxAdapter(child: HmSlider()),
      //放置间隔
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      //放置分类组件
      SliverToBoxAdapter(child: HmCategory()),
      //放置间隔
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      //放置推荐组件
      SliverToBoxAdapter(child: HmSuggestion()),
      //放置间隔
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      //放置爆款推荐
      SliverToBoxAdapter(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Flex(
            direction: Axis.horizontal,
            children: [
              Expanded(child: HmHot()),
              SizedBox(width: 10),
              Expanded(child: HmHot()),
            ],
          ),
        ),
      ),
      //放置间隔
      SliverToBoxAdapter(child: SizedBox(height: 10)),
      HmMoreList()
    ];
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: _getScrollChildren());
  }
}
