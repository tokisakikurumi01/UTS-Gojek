part of '../pages.dart';

class RestoDetailPage extends StatefulWidget {
  final RestaurantModel resto;
  RestoDetailPage({Key key, this.resto}) : super(key: key);

  @override
  _RestoDetailPageState createState() => _RestoDetailPageState();
}

class _RestoDetailPageState extends State<RestoDetailPage> {
  final controller = ScrollController();
  double scrollProgress = 0;
  bool closeMenu = false;

  @override
  void initState() {
    super.initState();
    controller.addListener(onScroll);
  }

  onScroll() {
    if (controller.offset <= 100) {
      setState(() {
        scrollProgress = controller.offset;
        print(scrollProgress);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(),
      body: buildContent(),
    ));
  }

  Widget buildAppBar() {
    return AppBar(
      titleSpacing: 0,
      elevation: scrollProgress / 25,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      title: Row(
        children: [
          BackButton(
            color: Colors.black87,
          ),
          SizedBox(
              width: 60.0.w,
              child: Opacity(
                opacity: scrollProgress / 100,
                child: Text(widget.resto.name,
                    style: TextStyle(
                        fontSize: 14.0.sp,
                        color: Colors.black87,
                        fontWeight: FontWeight.bold)),
              ))
        ],
      ),
      actions: [
        Icon(Icons.search, color: Colors.black87),
        Container(
            margin: EdgeInsets.symmetric(horizontal: 5.0.w),
            child: Icon(
              Icons.share,
              color: Colors.black87,
            ))
      ],
    );
  }

  Widget buildContent() {
    Widget buildRestoTitleAndLogo() {
      return Container(
          margin: EdgeInsets.all(5.0.w),
          width: 90.0.w,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 65.0.w,
                    child: Text(widget.resto.name,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 18.0.sp, fontWeight: FontWeight.bold)),
                  ),
                  Container(
                      width: 20.0.w,
                      height: 20.0.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(widget.resto.restaurantCover))))
                ],
              ),
              SizedBox(height: 2.0.w),
              Row(
                children: [
                  Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 3.0.w, vertical: 1.0.w),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.orange),
                      child: Row(
                        children: [
                          Text('Super Partner'),
                        ],
                      )),
                  SizedBox(width: 2.0.w),
                  Text(widget.resto.categories,
                      style:
                          TextStyle(fontSize: 10.0.sp, color: Colors.black54))
                ],
              )
            ],
          ));
    }

    Widget buildRestoInfo() {
      Widget buildData({String desc, Widget dataWidget, bool last}) {
        return Row(
          children: [
            Container(
              margin: EdgeInsets.all(5.0.w),
              child: Column(
                children: [
                  dataWidget,
                  SizedBox(height: 1.0.w),
                  Text(desc,
                      style:
                          TextStyle(fontSize: 10.0.sp, color: Colors.black54))
                ],
              ),
            ),
            last
                ? Container()
                : Container(height: 16.0.w, width: 0.5.w, color: Colors.black12)
          ],
        );
      }

      Widget buildDollar(int count, double fontSize) {
        List<Widget> listData = [];
        for (var i = 0; i < 4; i++) {
          listData.add(Text("\$",
              style: TextStyle(
                  fontSize: fontSize,
                  fontWeight: FontWeight.bold,
                  color: i <= count - 1 ? Colors.black87 : Colors.black54)));
        }

        return Row(
          children: listData,
        );
      }

      return Container(
          height: 20.0.w,
          color: Colors.black.withOpacity(0.05),
          child: ListView(scrollDirection: Axis.horizontal, children: [
            buildData(
                desc: '100 ratings',
                last: false,
                dataWidget: Row(
                  children: [
                    Icon(Icons.star, size: 5.0.w, color: Colors.red),
                    SizedBox(width: 1.0.w),
                    Text(widget.resto.rate.toString(),
                        style: TextStyle(
                            fontSize: 10.0.sp, fontWeight: FontWeight.bold))
                  ],
                )),
            buildData(
                desc: widget.resto.estimateTime.toString() + " min",
                last: false,
                dataWidget: Row(
                  children: [
                    Icon(Icons.location_on, size: 5.0.w, color: Colors.red),
                    SizedBox(width: 1.0.w),
                    Text(widget.resto.distanceInKM.toString() + " km",
                        style: TextStyle(
                            fontSize: 10.0.sp, fontWeight: FontWeight.bold))
                  ],
                )),
            buildData(
                desc: "over 100k",
                last: false,
                dataWidget: buildDollar(widget.resto.priceTag, 12.0.sp)),
            Container(
                margin:
                    EdgeInsets.symmetric(horizontal: 5.0.w, vertical: 5.0.w),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white),
                child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: 3.0.w, vertical: 1.0.w),
                    child: Row(
                      children: [
                        Icon(Icons.info, size: 5.0.w, color: Colors.black45),
                        SizedBox(width: 1.0.w),
                        Text('Info',
                            style: TextStyle(
                                fontSize: 12.0.sp, fontWeight: FontWeight.bold))
                      ],
                    )))
          ]));
    }

    Widget buildPickupWidget() {
      return Container(
          margin: EdgeInsets.symmetric(horizontal: 5.0.w),
          padding: EdgeInsets.only(top: 5.0.w),
          width: 90.0.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                      width: 10.0.w,
                      height: 10.0.w,
                      child: Image.asset('assets/icons/food 1_2.png')),
                  SizedBox(
                    width: 5.0.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Pickup: collect order at restom',
                          style: TextStyle(
                              fontSize: 10.0.sp, fontWeight: FontWeight.bold)),
                      Text("Food'll be ready in 8 minutes",
                          style: TextStyle(
                              fontSize: 10.0.sp, color: Colors.black54))
                    ],
                  )
                ],
              ),
              Icon(
                Icons.info,
                color: Colors.black.withOpacity(0.6),
                size: 8.0.w,
              )
            ],
          ));
    }

    Widget buildPromo() {
      Widget buildPromoData({String data, String imageAsset}) {
        return Container(
            margin: EdgeInsets.only(top: 3.0.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                        width: 7.0.w,
                        height: 7.0.w,
                        child: Image.asset(imageAsset)),
                    Text(data,
                        style: TextStyle(
                            fontSize: 10.0.sp,
                            color: Colors.black.withOpacity(0.8))),
                  ],
                ),
                Icon(Icons.keyboard_arrow_right,
                    size: 6.0.w, color: Colors.black54)
              ],
            ));
      }

      return Container(
        margin: EdgeInsets.symmetric(horizontal: 5.0.w),
        width: 90.0.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 5.0.w),
            Text('Available promos',
                style: TextStyle(
                    fontSize: 16.0.sp,
                    color: Colors.black87,
                    fontWeight: FontWeight.bold)),
            buildPromoData(
                data: '60k food discount. Min order 200k with GoPay',
                imageAsset: 'assets/icons/food_menu_4_on.png'),
            buildPromoData(
                data: '7k delivery discount. No min. order',
                imageAsset: 'assets/icons/food_menu_4_on.png'),
          ],
        ),
      );
    }

    Widget buildMenu() {
      Widget buildFoodMenu(Menu menu, bool last) {
        return Column(
          children: [
            Row(
              children: [
                Container(
                    width: 65.0.w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(menu.title,
                            maxLines: 2,
                            style: TextStyle(
                                fontSize: 12.0.sp,
                                fontWeight: FontWeight.bold)),
                        SizedBox(height: 2.0.w),
                        Text(menu.desc,
                            maxLines: 2,
                            style: TextStyle(
                                fontSize: 12.0.sp, color: Colors.black54)),
                        SizedBox(height: 2.0.w),
                        Row(
                          children: [
                            Text(menu.price,
                                style: TextStyle(
                                    fontSize: 14.0.sp,
                                    fontWeight: FontWeight.bold)),
                            menu.discountPrice == null
                                ? Container()
                                : Row(
                                    children: [
                                      SizedBox(width: 2.0.w),
                                      Text(menu.discountPrice,
                                          style: TextStyle(
                                              decoration:
                                                  TextDecoration.lineThrough,
                                              fontSize: 12.0.sp,
                                              color: Colors.black54,
                                              fontWeight: FontWeight.bold)),
                                      SizedBox(width: 2.0.w),
                                      Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 5.0.w,
                                              vertical: 2.0.w),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: Colors.red),
                                          child: Text('Promo',
                                              style: TextStyle(
                                                  fontSize: 10.0.sp,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold)))
                                    ],
                                  )
                          ],
                        )
                      ],
                    )),
                SizedBox(width: 4.0.w),
                Container(
                    width: 20.0.w,
                    height: 20.0.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                            image: AssetImage(menu.imageAsset),
                            fit: BoxFit.cover)))
              ],
            ),
            SizedBox(height: 2.0.w),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.favorite, size: 6.0.w, color: Colors.black38),
                Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: 6.0.w, vertical: 1.0.w),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border:
                            Border.all(color: Colors.black54, width: 0.3.w)),
                    child: Text('Add',
                        style: TextStyle(
                            fontSize: 12.0.sp, color: Colors.black54)))
              ],
            ),
            last
                ? Container()
                : Container(
                    margin: EdgeInsets.symmetric(vertical: 5.0.w),
                    width: double.infinity,
                    height: 0.1.w,
                    color: Colors.black12)
          ],
        );
      }

      List<Widget> listMenuWidget = [];

      for (var i = 0; i < foodMenuDummy.length; i++) {
        List<Widget> listMenuFinal = [];
        for (var j = 0; j < foodMenuDummy[i].menu.length; j++) {
          listMenuFinal.add(buildFoodMenu(
              foodMenuDummy[i].menu[j], j == foodMenuDummy[i].menu.length - 1));
        }
        listMenuWidget.add(Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 5.0.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(foodMenuDummy[i].title,
                      style: TextStyle(
                          fontSize: 15.0.sp, fontWeight: FontWeight.bold)),
                  SizedBox(height: 7.0.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: listMenuFinal,
                  ),
                ],
              ),
            ),
            Container(
                margin: EdgeInsets.symmetric(vertical: 5.0.w),
                width: double.infinity,
                height: i == foodMenuDummy.length - 1 ? 0 : 2.0.w,
                color: Colors.black12)
          ],
        ));
      }
      return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: listMenuWidget);
    }

    List<Widget> buildMenuData = [];

    for (var i = 0; i < foodMenuDummy.length; i++) {
      buildMenuData.add(Container(
          padding: EdgeInsets.symmetric(horizontal: 5.0.w),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 5.0.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 50.0.w,
                      child: Text(foodMenuDummy[i].title,
                          maxLines: 1,
                          style: TextStyle(
                              fontSize: 12.0.sp, fontWeight: FontWeight.bold)),
                    ),
                    Text(foodMenuDummy[i].menu.length.toString(),
                        style:
                            TextStyle(fontSize: 12.0.sp, color: Colors.black54))
                  ],
                ),
              ),
              i != foodMenuDummy.length - 1
                  ? Container(
                      width: double.infinity,
                      height: 0.5.w,
                      color: Colors.black12)
                  : Container()
            ],
          )));
    }
    return Stack(
      children: [
        SingleChildScrollView(
            controller: controller,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildRestoTitleAndLogo(),
                buildRestoInfo(),
                buildPickupWidget(),
                buildPromo(),
                Container(
                    margin: EdgeInsets.symmetric(vertical: 3.0.w),
                    height: 0.3.w,
                    width: double.infinity,
                    color: Colors.black12),
                buildMenu(),
                SizedBox(height: 80.0.h)
              ],
            )),
        closeMenu
            ? Stack(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        closeMenu = false;
                      });
                    },
                    child: Container(
                        width: 100.0.w,
                        height: 100.0.h,
                        color: Colors.black.withOpacity(0.5)),
                  ),
                  Positioned(
                      bottom: 20.0.w,
                      child: Container(
                          width: 80.0.w,
                          height: 30.0.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white),
                          margin: EdgeInsets.symmetric(horizontal: 10.0.w),
                          child: SingleChildScrollView(
                              child: Column(
                            children: buildMenuData,
                          ))))
                ],
              )
            : Container(),
        Positioned(
            bottom: 3.0.w,
            child: Container(
                width: 100.0.w,
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      closeMenu = !closeMenu;
                    });
                  },
                  child: Container(
                      width: 25.0.w,
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(20)),
                      padding: EdgeInsets.all(3.0.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(closeMenu ? Icons.close : Icons.fastfood_sharp,
                              size: 6.0.w, color: Colors.white),
                          SizedBox(width: 1.0.w),
                          Text(closeMenu ? 'Close' : 'Menu',
                              style: TextStyle(
                                  fontSize: 10.0.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        ],
                      )),
                )))
      ],
    );
  }
}
