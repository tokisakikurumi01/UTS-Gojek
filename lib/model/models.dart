class RestaurantModel {
  String name;
  double distanceInKM;
  int estimateTime;
  double rate;
  String restaurantCover;
  String discount;
  String categories;
  int priceTag;
  bool promotion;
  bool verified;
  bool recommended;

  RestaurantModel(
      {this.name,
      this.distanceInKM,
      this.estimateTime,
      this.rate,
      this.restaurantCover,
      this.discount,
      this.categories,
      this.priceTag,
      this.promotion,
      this.verified,
      this.recommended});
}

class FoodModel {
  String title;
  List<Menu> menu = [];

  FoodModel({this.title, this.menu});
}

class Menu {
  String title;
  String desc;
  String imageAsset;
  String price;
  String discountPrice;

  Menu(
      {this.title, this.desc, this.imageAsset, this.price, this.discountPrice});
}

List<FoodModel> foodMenuDummy = [
  FoodModel(title: 'Buy 1 Get 1 Free #DiRumahAja', menu: [
    Menu(
        title: 'Buy 1 get 1 free single scoop - Jajan Seru',
        desc: 'Buy 1 get 1 free Maksimal 1 rasa',
        price: "65.000",
        discountPrice: "130.000",
        imageAsset: 'assets/images/illustration/download (1).jpeg'),
    Menu(
        title: 'Buy 1 get 1 free value scoop - Jajan Seru',
        desc: 'Buy 1 get 1 free ukuran per 1 cup 4oz Maksimal 1 rasa',
        price: "85.000",
        discountPrice: "170.000",
        imageAsset: 'assets/images/illustration/download (1).jpeg')
  ]),
  FoodModel(title: 'Sundae', menu: [
    Menu(
        title: '2 Scoop Sundae',
        desc:
            'Chocolate, Vanilla, Very Berry, Strawberry, Mint Chocolate Chip, Jamoca Almond Fudge',
        price: "99.000",
        imageAsset: 'assets/images/illustration/download (1).jpeg'),
    Menu(
        title: '3 Scoop Sundae',
        desc:
            'Chocolate, Vanilla, Very Berry, Strawberry, Mint Chocolate Chip, Jamoca Almond Fudge',
        price: "120.000",
        imageAsset: 'assets/images/illustration/download (1).jpeg'),
  ])
];

List<RestaurantModel> discountRestaurantDummyData = [
  RestaurantModel(
      name: 'Baskin Robbins, Central Park Lower Ground',
      discount: '67k off',
      distanceInKM: 1.18,
      restaurantCover: 'assets/images/illustration/download.jpeg'),
  RestaurantModel(
      name: 'The Duck King, Central Park',
      discount: '66k off',
      distanceInKM: 1.18,
      restaurantCover: 'assets/images/illustration/download (2).jpeg'),
  RestaurantModel(
      name: 'Sushi G0!, Central Park',
      discount: '100k off',
      distanceInKM: 1.18,
      restaurantCover: 'assets/images/illustration/download (5).jpeg')
];

List<RestaurantModel> nearbyRestaurantDummyData = [
  RestaurantModel(
      name: 'Baskin Robbins, Central Park Lower Ground',
      discount: '67k off',
      categories: 'Snack, Ice Cream',
      estimateTime: 15,
      distanceInKM: 1.18,
      rate: 4.8,
      priceTag: 2,
      recommended: true,
      promotion: true,
      restaurantCover: 'assets/images/illustration/download.jpeg'),
  RestaurantModel(
      name: 'The Duck King, Central Park',
      discount: '67k off',
      categories: 'Chicken & duck',
      estimateTime: 30,
      distanceInKM: 1.18,
      rate: 4.7,
      priceTag: 3,
      recommended: false,
      promotion: true,
      restaurantCover: 'assets/images/illustration/download (2).jpeg'),
  RestaurantModel(
      name: 'Sushi Go! Central Park',
      discount: '67k off',
      categories: 'Japanese',
      estimateTime: 45,
      distanceInKM: 1.18,
      rate: 4.6,
      priceTag: 3,
      recommended: true,
      promotion: false,
      restaurantCover: 'assets/images/illustration/download (5).jpeg')
];

List<RestaurantModel> topRatedRestaurantDummyData = [
  RestaurantModel(
      name: 'Burger King, Cideng',
      distanceInKM: 2.5,
      rate: 4.6,
      restaurantCover: 'assets/images/illustration/download (3).jpeg'),
  RestaurantModel(
      name: 'Family Mart, Tanjung Duren',
      distanceInKM: 0.5,
      rate: 4.8,
      restaurantCover: 'assets/images/illustration/download (4).jpeg'),
  RestaurantModel(
      name: 'Foodsomnia',
      distanceInKM: 1.18,
      rate: 4.5,
      restaurantCover: 'assets/images/illustration/download (6).jpeg')
];
