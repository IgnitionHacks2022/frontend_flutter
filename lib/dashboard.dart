import 'package:flutter/material.dart';
import 'reqs.dart';
import 'main.dart';

class Dashboard extends StatefulWidget{
    final Session session;
    const Dashboard({Key? key, required this.session}) : super(key:key);
    @override
    State<Dashboard> createState() => _DashboardState();
}
class _DashboardState extends State<Dashboard> {
    @override
    Widget build(BuildContext context){
        return Scaffold(
      appBar: AppBar(
          title: Text("Dashboard"),
          leading: Builder(
              builder: (context){
                  return IconButton(
                      icon: Icon(Icons.person),
                      onPressed: ()=>Scaffold.of(context).openDrawer(),
                      );
              }
          ),
      ),
      body: const Center(
        child: Text('My Page!'),
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            SizedBox(
                height: 400,
                child:DrawerHeader(
                padding: EdgeInsets.fromLTRB(20,50,20,0),
              decoration: BoxDecoration(
                color: Colors.greenAccent,
              ),
              child: Stack(
  children: <Widget>[
    Card(
      margin: const EdgeInsets.only(top: 210),
      child: SizedBox(
          height: 50,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  widget.session.name,
                ),
              ],
            ),
          )),
    ),
    Positioned(
      top: .0,
      left: .0,
      right: .0,
      child: Center(
        child: CircleAvatar(
          radius: 100,
          backgroundImage: NetworkImage("https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png")
        ),
      ),
    )
  ],
),
              )),
            ListTile(
                leading: Icon(Icons.email),
                
                
              title: Text(widget.session.email),
              
            ),
            ListTile(
                leading: Icon(Icons.bluetooth),
              title: Text(widget.session.bluetoothId),
            ),
            ListTile(
                leading: Icon(Icons.logout),
                title: Text("Logout"),
                onTap: (){
                    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>HomePage()), (Route<dynamic> route) => false);
                }
            )
          ],
        ),
      ),
    );
    }
}
