import 'package:flutter/material.dart';
class StateLessWidgetScreen extends StatelessWidget {
   StateLessWidgetScreen({super.key});


  ValueNotifier<int> _counter = ValueNotifier<int>(0);
  ValueNotifier<bool> _ishidden = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    print("BUILD");
    return Scaffold(
        appBar: AppBar(title: Text('Provider'),backgroundColor: Colors.orange),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ValueListenableBuilder(
              valueListenable: _ishidden,
              builder: (context,child,value){
                return TextFormField(
                  obscureText: _ishidden.value,
                  decoration:  InputDecoration(
                    hintText: 'Enter Password',
                    filled: true,
                    fillColor: Colors.green,
                    suffixIcon: IconButton(icon: _ishidden.value==true? Icon(Icons.visibility_off_outlined):Icon(Icons.visibility),onPressed: (){
                      _ishidden.value=!_ishidden.value;
                      print(_ishidden.value);
                    }),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                        borderSide: BorderSide(color: Colors.white)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                        borderSide: BorderSide(color: Colors.white)
                    ),

                  ),
                );
              }),
          ValueListenableBuilder(
              valueListenable: _counter,
              builder: (context,child,value){
                return Text(_counter.value.toString(),style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),);
          })
        ],
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          _counter.value++;
          print(_counter.value);
        },
      ),
    );
  }
}


