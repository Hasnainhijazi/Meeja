import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import '../enums/view_State.dart';

class BaseViewModal extends ChangeNotifier{
  ViewState _state=ViewState.idle;
  ViewState get state => _state;

  void setState(ViewState state){
    _state = state;
    notifyListeners();
  }
}