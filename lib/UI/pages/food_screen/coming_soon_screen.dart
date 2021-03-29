part of '../pages.dart';

class ComingSoonPage extends StatelessWidget {
  const ComingSoonPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
            width: 100.0.w,
            height: 50.0.w,
            child: Image(image: AssetImage(AssetValue.comingSoonIllustration))),
        SizedBox(height: 3.0.w),
        Text('Coming Soon',
            style: TextStyle(
                fontSize: 20.0.sp,
                color: Colors.green,
                fontWeight: FontWeight.bold))
      ],
    )));
  }
}
