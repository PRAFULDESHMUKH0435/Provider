import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Provider/FavouriteProvider.dart';
class MyFav extends StatelessWidget {
  const MyFav({super.key});


  @override
  Widget build(BuildContext context) {
    final favprovider =Provider.of<FavouriteProvider>(context);
    List mylist = favprovider.list;
    return Scaffold(
      backgroundColor: Colors.green,
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: mylist.length,
                itemBuilder: (context,index){
                   return Consumer<FavouriteProvider>(
                     builder: (context,child,value){
                       return ListTile(
                         title: Text("Item ${mylist[index]}"),
                         trailing: Icon(Icons.favorite,color: Colors.red,),
                         onTap: (){
                           favprovider.removeitem(index);
                         },
                       );
                     },
                   );
                }),
          ),
        ],
      ),
    );
  }
}
