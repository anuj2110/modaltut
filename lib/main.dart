import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _selectedItem = '';

  void _onButtonPressed(){
      showModalBottomSheet(context: context,builder: (context){
        return Container(
          color: Color(0xFF737373),
          height: 180.0,
          child: Container(
            child: _BottomNavigation(),
            decoration: BoxDecoration(
              color: Theme.of(context).canvasColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0),
                 
              ),
            ),
          ),
        );
      });
    }
    Column _BottomNavigation(){
      return Column(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.ac_unit),
              title: Text("Cooling"),
              onTap: ()=> _selectItem('Cooling'),
            ),
            ListTile(
              leading: Icon(Icons.accessibility_new),
              title: Text("People"),
              onTap: ()=> _selectItem('People'),
            ),
            ListTile(
              leading: Icon(Icons.assessment),
              title: Text("Stats"),
              onTap: ()=> _selectItem('Stats'),
            ),
          ],
        );
    }
    void _selectItem(String str){
      Navigator.pop(context);
      setState(() {
        _selectedItem = str;
      });
    }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text("Show"),
              onPressed: ()=>_onButtonPressed() ,
            ),
            Text(
              _selectedItem,
              style:TextStyle(fontSize: 30.0),
            )
          ],
        ),),
    );
  }
}