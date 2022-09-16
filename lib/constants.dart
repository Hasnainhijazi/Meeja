import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meeja/core/models/item_details_model.dart';
import 'package:meeja/core/models/review_model.dart';
import 'package:meeja/core/models/user_details.dart';

import 'core/enums/item_type.dart';

Color kPrimaryColor = Color(0xffED5E3D);
Color kBlackColor = Color(0xff1F120F);
Color kGrey1Color = Color(0xff968E8C);
Color kGrey2Color = Color(0xffE7DEDC);
Color kGrey3Color = Color(0xffFEF6F5);

String kFontFamily = 'Times-New-Roman';

String kImagesPath = 'assets/images';

List<ItemDetails> kExampleItems = [
  ItemDetails(
    reviews: [
      Review(
        value: 'Good',
        reviewText: 'I love this book. The book is very funny to read.',
        reviewer: User(name: 'John', profile: '$kImagesPath/john.png'),
        time: '16/3/2022'
      ),
      Review(
        value: 'Good',
        reviewText: 'I love this book. The book is very funny to read.',
        reviewer: User(name: 'John', profile: '$kImagesPath/john.png'),
        time: '16/3/2022'
      ),
      Review(
        value: 'Good',
        reviewText: 'I love this book. The book is very funny to read.',
        reviewer: User(name: 'John', profile: '$kImagesPath/john.png'),
        time: '16/3/2022'
      ),
    ],
      filePath: '$kImagesPath/tv_show.png',
      title: 'Amet minim mollit',
      author: 'Hasnain',
      description: 'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit...',
      currentlyReading: [
        User(name: 'John', profile: 'assets/images/john.png'),
        User(name: 'John', profile: 'assets/images/john.png'),
      ],
      usersRead: [
        User(name: 'John', profile: 'assets/images/john.png'),
        User(name: 'John', profile: 'assets/images/john.png'),
        User(name: 'John', profile: 'assets/images/john.png'),
        User(name: 'John', profile: 'assets/images/john.png'),
        User(name: 'John', profile: 'assets/images/john.png'),
        User(name: 'John', profile: 'assets/images/john.png'),
        User(name: 'John', profile: 'assets/images/john.png'),
        User(name: 'John', profile: 'assets/images/john.png'),
        User(name: 'John', profile: 'assets/images/john.png'),
        User(name: 'John', profile: 'assets/images/john.png'),
        User(name: 'John', profile: 'assets/images/john.png'),
        User(name: 'John', profile: 'assets/images/john.png'),
        User(name: 'John', profile: 'assets/images/john.png'),
        User(name: 'John', profile: 'assets/images/john.png'),
        User(name: 'John', profile: 'assets/images/john.png'),
        User(name: 'John', profile: 'assets/images/john.png'),
        User(name: 'John', profile: 'assets/images/john.png'),
      ],
      type: ItemType.tvShow,
      rating: 100),

  ItemDetails(
      filePath: '$kImagesPath/book.png',
      title: 'The Psychology of money',
      author: 'Morgan Housel',
      description: 'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit...',
      currentlyReading: [
        User(name: 'John', profile: 'assets/images/john.png'),
        User(name: 'John', profile: 'assets/images/john.png'),
      ],
      type: ItemType.book,
      rating: 100),

  ItemDetails(
      reviews: [
        Review(
            value: 'Good',
            reviewText: 'I love this book. The book is very funny to read.',
            reviewer: User(name: 'John', profile: '$kImagesPath/john.png'),
            time: '16/3/2022'
        ),
        Review(
            value: 'Good',
            reviewText: 'I love this book. The book is very funny to read.',
            reviewer: User(name: 'John', profile: '$kImagesPath/john.png'),
            time: '16/3/2022'
        ),
        Review(
            value: 'Good',
            reviewText: 'I love this book. The book is very funny to read.',
            reviewer: User(name: 'John', profile: '$kImagesPath/john.png'),
            time: '16/3/2022'
        ),
      ],
      filePath: '$kImagesPath/tv_show.png',
      title: 'Amet minim mollit',
      author: 'Hasnain',
      description: 'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit...',
      currentlyReading: [
        User(name: 'John', profile: 'assets/images/john.png'),
        User(name: 'John', profile: 'assets/images/john.png'),
      ],
      usersRead: [
        User(name: 'John', profile: 'assets/images/john.png'),
        User(name: 'John', profile: 'assets/images/john.png'),
        User(name: 'John', profile: 'assets/images/john.png'),
        User(name: 'John', profile: 'assets/images/john.png'),
        User(name: 'John', profile: 'assets/images/john.png'),
        User(name: 'John', profile: 'assets/images/john.png'),
        User(name: 'John', profile: 'assets/images/john.png'),
        User(name: 'John', profile: 'assets/images/john.png'),
        User(name: 'John', profile: 'assets/images/john.png'),
        User(name: 'John', profile: 'assets/images/john.png'),
        User(name: 'John', profile: 'assets/images/john.png'),
        User(name: 'John', profile: 'assets/images/john.png'),
        User(name: 'John', profile: 'assets/images/john.png'),
        User(name: 'John', profile: 'assets/images/john.png'),
        User(name: 'John', profile: 'assets/images/john.png'),
        User(name: 'John', profile: 'assets/images/john.png'),
        User(name: 'John', profile: 'assets/images/john.png'),
      ],
      type: ItemType.movie,
      rating: 100),

  ItemDetails(
      filePath: '$kImagesPath/book.png',
      title: 'The Psychology of money',
      author: 'Morgan Housel',
      description: 'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit...',
      currentlyReading: [
        User(name: 'John', profile: 'assets/images/john.png'),
        User(name: 'John', profile: 'assets/images/john.png'),
      ],
      type: ItemType.book,
      rating: 100),
];

final textFiledContainerStyle = BoxDecoration(
  color: Colors.grey[300],
  borderRadius: BorderRadius.all(Radius.circular(30)),
  boxShadow: [
    BoxShadow(
      color: Colors.grey.withOpacity(0.3),
      spreadRadius: 2,
      blurRadius: 3,
      offset: Offset(0, 2),
    ),
  ],
);


TextStyle kAppBarTextStyle = TextStyle(
  fontWeight: FontWeight.w700,
  fontSize: 26.sp,
  color: kBlackColor,
);

BoxShadow kBoxShadow = BoxShadow(
  color: Color(0xff000000).withOpacity(0.07),
  blurRadius: 24.r,
  spreadRadius: 0.5,
  offset: Offset(0, 4),
);

BorderRadius kCircular16 = BorderRadius.all(Radius.circular(16.r));

BorderRadius kCircular26 = BorderRadius.all(Radius.circular(26.r));

BorderRadius kCircular30 = BorderRadius.all(Radius.circular(30.r));

BorderRadius kCircular20 = BorderRadius.all(Radius.circular(20.r));

final kTextFiledContainerStyle = BoxDecoration(
  color: Colors.grey[300],
  borderRadius: BorderRadius.circular(7),
  boxShadow: [
    BoxShadow(
      color: Colors.grey.withOpacity(0.3),
      spreadRadius: 2,
      blurRadius: 3,
      offset: Offset(0, 2),
    ),
  ],
);

final kTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 20.h),
  hintText: 'Your feedback',
  border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(7), borderSide: BorderSide.none),
);
