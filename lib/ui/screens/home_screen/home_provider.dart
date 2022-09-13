import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meeja/core/enums/item_type.dart';
import 'package:meeja/core/models/item_details_model.dart';
import 'package:meeja/core/models/user_details.dart';
import 'package:meeja/ui/screens/item_details_screen/item_details_screen.dart';

import '../../../constants.dart';

class HomeProvider extends ChangeNotifier{

  ItemType selectedFilter = ItemType.all;

  List<ItemDetails> items = kExampleItems;

  void addItem(ItemDetails newItem){
    items.add(newItem);
    notifyListeners();
  }

  void onFilterChanged(int value){
    if(value == 1){
      selectedFilter = ItemType.all;
    }else if(value == 2){
      selectedFilter = ItemType.tvShow;
    }else if(value == 3){
      selectedFilter = ItemType.movie;
    }else if(value == 4){
      selectedFilter = ItemType.book;
    }
    notifyListeners();
  }
}