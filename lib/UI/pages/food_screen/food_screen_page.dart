part of '../pages.dart';

class FoodMainPage extends StatefulWidget {
  FoodMainPage({Key key}) : super(key: key);

  @override
  _FoodMainPageState createState() => _FoodMainPageState();
}

class _FoodMainPageState extends State<FoodMainPage> {
  int _selectedPage = 0; // to keep track of active tab index
  final List<Widget> pageList = [
    FoodPageMain(),
    ComingSoonPage(),
    ComingSoonPage(),
    ComingSoonPage(),
    ComingSoonPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: PreferredSize(
        preferredSize: Size.fromHeight(10.0.h),
        child: IndexedStack(
          index: _selectedPage,
          children: pageList,
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 10,
        child: Container(height: 10.0.h, child: buildNavigator()),
      ),
    ));
  }

  Widget buildNavigator() {
    Widget buildNavigatorData(int indexPage, String title,
        {String assetOn, String assetOff}) {
      return Flexible(
          flex: 1,
          child: GestureDetector(
            onTap: () {
              setState(() {
                _selectedPage = indexPage;
              });
            },
            child: Container(
                height: 10.0.h,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        width: 5.0.h,
                        height: 5.0.h,
                        child: Image.asset(
                            indexPage == _selectedPage ? assetOn : assetOff)),
                    Text(title,
                        style: TextStyle(
                            fontSize: 10.0.sp,
                            color: Colors.black87,
                            fontWeight: indexPage == _selectedPage
                                ? FontWeight.bold
                                : FontWeight.normal))
                  ],
                )),
          ));
    }

    return Row(
      children: [
        buildNavigatorData(0, 'Explore',
            assetOff: 'assets/icons/food_menu_1_off.png',
            assetOn: 'assets/icons/food_menu_1_on.png'),
        buildNavigatorData(1, 'Pickup',
            assetOff: 'assets/icons/food_menu_2_off.png',
            assetOn: 'assets/icons/food_menu_2_on.png'),
        buildNavigatorData(2, 'Search',
            assetOff: 'assets/icons/food_menu_3_off.png',
            assetOn: 'assets/icons/food_menu_3_on.png'),
        buildNavigatorData(3, 'Promos',
            assetOff: 'assets/icons/food_menu_4_off.png',
            assetOn: 'assets/icons/food_menu_4_on.png'),
        buildNavigatorData(4, 'History',
            assetOff: 'assets/icons/food_menu_5_off.png',
            assetOn: 'assets/icons/food_menu_5_on.png')
      ],
    );
  }
}
