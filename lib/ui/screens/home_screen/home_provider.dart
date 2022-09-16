import 'package:flutter/material.dart';
import 'package:meeja/core/enums/item_type.dart';
import 'package:meeja/core/models/item_details_model.dart';
import 'package:meeja/core/services/database_services.dart';
import 'package:meeja/core/services/database_storage_services.dart';

import '../../../constants.dart';

class HomeProvider extends ChangeNotifier{

  int value = 1;

  ItemType selectedFilter = ItemType.all;


  List<ItemDetails> items = kExampleItems;

  List<String> voices = [];

  DatabaseStorageServices databaseStorageServices = DatabaseStorageServices();
  DatabaseServices databaseServices = DatabaseServices();


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




  getValue(int x){
    value = x;
    notifyListeners();
  }


}