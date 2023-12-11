import 'package:flutter/foundation.dart';
class SecondProvider with ChangeNotifier{

  double _value =0.5;
  double get value =>_value;

  void ChangeOpactiy(double val){
    _value=val;
    notifyListeners();
  }
}