import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/Provider/FavouriteProvider.dart';
import 'package:untitled/Provider/SliderProvider.dart';
import 'package:untitled/Screens/FavouriteScreen.dart';
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
        ],
        child: MaterialApp(
            home: FavouriteScreen(),
        ),);
  }
}
