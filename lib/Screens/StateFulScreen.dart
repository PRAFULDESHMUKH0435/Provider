import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:untitled/Provider/LoginProvider.dart';
class StateFulScreen extends StatefulWidget {
  const StateFulScreen({super.key});

  @override
  State<StateFulScreen> createState() => _StateFulScreenState();
}

class _StateFulScreenState extends State<StateFulScreen> {

  final _emailcontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();
  ValueNotifier<bool> _ishidden = ValueNotifier<bool>(true);


  @override
  Widget build(BuildContext context) {

    final loginprovider = Provider.of<LoginProvider>(context);

    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(title: Text('Provider'),backgroundColor: Colors.orange),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 12.0,vertical: 5.0),
            child: TextFormField(
              controller: _emailcontroller,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: 'enter Email',
                suffixIcon: Icon(Icons.email),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                  borderSide: BorderSide(color: Colors.white)
                ),
                 focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                  borderSide: BorderSide(color: Colors.white)
                ),

              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 12.0,vertical: 5.0),
            child: ValueListenableBuilder(
              valueListenable: _ishidden,
              builder: (context,child,value){
                return TextFormField(
                  controller: _passwordcontroller,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: _ishidden.value,
                  decoration: InputDecoration(
                    hintText: 'enter Password',
                    suffixIcon: IconButton(icon:_ishidden.value==true?  Icon(Icons.visibility_off_outlined):Icon(Icons.visibility),onPressed: (){
                      _ishidden.value=!_ishidden.value;
                    },),
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
              },
            ),
          ),
          ElevatedButton(
              onPressed: (){
                loginprovider.ShowLoading(true);
               loginprovider.SaveUserCreds(_emailcontroller.text.toString(),_passwordcontroller.text.toString());
              }, child: Text('Login'))
        ],
      ),
    );
  }
}
