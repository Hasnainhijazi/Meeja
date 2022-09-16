import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:meeja/constants.dart';
import 'package:meeja/ui/custom_widgets/custom_button.dart';
import 'package:meeja/ui/custom_widgets/item.dart';
import 'package:meeja/ui/screens/home_screen/home_provider.dart';
import 'package:provider/provider.dart';

import '../../../core/enums/item_type.dart';
import '../../custom_widgets/custom_app_bar.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeProvider(),
      child: Consumer<HomeProvider>(
        builder: (context, model, child) => Scaffold(
          appBar: CustomAppBar(),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 17.h),

                // filters
                SingleChildScrollView(
                  padding: EdgeInsets.only(left: 8.w, bottom: 10.h),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomButton(
                        onPressed: () => model.onFilterChanged(1),
                        text: 'All',
                        color: (model.selectedFilter == ItemType.all)
                            ? kPrimaryColor
                            : kGrey3Color,
                        textColor: (model.selectedFilter == ItemType.all)
                            ? Colors.white
                            : kGrey1Color,
                      ),
                      CustomButton(
                        onPressed: () => model.onFilterChanged(2),
                        text: 'TV Shows',
                        color: (model.selectedFilter == ItemType.tvShow)
                            ? kPrimaryColor
                            : kGrey3Color,
                        textColor: (model.selectedFilter == ItemType.tvShow)
                            ? Colors.white
                            : kGrey1Color,
                      ),
                      CustomButton(
                          onPressed: () => model.onFilterChanged(3),
                          text: 'Movies',
                          color: (model.selectedFilter == ItemType.movie)
                              ? kPrimaryColor
                              : kGrey3Color,
                        textColor: (model.selectedFilter == ItemType.movie)
                            ? Colors.white
                            : kGrey1Color,
                      ),

                      CustomButton(
                          onPressed: () => model.onFilterChanged(4),
                          text: 'Books',
                          color: (model.selectedFilter == ItemType.book)
                              ? kPrimaryColor
                              : kGrey3Color,
                        textColor: (model.selectedFilter == ItemType.book)
                            ? Colors.white
                            : kGrey1Color,
                      ),
                    ],
                  ),
                ),

                // sort
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: 24.h,
                      padding:
                          EdgeInsets.symmetric(horizontal: 11.w, vertical: 3.h),
                      margin: EdgeInsets.only(right: 21.w),
                      decoration: BoxDecoration(
                        color: kGrey3Color,
                        borderRadius: BorderRadius.all(Radius.circular(30.r)),
                      ),
                      child: Row(
                        children: [
                          Text(
                            'Latest',
                            style: TextStyle(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w400,
                                color: kGrey1Color),
                          ),
                          SizedBox(width: 7.w),
                          Icon(
                            IconlyLight.arrow_down_2,
                            color: kPrimaryColor,
                            size: 10,
                          )
                        ],
                      ),
                    ),
                  ],
                ),

                Column(
                  children: List.generate(
                      model.items.length, (index) => Item(item:model.items[index],filter:model.selectedFilter,showCurrentUsers: true),
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
