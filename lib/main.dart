import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/ALLPRACTISE.dart';
import 'package:untitled/Provider/ALLPROVIDER.dart';
import 'package:untitled/Provider/FavouriteProvider.dart';
import 'package:untitled/Provider/LoginProvider.dart';
import 'package:untitled/Provider/SliderProvider.dart';
import 'package:untitled/Provider/favprovider.dart';
import 'package:untitled/Screens/StateFulScreen.dart';
import 'Provider/CounterProvider.dart';
void  main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_)=>CounterProvider()),
          ChangeNotifierProvider(create: (_)=>SecondProvider()),
          ChangeNotifierProvider(create: (_)=>FavouriteProvider()),
          ChangeNotifierProvider(create: (_)=>LoginProvider()),
          ChangeNotifierProvider(create: (_)=>AllProvider()),
          ChangeNotifierProvider(create: (_)=>Fvaourite())
        ],
        child: MaterialApp(
            home: ALLPACTISESCREEN(),
        ),);
  }
}
