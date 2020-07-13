import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(title: Text('List'),),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            makeButton(title: 'DataTable',onTap:()=>Navigator.pushNamed(context, '/DataTable')),
          ],
        ),
      ), 
    );
  }

  Widget makeButton({title,onTap}){
    return Center(
      child: FlatButton(
        onPressed: onTap,
        textColor: Color(0xFFff0033),
        child: Text(title??'title',style: TextStyle(fontSize: 18),),
      ),
    );
  }
}
