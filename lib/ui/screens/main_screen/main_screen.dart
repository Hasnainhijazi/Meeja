import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meeja/constants.dart';
import 'package:meeja/ui/custom_widgets/custom_icon_button.dart';
import 'package:meeja/ui/screens/main_screen/main_provider.dart';
import 'package:provider/provider.dart';
import 'package:iconly/iconly.dart';

class MainScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MainProvider(),
      child: Consumer<MainProvider>(
        builder: (context,model,child) =>Scaffold(

          body: model.pages[model.pageIndex],

          bottomNavigationBar: Container(
            alignment: Alignment.bottomCenter,
            height: 84.h,
            width: double.infinity.w,
            decoration: BoxDecoration(
              color: kGrey3Color,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Expanded(
                  child: CustomIconButton(
                    title: 'Home',
                    icon: model.pageIndex == 0 ? IconlyBold.home : IconlyLight.home,
                    onPressed: model.gotoHome,
                    isSelected: model.pageIndex == 0,
                  ),
                ),

                Expanded(
                  child: CustomIconButton(
                    title: 'Search',
                    icon: model.pageIndex == 1 ? IconlyBold.search : IconlyLight.search,
                    onPressed: model.gotoSearch,
                    isSelected: model.pageIndex == 1,
                  ),
                ),

                Expanded(
                  child: CustomIconButton(
                    title: 'Chat',
                    icon: model.pageIndex == 2 ? IconlyBold.more_circle : IconlyLight.more_circle,
                    onPressed: model.gotoChat,
                    isSelected: model.pageIndex == 2,
                  ),
                ),

                Expanded(
                  child: CustomIconButton(
                    title: 'Connections',
                    icon: model.pageIndex == 3 ? IconlyBold.user_3 : IconlyLight.user_1,
                    onPressed: model.gotoConnections,
                    isSelected: model.pageIndex == 3,
                  ),
                ),

                Expanded(
                  child: CustomIconButton(
                    title: 'Profile',
                    icon: model.pageIndex == 4 ? IconlyBold.profile : IconlyLight.profile,
                    onPressed: model.gotoProfile,
                    isSelected: model.pageIndex == 4,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
