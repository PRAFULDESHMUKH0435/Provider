import 'package:flutter/foundation.dart';
class Fvaourite with ChangeNotifier{
  List favlist =[];

  void AddToFav(int index){
    favlist.add(index);
    notifyListeners();
  }
}