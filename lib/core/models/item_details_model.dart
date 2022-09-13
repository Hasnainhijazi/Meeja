import 'package:meeja/core/enums/item_type.dart';
import 'package:meeja/core/models/review_model.dart';
import 'package:meeja/core/models/user_details.dart';

class ItemDetails{
  ItemType type;
  String title;
  String author;
  String? description;
  String filePath;
  int rating;
  List<User>? usersRead = [];
  List<Review>? reviews = [];
  List<User> currentlyReading = [];

  ItemDetails({
    required this.filePath,
    required this.title,
    required this.author,
    this.description,
    this.reviews,
    this.usersRead,
    required this.currentlyReading,
    required this.type,
    required this.rating
  });
}