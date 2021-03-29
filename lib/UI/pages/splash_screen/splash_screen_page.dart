part of '../pages.dart';

class SplashScreenPage extends StatefulWidget {
  SplashScreenPage({Key key}) : super(key: key);

  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    super.initState();
    _startTime();
  }

  _startTime() async {
    var _duration = new Duration(seconds: 2);
    return new Timer(_duration, _navigationPage);
  }

  _navigationPage() {
    Navigator.push(context, MaterialPageRoute(builder: (_) => HomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: buildContent(),
    );
  }

  Widget buildContent() {
    return Center(
        child: Container(
            width: 50.0.w,
            height: 50.0.w,
            child: Image(image: AssetImage(AssetValue.logoFull))));
  }
}
