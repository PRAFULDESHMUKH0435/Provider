import 'package:flutter/foundation.dart';
class CounterProvider with ChangeNotifier{
  int count =10;
  void IncrementCount(){
    count++;
    notifyListeners();
  }
}