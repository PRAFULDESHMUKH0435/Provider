import 'package:flutter/foundation.dart';
class AllProvider with ChangeNotifier{
  int count =0;
  double slidervalue =0.5;
  void IncrementCounter(){
    count++;
    notifyListeners();
  }

  void IncreseSliderValue(double val){
    slidervalue=val;
    notifyListeners();
  }
}