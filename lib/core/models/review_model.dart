import 'package:meeja/core/models/user_details.dart';

class Review{
  final String value;
  final String reviewText;
  final String time;
  final User reviewer;

  Review({required this.time,required this.value, required this.reviewText, required this.reviewer});
}