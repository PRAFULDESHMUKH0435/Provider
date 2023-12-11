import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/Provider/CounterProvider.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final counterprovider = Provider.of<CounterProvider>(context,listen: false);
    print("BUILD METHOD");
    return Scaffold(
      appBar: AppBar(title: Text('Provider'),backgroundColor: Colors.orange,),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Consumer<CounterProvider>(
            builder: (context,child,value){
              return Text(counterprovider.count.toString(),style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),);
            },
          ))
        ],
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          counterprovider.IncrementCount();
        },
      ),
    );
  }
}
