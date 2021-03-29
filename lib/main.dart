import 'package:flutter/material.dart';
import 'package:gojek/UI/pages/pages.dart';
import 'package:gojek/shared/library/size_helper/sizer_util.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      //return LayoutBuilder
      builder: (context, constraints) {
        return OrientationBuilder(
          //return OrientationBuilder
          builder: (context, orientation) {
            //initialize SizerUtil()
            SizerUtil().init(constraints, orientation); //initialize SizerUtil
            return MaterialApp(
                debugShowCheckedModeBanner: false, home: SplashScreenPage());
          },
        );
      },
    );
  }
}
