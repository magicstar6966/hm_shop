class BannerItem {
  String id;
  String imgUrl;
  BannerItem({required this.id, required this.imgUrl});
  //扩展一个工厂函数，一般用 factory 来声明，一般用来创建实例对象
  factory BannerItem.fromJson(Map<String, dynamic> json) {
    //必须返回一个 BannerItem 对象
    return BannerItem(id: json["id"] ?? "", imgUrl: json["imgUrl"] ?? "");
  }
}

//根据json编写class对象和工厂转化函数
// 分类列表
class CategoryItem {
  String id;
  String name;
  String picture;
  List<CategoryItem>? children;
  List<dynamic>? goods;
  CategoryItem({
    required this.id,
    required this.name,
    required this.picture,
    this.children,
    this.goods,
  });
  //扩展一个工厂函数，一般用 factory 来声明，一般用来创建实例对象
  factory CategoryItem.fromJson(Map<String, dynamic> json) {
    //必须返回一个 CategoryItem 对象
    return CategoryItem(
      id: json["id"] ?? "",
      name: json["name"] ?? "",
      picture: json["picture"] ?? "",
      children: (json["children"] as List?)
          ?.map((item) => CategoryItem.fromJson(item as Map<String, dynamic>))
          .toList(),
      goods: json["goods"],
    );
  }
}

// 特惠推荐数据模型
class SpecialOfferGoods {
  String id;
  String name;
  String? desc;
  String price;
  String picture;
  int orderNum;
  
  SpecialOfferGoods({
    required this.id,
    required this.name,
    this.desc,
    required this.price,
    required this.picture,
    required this.orderNum,
  });
  
  factory SpecialOfferGoods.fromJson(Map<String, dynamic> json) {
    return SpecialOfferGoods(
      id: json["id"] ?? "",
      name: json["name"] ?? "",
      desc: json["desc"],
      price: json["price"] ?? "",
      picture: json["picture"] ?? "",
      orderNum: json["orderNum"] ?? 0,
    );
  }
}

class SpecialOfferGoodsItems {
  int counts;
  int pageSize;
  int pages;
  int page;
  List<SpecialOfferGoods> items;
  
  SpecialOfferGoodsItems({
    required this.counts,
    required this.pageSize,
    required this.pages,
    required this.page,
    required this.items,
  });
  
  factory SpecialOfferGoodsItems.fromJson(Map<String, dynamic> json) {
    return SpecialOfferGoodsItems(
      counts: json["counts"] ?? 0,
      pageSize: json["pageSize"] ?? 0,
      pages: json["pages"] ?? 0,
      page: json["page"] ?? 0,
      items: (json["items"] as List? ?? [])
          .map((item) => SpecialOfferGoods.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }
}

class SpecialOfferSubType {
  String id;
  String title;
  SpecialOfferGoodsItems goodsItems;
  
  SpecialOfferSubType({
    required this.id,
    required this.title,
    required this.goodsItems,
  });
  
  factory SpecialOfferSubType.fromJson(Map<String, dynamic> json) {
    return SpecialOfferSubType(
      id: json["id"] ?? "",
      title: json["title"] ?? "",
      goodsItems: SpecialOfferGoodsItems.fromJson(json["goodsItems"] ?? {}),
    );
  }
}

class SpecialOffer {
  String id;
  String title;
  List<SpecialOfferSubType> subTypes;
  
  SpecialOffer({
    required this.id,
    required this.title,
    required this.subTypes,
  });
  
  factory SpecialOffer.fromJson(Map<String, dynamic> json) {
    return SpecialOffer(
      id: json["id"] ?? "",
      title: json["title"] ?? "",
      subTypes: (json["subTypes"] as List? ?? [])
          .map((item) => SpecialOfferSubType.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }
}

