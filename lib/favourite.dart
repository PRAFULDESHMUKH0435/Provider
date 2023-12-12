import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Provider/favprovider.dart';
class Favourite extends StatelessWidget {
  const Favourite({super.key});

  @override
  Widget build(BuildContext context) {
    final listpro = Provider.of<Fvaourite>(context);
    return Scaffold(
      body: Container(
         child: Expanded(
            child: ListView.builder(
                itemCount: listpro.favlist.length,
                itemBuilder: (context,index){
                  return ListTile(
                    title: Text('Item ${listpro.favlist[index]}'),
                    trailing: Icon(Icons.favorite,color: Colors.red,),
                  );
                }),
          )
      ),
    );
  }
}
