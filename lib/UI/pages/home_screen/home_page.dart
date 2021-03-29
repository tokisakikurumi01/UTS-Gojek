part of '../pages.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  PanelController pc = PanelController();
  int filterIndex = 0;
  bool showTopShadow = false;
  TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this, initialIndex: 1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildContent(),
    );
  }

  Widget buildContent() {
    Widget buildMenuBar({String title, String assetLogo}) {
      return Container(
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                width: 3.5.h,
                height: 3.5.h,
                child: Image(image: AssetImage(assetLogo))),
            SizedBox(width: 1.0.w),
            Text(
              title,
              style: TextStyle(
                fontSize: 12.0.sp,
                color: Colors.white,
              ),
            )
          ],
        ),
      );
    }

    Widget buildSearchBar() {
      return Container(
          margin: EdgeInsets.symmetric(
            horizontal: 5.0.w,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  width: 73.0.w,
                  height: 11.0.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.black.withOpacity(0.05),
                      border: Border.all(color: Colors.black12, width: 0.3.w)),
                  child: Row(
                    children: [
                      Container(
                          margin: EdgeInsets.only(right: 3.0.w, left: 2.0.w),
                          child: Icon(Icons.search, color: Colors.black87)),
                      Text('Order the best nasgor in town...',
                          style: TextStyle(
                              fontSize: 10.0.sp,
                              color: Colors.black.withOpacity(0.5)))
                    ],
                  )),
              Container(
                  width: 12.0.w,
                  height: 12.0.w,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: ColorHelper.greenGojekColor),
                  padding: EdgeInsets.all(2.0.w),
                  child: Image(
                    image: AssetImage(AssetValue.profileIcon),
                  ))
            ],
          ));
    }

    Widget buildWallet() {
      Widget buildMenuWallet({String title, String imageAsset}) {
        return Flexible(
            flex: 1,
            child: Container(
                width: double.infinity,
                child: Column(
                  children: [
                    Container(
                        width: 8.0.w,
                        height: 8.0.w,
                        child: Image(image: AssetImage(imageAsset))),
                    SizedBox(
                      height: 1.0.w,
                    ),
                    Text(title,
                        style:
                            TextStyle(fontSize: 10.0.sp, color: Colors.white))
                  ],
                )));
      }

      return Container(
          margin: EdgeInsets.symmetric(horizontal: 5.0.w, vertical: 4.0.w),
          width: 90.0.w,
          padding: EdgeInsets.symmetric(horizontal: 4.0.w, vertical: 3.0.w),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: ColorHelper.gopayBackgroundColor),
          child: Row(
            children: [
              Container(
                  width: 40.0.w,
                  padding:
                      EdgeInsets.symmetric(vertical: 2.0.w, horizontal: 5.0.w),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          height: 5.0.w,
                          width: 15.0.w,
                          child:
                              Image(image: AssetImage(AssetValue.gopayLogo))),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 1.0.w),
                        child: Text('Rp4.000.000',
                            style: TextStyle(
                                fontSize: 12.0.sp,
                                color: Colors.black87,
                                fontWeight: FontWeight.bold)),
                      ),
                      Text('Klik & cek riwayat',
                          style: TextStyle(
                              fontSize: 10.0.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.green))
                    ],
                  )),
              SizedBox(width: 2.0.w),
              Expanded(
                  child: Row(
                children: [
                  buildMenuWallet(title: 'Pay', imageAsset: AssetValue.payIcon),
                  buildMenuWallet(
                      title: 'Top Up', imageAsset: AssetValue.topupIcon),
                  buildMenuWallet(
                      title: 'Explore', imageAsset: AssetValue.exploreIcon)
                ],
              ))
            ],
          ));
    }

    Widget buildService() {
      Widget buildServiceData({String assetImage}) {
        return Container(
          width: 42.0.w,
          height: 60.0.w,
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(assetImage)),
              borderRadius: BorderRadius.circular(10),
              color: Colors.blue),
        );
      }

      return Container(
          margin: EdgeInsets.symmetric(horizontal: 5.0.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  margin: EdgeInsets.only(top: 2.0.w, bottom: 2.0.w),
                  child: Text("Service you haven't tried",
                      style: TextStyle(
                          fontSize: 12.0.sp,
                          color: Colors.black87,
                          fontWeight: FontWeight.bold))),
              Wrap(
                spacing: 4.0.w,
                children: [
                  buildServiceData(assetImage: AssetValue.gopay1Illustration),
                  buildServiceData(assetImage: AssetValue.gopay2Illustration)
                ],
              ),
            ],
          ));
    }

    Widget buildNews() {
      Widget buildNewsTopic() {
        List<String> filterData = [
          'All',
          'Covid-19',
          'Entertaiment',
          'Food',
          'J3K'
        ];
        List<Widget> filterDataWidget = [];

        for (var i = 0; i < filterData.length; i++) {
          filterDataWidget.add(
            GestureDetector(
              onTap: () {
                setState(() {
                  filterIndex = i;
                });
              },
              child: Container(
                  margin: EdgeInsets.only(
                      left: i == 0 ? 5.0.w : 2.0.w,
                      right: i == filterData.length - 1 ? 5.0.w : 0),
                  height: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 5.0.w),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 0.1.w,
                          color:
                              filterIndex == i ? Colors.green : Colors.black38),
                      borderRadius: BorderRadius.circular(20),
                      color: filterIndex == i ? Colors.green : Colors.white),
                  child: Text(
                    filterData[i],
                    style: TextStyle(
                        color:
                            filterIndex == i ? Colors.white : Colors.black38),
                  )),
            ),
          );
        }
        return Container(
            height: 5.0.h,
            child: ListView(
                scrollDirection: Axis.horizontal, children: filterDataWidget));
      }

      Widget buildNewsList() {
        Widget buildNewsListData() {
          return Container(
              width: double.infinity,
              child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 90.0.w,
                        height: 45.0.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20)),
                            image: DecorationImage(
                                image: AssetImage(
                                    AssetValue.gotagihanIllustration),
                                fit: BoxFit.fill)),
                      ),
                      Container(
                          padding: EdgeInsets.all(5.0.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Bayar tagihan apa aja pake Go Tagihan',
                                  style: TextStyle(
                                      fontSize: 13.0.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87)),
                              SizedBox(
                                height: 2.0.w,
                              ),
                              Text(
                                  'Sekarang makin mudah bayar tagihan pake Go Tagihan',
                                  style: TextStyle(
                                    fontSize: 11.0.sp,
                                  ))
                            ],
                          ))
                    ],
                  )));
        }

        List<Widget> listNewsDataWidget = [];
        for (var i = 0; i < 1; i++) {
          listNewsDataWidget.add(buildNewsListData());
        }
        return Container(
            margin: EdgeInsets.symmetric(horizontal: 5.0.w),
            width: 90.0.w,
            child: Column(
              children: listNewsDataWidget,
            ));
      }

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              margin: EdgeInsets.only(left: 5.0.w, top: 4.0.w, bottom: 2.0.w),
              width: 90.0.w,
              child: Text("Top picks for you",
                  style: TextStyle(
                      fontSize: 12.0.sp,
                      color: Colors.black87,
                      fontWeight: FontWeight.bold))),
          buildNewsTopic(),
          SizedBox(height: 2.0.w),
          buildNewsList()
        ],
      );
    }

    Widget buildBottomMenu({String title, String imageAsset}) {
      return Flexible(
        flex: 1,
        child: GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => FoodMainPage()));
          },
          child: Container(
              width: double.infinity,
              child: Column(
                children: [
                  Container(
                      width: 10.0.w,
                      height: 10.0.w,
                      child: Image(image: AssetImage(imageAsset))),
                  SizedBox(height: 1.0.w),
                  Text(title,
                      style: TextStyle(
                        fontSize: 10.0.sp,
                      ))
                ],
              )),
        ),
      );
    }

    Widget buildComingSoon() {
      return DraggableScrollableSheet(
          initialChildSize: 0.85,
          minChildSize: 0.4,
          maxChildSize: 0.85,
          builder: (BuildContext context, myscrollController) {
            return Stack(
              children: [
                Container(
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black12.withOpacity(0.1),
                              spreadRadius: 5,
                              blurRadius: 10,
                              offset: Offset(1, 1))
                        ],
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10)),
                        color: Colors.white),
                    child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                width: 100.0.w,
                                height: 50.0.w,
                                child: Image(
                                    image: AssetImage(
                                        AssetValue.comingSoonIllustration))),
                            SizedBox(height: 3.0.w),
                            Text('Coming Soon',
                                style: TextStyle(
                                    fontSize: 20.0.sp,
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold))
                          ],
                        ))),
                Positioned(
                  top: 0,
                  child: Container(
                    width: 100.0.w,
                    alignment: Alignment.center,
                    child: Container(
                        width: 8.0.w,
                        height: 1.0.w,
                        margin: EdgeInsets.symmetric(vertical: 2.0.w),
                        decoration: BoxDecoration(
                            color: Colors.black38,
                            borderRadius: BorderRadius.circular(10))),
                  ),
                ),
              ],
            );
          });
    }

    return Stack(
      children: [
        Container(
            width: 100.0.w,
            height: 70.0.h + 25,
            child: Image(
              image: AssetImage(AssetValue.homeIllustration),
              fit: BoxFit.fill,
            )),
        Positioned(
            top: 25,
            child: Container(
                height: 10.0.h,
                width: 100.0.w,
                padding: EdgeInsets.symmetric(horizontal: 5.0.w),
                alignment: Alignment.center,
                child: Container(
                  height: 5.5.h,
                  child: TabBar(
                    controller: tabController,
                    isScrollable: false,
                    indicator: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20)),
                    tabs: [
                      buildMenuBar(
                          title: 'Promo', assetLogo: AssetValue.discountIcon),
                      buildMenuBar(
                          title: 'Home', assetLogo: AssetValue.homeIcon),
                      buildMenuBar(
                          title: 'Chat', assetLogo: AssetValue.chatIcon),
                    ],
                  ),
                ))),
        TabBarView(
          controller: tabController,
          children: [
            buildComingSoon(),
            Stack(
              children: [
                DraggableScrollableSheet(
                    initialChildSize: 0.85,
                    minChildSize: 0.4,
                    maxChildSize: 0.85,
                    builder: (BuildContext context, myscrollController) {
                      return Stack(
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black12.withOpacity(0.1),
                                        spreadRadius: 5,
                                        blurRadius: 10,
                                        offset: Offset(1, 1))
                                  ],
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10)),
                                  color: Colors.white),
                              child: SingleChildScrollView(
                                  controller: myscrollController,
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 8.0.w,
                                      ),
                                      buildSearchBar(),
                                      buildWallet(),
                                      buildService(),
                                      buildNews(),
                                      Container(
                                          width: 100.0.w,
                                          height: 20.0.h,
                                          color: Colors.white)
                                    ],
                                  ))),
                          Positioned(
                            top: 0,
                            child: Container(
                              width: 100.0.w,
                              alignment: Alignment.center,
                              child: Container(
                                  width: 8.0.w,
                                  height: 1.0.w,
                                  margin: EdgeInsets.symmetric(vertical: 2.0.w),
                                  decoration: BoxDecoration(
                                      color: Colors.black38,
                                      borderRadius: BorderRadius.circular(10))),
                            ),
                          ),
                        ],
                      );
                    }),
                DraggableScrollableSheet(
                    initialChildSize: 0.2,
                    minChildSize: 0.2,
                    maxChildSize: 1.0,
                    builder: (BuildContext context, myscrollController) {
                      return SingleChildScrollView(
                        controller: myscrollController,
                        child: Container(
                            width: 88.0.w,
                            margin: EdgeInsets.symmetric(horizontal: 6.0.w),
                            child: Card(
                              elevation: 4,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(40))),
                              child: Container(
                                  padding:
                                      EdgeInsets.symmetric(vertical: 2.0.w),
                                  child: Column(
                                    children: [
                                      Container(
                                        width: 10.0.w,
                                        height: 1.0.w,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: Colors.black26),
                                      ),
                                      SizedBox(
                                        height: 4.0.w,
                                      ),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 2.0.w),
                                        child: Row(
                                          children: [
                                            buildBottomMenu(
                                                imageAsset:
                                                    'assets/images/logo/goride.png',
                                                title: 'GoRide'),
                                            buildBottomMenu(
                                                imageAsset:
                                                    'assets/images/logo/gocar.png',
                                                title: 'GoCar'),
                                            buildBottomMenu(
                                                imageAsset:
                                                    'assets/images/logo/gofood.png',
                                                title: 'GoFood'),
                                            buildBottomMenu(
                                                imageAsset:
                                                    'assets/images/logo/gotagihan.png',
                                                title: 'GoTagihan')
                                          ],
                                        ),
                                      )
                                    ],
                                  )),
                            )),
                      );
                    })
              ],
            ),
            buildComingSoon(),
          ],
        )
      ],
    );
  }
}
