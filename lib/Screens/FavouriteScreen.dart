import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/Provider/FavouriteProvider.dart';

import 'myfav.dart';
class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    print("BUILD");
    final favprovider =Provider.of<FavouriteProvider>(context,listen: false);
    return Scaffold(
      appBar: AppBar(title: Text('Provider'),backgroundColor: Colors.orange,actions: [
        IconButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>MyFav()));
        }, icon: Icon(Icons.favorite))
      ],),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: 25,
                itemBuilder: (context,index){
                  return Consumer<FavouriteProvider>(builder: (context,child,value){
                    return ListTile(
                      title: Text('Item ${index+1}'),
                      trailing:favprovider.list.contains(index+1)?Icon(Icons.favorite,color: Colors.red,):Icon(Icons.favorite_outline,),
                      onTap: (){
                        if(!favprovider.list.contains(index+1)){
                          favprovider.AddItemToFav(index+1);
                        }else{
                          print('ALREADY PRESENT');
                        }
                      },
                    );
                  });
                }),
          )
        ],
      ),
    );
  }
}
