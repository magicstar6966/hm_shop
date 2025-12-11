import 'package:flutter/cupertino.dart';
import 'package:hm_shop/components/home/hmCategory.dart';
import 'package:hm_shop/components/home/hmHot.dart';
import 'package:hm_shop/components/home/hmMoreList.dart';
import 'package:hm_shop/components/home/hmSlider.dart';
import 'package:hm_shop/components/home/hmSuggestion.dart';
import 'package:hm_shop/viewmodels/home.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final List<BannerItem> _bannerList = [
    BannerItem(
      id: '1',
      imgUrl:
          "https://img.alicdn.com/imgextra/i1/O1CN01f0xQO3231pCQyxUMR_!!6000000007196-2-tps-2112-800.png",
    ),
    BannerItem(
      id: '2',
      imgUrl:
          "https://img.alicdn.com/imgextra/i3/O1CN01zILgqe1OpNoGuLwC6_!!6000000001754-2-tps-2112-800.png",
    ),
    BannerItem(
      id: '3',
      imgUrl:
          'https://img.alicdn.com/imgextra/i4/O1CN01hyRl721l7AjxUP0kt_!!6000000004771-2-tps-2112-800.png',
    ),
  ];
  //获取滚动容器的内容
  List<Widget> _getScrollChildren() {
    return [
      //包裹普通 widget 的 sliver 家族的组件
      SliverToBoxAdapter(child: HmSlider(bannerList: _bannerList)),
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
      HmMoreList(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: _getScrollChildren());
  }
}
