import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/SliderProvider.dart';
class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  double value = 0.5;

  @override
  Widget build(BuildContext context) {
    print("BUILD");
    final secondprovider= Provider.of<SecondProvider>(context,listen: false);
    return Scaffold(
      appBar: AppBar(title: Text('Second Provider'),backgroundColor: Colors.orange,),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<SecondProvider>(builder: (context,child,value){
            print("ONLY SLIDER");
            return Slider(
                label: 'Range',
                thumbColor: Colors.pink,
                value: secondprovider.value,
                onChanged: (newvalue){
                  secondprovider.ChangeOpactiy(newvalue);
                });
          }),
         Consumer<SecondProvider>(builder: (context,child,value){
           print("ONLY CONTAINERS");
           return  Row(
             children: [
               Expanded(
                 child: Container(
                   margin: EdgeInsets.symmetric(horizontal: 5.0),
                   height: 80,
                   color: Colors.green.withOpacity(secondprovider.value),
                   child: Center(child: Text(double.parse(secondprovider.value.toString()).toString())),
                 ),
               ),
               Expanded(
                 child: Container(
                   margin: EdgeInsets.symmetric(horizontal: 5.0),
                   height: 80,
                   color: Colors.red.withOpacity(secondprovider.value),
                   child: Center(child: Text(double.parse(secondprovider.value.toString()).toString())),
                 ),
               ),
             ],
           );
         })
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){

        },
      ),
    );
  }
}
