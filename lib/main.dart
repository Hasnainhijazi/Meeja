import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:meeja/constants.dart';
import 'package:meeja/ui/locator.dart';
import 'package:meeja/ui/screens/profile_screens/profile_provider.dart';
import 'package:meeja/ui/screens/splash_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  await ScreenUtil.ensureScreenSize();
  await Firebase.initializeApp();
  await setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {


    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ProfileProvider>(
          create: (context) => ProfileProvider(),
        ),
      ],
      child: GetMaterialApp(
        title: 'Meeja',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: kFontFamily
        ),
        home: ScreenUtilInit(
          builder: (BuildContext context,child) => SplashScreen(),
          designSize: Size(414,896),
          minTextAdapt: true,
          splitScreenMode: true,
        ),
      ),
    );
  }
}
