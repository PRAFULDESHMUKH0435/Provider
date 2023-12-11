import 'package:flutter/foundation.dart';
class FavouriteProvider with ChangeNotifier{
  List list=[];

  void AddItemToFav(int idx){
    list.sort();
    list.add(idx);
    print(list);
    notifyListeners();
  }

  bool ispresent(int idx){
    if(list.contains(idx)){
      return true;
    }
    return false;
  }

  void removeitem(int index){
    list.removeAt(index);
    notifyListeners();
  }
}