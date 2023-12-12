import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/Provider/ALLPROVIDER.dart';
import 'package:untitled/Provider/SliderProvider.dart';
import 'package:untitled/favourite.dart';

import 'Provider/favprovider.dart';

class ALLPACTISESCREEN extends StatelessWidget {
  const ALLPACTISESCREEN({super.key});

  @override
  Widget build(BuildContext context) {
    print("BUILD");
    final allprovider = Provider.of<AllProvider>(context,listen: false);
    final fav = Provider.of<Fvaourite>(context);
    return Scaffold(
      appBar: AppBar(title: Text('ALL PRACTISE'),backgroundColor: Colors.orange,actions: [
        IconButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Favourite()));
        }, icon: Icon(Icons.favorite,color: Colors.red,))
      ],),
      body: Center(
        child: Column(
         children: [
           Consumer<AllProvider>(
               builder: (context,child,value){
                 print("only this");
                 return Text(allprovider.count.toString(),style: TextStyle(fontSize: 30),);
               }),
           Consumer<AllProvider>(builder: (context,child,value){
             return Slider(
                 value: allprovider.slidervalue,
                 onChanged: (newvalue){
                   print(newvalue);
                   allprovider.IncreseSliderValue(newvalue);
                 });
           }),
           Consumer<AllProvider>(builder: (context,child,value){
             return Container(
               margin: EdgeInsets.symmetric(horizontal: 15.0,vertical: 5.0),
               height: 50,
               width: double.infinity,
               color: Colors.green.withOpacity(allprovider.slidervalue),
             );
           }),
           Expanded(
             child: ListView.builder(
                 itemCount: 25,
                 itemBuilder: (context,index){
                   return Consumer(builder: (context,child,value){
                     return  ListTile(
                       title: Text('Index ${index+1}'),
                       trailing: IconButton(
                         icon: Icon(fav.favlist.contains(index)?Icons.favorite_outlined: Icons.favorite_outline),
                         onPressed: (){
                           fav.AddToFav(index);
                         },
                       ),
                     );
                   });
                 }),
           )
         ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          allprovider.IncrementCounter();
        },
      ),
    );
  }
}

