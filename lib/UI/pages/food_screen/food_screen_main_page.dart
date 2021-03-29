part of '../pages.dart';

class FoodPageMain extends StatefulWidget {
  FoodPageMain({Key key}) : super(key: key);

  @override
  _FoodPageMainState createState() => _FoodPageMainState();
}

final List<Map<String, String>> mockImg = [
  {'assets': "assets/images/illustration/b.jpeg", 'url': ''},
  {'assets': "assets/images/illustration/b2.jpeg", 'url': ''},
  {'assets': "assets/images/illustration/b3.jpeg", 'url': ''},
];

List<T> map<T>(List list, Function handler) {
  List<T> result = [];
  for (var i = 0; i < list.length; i++) {
    result.add(handler(i, list[i]));
  }
  return result;
}

class _FoodPageMainState extends State<FoodPageMain> {
  int _current = 0;
  final controller = ScrollController();
  double scrollProgress = 0;

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
      ),
    );
  }

  Widget buildAppBar() {
    return AppBar(
      elevation: (scrollProgress / 25),
      backgroundColor: Colors.white,
      titleSpacing: 0,
      automaticallyImplyLeading: false,
      toolbarHeight: 20.0.h,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              padding: EdgeInsets.symmetric(horizontal: 5.0.w),
              height: 10.0.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.close, size: 4.0.h, color: Colors.black54),
                      SizedBox(
                        width: 5.0.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          scrollProgress > 90
                              ? Container()
                              : Opacity(
                                  opacity: (100 - scrollProgress) / 100,
                                  child: Row(
                                    children: [
                                      Text('Your Location',
                                          style: TextStyle(
                                              color: Colors.black87,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 10.0.sp)),
                                      Icon(Icons.keyboard_arrow_down,
                                          size: 5.0.w, color: Colors.red)
                                    ],
                                  ),
                                ),
                          Row(
                            children: [
                              SizedBox(
                                width: 50.0.w,
                                child: Text('Tarumanagara University Campus',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12.0.sp)),
                              ),
                              Opacity(
                                opacity: scrollProgress / 100,
                                child: Icon(Icons.keyboard_arrow_down,
                                    size: 7.0.w, color: Colors.red),
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                  Icon(
                    Icons.favorite,
                    color: Colors.black,
                  )
                ],
              )),
          Container(
              width: 100.0.w,
              height: 10.0.h,
              padding: EdgeInsets.symmetric(horizontal: 5.0.w, vertical: 1.5.w),
              child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Colors.black.withOpacity(0.06)),
                  child: Row(
                    children: [
                      Container(
                          padding: EdgeInsets.all(1.0.w),
                          margin: EdgeInsets.symmetric(horizontal: 5.0.w),
                          child: Icon(Icons.search, color: Colors.black54)),
                      Text('What would you like to eat?',
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 12.0.sp,
                              color: Colors.black38))
                    ],
                  )))
        ],
      ),
    );
  }

  Widget buildContent() {
    Widget buildBannerSlideShow() {
      return CarouselSlider(
        options: CarouselOptions(height: 400.0),
        items: [1, 2, 3, 4, 5].map((i) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(color: Colors.amber),
                  child: Text(
                    'text $i',
                    style: TextStyle(fontSize: 16.0),
                  ));
            },
          );
        }).toList(),
      );
    }

    Widget buildCategory() {
      List<Widget> categoryDataWidget = [];

      List<Map<String, String>> dataCategory = [
        {
          'title_1': 'New this week',
          'title_2': 'Pasti ada promo',
          'asset_1': 'assets/icons/food 1_1.png',
          'asset_2': 'assets/icons/food 1_8.png',
        },
        {
          'title_1': 'Near me',
          'title_2': 'Best sellers',
          'asset_1': 'assets/icons/food 1_7.png',
          'asset_2': 'assets/icons/food 1_6.png',
        },
        {
          'title_1': 'Pickup',
          'title_2': 'Ready to Cook',
          'asset_1': 'assets/icons/food 1_2.png',
          'asset_2': 'assets/icons/food 1_5.png',
        },
        {
          'title_1': 'Healthy food',
          'title_2': 'Most loved',
          'asset_1': 'assets/icons/food 1_3.png',
          'asset_2': 'assets/icons/food 1_4.png',
        }
      ];

      Widget buildCategoryCard({String title, String asset}) {
        return Container(
          width: 28.0.w,
          child: Column(
            children: [
              Container(
                  width: 20.0.w,
                  height: 20.0.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                          color: Colors.black.withOpacity(0.1), width: 0.5.w)),
                  padding: EdgeInsets.all(2.0.w),
                  child: Image(image: AssetImage(asset))),
              SizedBox(height: 2.0.w),
              Text(title,
                  style: TextStyle(
                      fontSize: 11.0.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w500))
            ],
          ),
        );
      }

      for (var i = 0; i < dataCategory.length; i++) {
        categoryDataWidget.add(Container(
          margin: EdgeInsets.only(left: 2.0.w),
          child: Column(
            children: [
              buildCategoryCard(
                  asset: dataCategory[i]['asset_1'],
                  title: dataCategory[i]['title_1']),
              SizedBox(height: 5.0.w),
              buildCategoryCard(
                  asset: dataCategory[i]['asset_2'],
                  title: dataCategory[i]['title_2'])
            ],
          ),
        ));
      }

      return Container(
          height: 65.0.w,
          child: ListView(
              scrollDirection: Axis.horizontal, children: categoryDataWidget));
    }

    Widget buildCuisines() {
      List<Map<String, String>> dataCuisines = [
        {'title': 'Beverages', 'asset': 'assets/icons/food 2_1.png'},
        {'title': 'Snacks', 'asset': 'assets/icons/food 2_2.png'},
        {'title': 'Sweets', 'asset': 'assets/icons/food 2_9.png'},
        {'title': 'Rice', 'asset': 'assets/icons/food 2_3.png'},
        {'title': 'Chicken &\nduck', 'asset': 'assets/icons/food 2_4.png'},
        {'title': 'Fast food', 'asset': 'assets/icons/food 2_5.png'},
        {'title': 'Bakery', 'asset': 'assets/icons/food 2_8.png'},
        {'title': 'Japanese', 'asset': 'assets/icons/food 2_6.png'},
        {'title': 'Bakso & soto', 'asset': 'assets/icons/food 2_7.png'},
      ];

      List<Widget> widgetCuisines = [];

      for (var i = 0; i < dataCuisines.length; i++) {
        widgetCuisines.add(Container(
            margin: EdgeInsets.only(
                left: i == 0 ? 5.0.w : 3.0.w,
                right: i == dataCuisines.length - 1 ? 5.0.w : 0),
            child: Column(
              children: [
                Container(
                    width: 20.0.w,
                    height: 20.0.w,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage(dataCuisines[i]['asset'])))),
                Text(
                  dataCuisines[i]['title'],
                  textAlign: TextAlign.center,
                )
              ],
            )));
      }

      return Column(
        children: [
          Container(
              margin: EdgeInsets.symmetric(horizontal: 5.0.w),
              width: 90.0.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Choose from cuisines',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                          fontSize: 14.0.sp)),
                  Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 5.0.w, vertical: 2.0.w),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: ColorHelper.greenWithOpacity),
                      child: Text('See all',
                          style: TextStyle(
                              fontSize: 12.0.sp,
                              fontWeight: FontWeight.bold,
                              color: ColorHelper.greenGojekColor)))
                ],
              )),
          SizedBox(height: 2.0.w),
          Container(
              height: 30.0.w,
              child: ListView(
                  scrollDirection: Axis.horizontal, children: widgetCuisines))
        ],
      );
    }

    Widget buildCarousel() {
      List<Color> data = [Colors.blue, Colors.red, Colors.green];

      PageController controller = PageController();

      return Column(
        children: [
          CarouselSlider(
            options: CarouselOptions(
                autoPlay: true,
                onPageChanged: (value, value2) {
                  setState(() {
                    _current = value;
                  });
                },
                height: 40.0.w),
            items: mockImg.map((data) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(data['assets']))),
                  );
                },
              );
            }).toList(),
          ),
          SizedBox(height: 5.0.w),
          Container(
            width: 100.0.w,
            padding: EdgeInsets.symmetric(horizontal: 5.0.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: map<Widget>(
                mockImg,
                (index, url) {
                  return Container(
                    width: 4.0.w,
                    height: 4.0.w,
                    margin: EdgeInsets.only(right: 2.0.w),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _current == index
                            ? ColorHelper.greenGojekColor
                            : Colors.black.withOpacity(0.05)),
                  );
                },
              ),
            ),
          ),
        ],
      );
    }

    Widget buildRestaurantDataHorizontal() {
      List<Widget> dataWidgetRestaurant = [];

      for (var i = 0; i < discountRestaurantDummyData.length; i++) {
        dataWidgetRestaurant.add(Container(
            margin: EdgeInsets.only(
                left: i == 0 ? 5.0.w : 2.0.w,
                right: i == discountRestaurantDummyData.length - 1 ? 5.0.w : 0),
            child: Stack(
              children: [
                Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            width: 50.0.w,
                            height: 35.0.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                    image: AssetImage(
                                        discountRestaurantDummyData[i]
                                            .restaurantCover),
                                    fit: BoxFit.cover))),
                        SizedBox(height: 3.0.w),
                        Container(
                          margin: EdgeInsets.only(left: 3.0.w),
                          child: Text(
                              discountRestaurantDummyData[i]
                                      .distanceInKM
                                      .toString() +
                                  " KM",
                              style: TextStyle(
                                  fontSize: 10.0.sp, color: Colors.black54)),
                        ),
                        SizedBox(height: 3.0.w),
                        Container(
                          width: 50.0.w,
                          padding: EdgeInsets.symmetric(horizontal: 3.0.w),
                          child: Text(discountRestaurantDummyData[i].name,
                              maxLines: 2,
                              style: TextStyle(
                                  fontSize: 12.0.sp,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ],
                    )),
                Positioned(
                    top: 3.0.w,
                    left: 0,
                    child: Container(
                      width: 20.0.w,
                      height: 8.4.w,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  'assets/icons/discount_bubble.png'))),
                      child: Text(discountRestaurantDummyData[i].discount,
                          style: TextStyle(
                              color: Colors.white, fontSize: 10.0.sp)),
                      alignment: Alignment.center,
                    ))
              ],
            )));
      }

      return Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 5.0.w),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Discounts up to 60k',
                          style: TextStyle(
                              fontSize: 14.0.sp,
                              color: Colors.black87,
                              fontWeight: FontWeight.bold)),
                      Text('Order anything with our promo',
                          style: TextStyle(
                              fontSize: 10.0.sp, color: Colors.black54)),
                      SizedBox(height: 4.0.w)
                    ],
                  ),
                  Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 5.0.w, vertical: 2.0.w),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: ColorHelper.greenWithOpacity),
                      child: Text('See all',
                          style: TextStyle(
                              fontSize: 12.0.sp,
                              fontWeight: FontWeight.bold,
                              color: ColorHelper.greenGojekColor)))
                ]),
          ),
          Container(
              height: 60.0.w,
              child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: dataWidgetRestaurant))
        ],
      );
    }

    Widget recomendationRestaurant() {
      List<Widget> dataWidgetRestaurant = [];

      for (var i = 0; i < topRatedRestaurantDummyData.length; i++) {
        dataWidgetRestaurant.add(Container(
            margin: EdgeInsets.only(left: 4.0.w),
            child: Stack(
              children: [
                Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            width: 50.0.w,
                            height: 35.0.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                    image: AssetImage(
                                        topRatedRestaurantDummyData[i]
                                            .restaurantCover),
                                    fit: BoxFit.cover))),
                        SizedBox(height: 3.0.w),
                        Container(
                          margin: EdgeInsets.only(left: 3.0.w),
                          child: Text(
                              topRatedRestaurantDummyData[i]
                                      .distanceInKM
                                      .toString() +
                                  ' KM',
                              style: TextStyle(
                                  fontSize: 10.0.sp, color: Colors.black54)),
                        ),
                        SizedBox(height: 3.0.w),
                        Container(
                            padding: EdgeInsets.symmetric(horizontal: 3.0.w),
                            height: 12.0.w,
                            width: 50.0.w,
                            child: Text(topRatedRestaurantDummyData[i].name,
                                style: TextStyle(
                                    fontSize: 12.0.sp,
                                    fontWeight: FontWeight.bold))),
                        Container(
                            margin: EdgeInsets.only(left: 3.0.w),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.star_sharp,
                                  color: Colors.orange,
                                ),
                                SizedBox(width: 2.0.w),
                                Text(
                                    topRatedRestaurantDummyData[i]
                                        .rate
                                        .toString(),
                                    style: TextStyle(
                                        fontSize: 11.0.sp,
                                        color: Colors.black87))
                              ],
                            ))
                      ],
                    )),
              ],
            )));
      }

      return Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 5.0.w),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Top-rated by other foodies',
                          style: TextStyle(
                              fontSize: 14.0.sp,
                              color: Colors.black87,
                              fontWeight: FontWeight.bold)),
                      Text('Sponsored',
                          style: TextStyle(
                              fontSize: 10.0.sp, color: Colors.black54)),
                      SizedBox(height: 4.0.w)
                    ],
                  ),
                ]),
          ),
          Container(
              height: 70.0.w,
              child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: dataWidgetRestaurant))
        ],
      );
    }

    Widget nearbyRecomendation() {
      List<Widget> nearbyRestaurantWidget = [];

      for (var i = 0; i < nearbyRestaurantDummyData.length; i++) {
        nearbyRestaurantWidget.add(Container(
            margin: EdgeInsets.only(
              top: 7.0.w,
              left: 5.0.w,
              right: 5.0.w,
            ),
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Stack(
                children: [
                  Column(
                    children: [
                      Container(
                          width: 30.0.w,
                          height: 20.0.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                  image: AssetImage(nearbyRestaurantDummyData[i]
                                      .restaurantCover),
                                  fit: BoxFit.cover))),
                      SizedBox(height: 5.0.w)
                    ],
                  ),
                  Positioned(
                      bottom: 0,
                      child: Container(
                          width: 30.0.w,
                          alignment: Alignment.center,
                          child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              child: Container(
                                  width: 20.0.w,
                                  height: 8.0.w,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.star_sharp,
                                        color: Colors.orange,
                                      ),
                                      SizedBox(width: 1.0.w),
                                      Text(
                                          nearbyRestaurantDummyData[i]
                                              .rate
                                              .toString(),
                                          style: TextStyle(
                                              fontSize: 12.0.sp,
                                              fontWeight: FontWeight.bold))
                                    ],
                                  )))))
                ],
              ),
              SizedBox(
                width: 5.0.w,
              ),
              Expanded(
                  child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => RestoDetailPage(
                                resto: nearbyRestaurantDummyData[0],
                              )));
                },
                child: Container(
                    color: Colors.white,
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 45.0.w,
                              child: Text(nearbyRestaurantDummyData[i].name,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 12.0.sp,
                                      fontWeight: FontWeight.bold)),
                            ),
                            Icon(Icons.check)
                          ],
                        ),
                        Text(nearbyRestaurantDummyData[i].categories,
                            style: TextStyle(
                                fontSize: 10.0.sp, color: Colors.black54)),
                        Container(
                            margin: EdgeInsets.symmetric(vertical: 2.0.w),
                            width: double.infinity,
                            height: 0.2.w,
                            color: Colors.black12),
                        Row(children: [
                          Text(
                              nearbyRestaurantDummyData[i]
                                      .distanceInKM
                                      .toString() +
                                  ' km ',
                              style: TextStyle(
                                  fontSize: 10.0.sp,
                                  fontWeight: FontWeight.bold)),
                          Text(
                              'Delivery in ' +
                                  nearbyRestaurantDummyData[i]
                                      .estimateTime
                                      .toString() +
                                  " min",
                              style: TextStyle(
                                fontSize: 10.0.sp,
                              ))
                        ]),
                        SizedBox(height: 3.0.w),
                        nearbyRestaurantDummyData[i].promotion == false
                            ? Container()
                            : Row(
                                children: [
                                  Container(
                                      width: 6.0.w,
                                      height: 6.0.w,
                                      child: Image.asset(
                                          'assets/icons/food_menu_4_on.png')),
                                  Text('GoFood Promo',
                                      style: TextStyle(
                                          fontSize: 11.0.sp,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey))
                                ],
                              )
                      ],
                    )),
              ))
            ])));
      }

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              margin: EdgeInsets.only(left: 5.0.w),
              child: Text("What's good 'round the block",
                  style: TextStyle(
                      fontSize: 14.0.sp,
                      color: Colors.black87,
                      fontWeight: FontWeight.bold))),
          Container(
              margin: EdgeInsets.only(left: 5.0.w),
              child: Text("Try your area's finest eats.",
                  style: TextStyle(fontSize: 12.0.sp, color: Colors.black54))),
          Column(
            children: nearbyRestaurantWidget,
          )
        ],
      );
    }

    return Stack(
      children: [
        Container(
          width: 100.0.w,
          height: 90.0.h,
          child: SingleChildScrollView(
            controller: controller,
            child: Column(
              children: [
                Container(
                    margin: EdgeInsets.symmetric(vertical: 5.0.w),
                    child: buildCarousel()),
                buildCategory(),
                buildCuisines(),
                buildRestaurantDataHorizontal(),
                SizedBox(height: 5.0.w),
                recomendationRestaurant(),
                SizedBox(height: 5.0.w),
                nearbyRecomendation(),
                SizedBox(height: 10.0.h)
              ],
            ),
          ),
        ),
      ],
    );
  }
}
