import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class LoginProvider with ChangeNotifier{

  bool _isloading = false;
  void ShowLoading(bool val){
      _isloading=val;
      (_isloading){
        return Center(child: CircularProgressIndicator());
      };
      notifyListeners();
  }

  void SaveUserCreds(String email,String password) async{
    ShowLoading(true);
    final response = await post(Uri.parse('https://reqres.in/api/login'));

    if(response.statusCode==200){
      print("SUCCESS");
    }else{
      print("error with ${response.statusCode}");
    }
  }
}