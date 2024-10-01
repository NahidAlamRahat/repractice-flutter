
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:repractice/tabber/alert_screen.dart';
import 'package:repractice/tabber/home_screen.dart';
import 'package:repractice/tabber/calculator.dart';
import 'package:repractice/tabber/message_screen.dart';

main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeActivity(),
      debugShowCheckedModeBanner: false,
    );
  }

}

class HomeActivity extends StatelessWidget {

  Mymessage(message, context) {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message))
    );
  } // myMessage end


  @override
  Widget build(BuildContext context) {

    final ButtonStyle buttonStyle = ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      minimumSize: Size(double.infinity, 40),
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
      fixedSize: Size.fromHeight(50),

    ); //=========buttonStyle end


    return DefaultTabController(
      length: 4,
      child:
      Scaffold(
        backgroundColor:Colors.white ,
        appBar: AppBar(
          title: Text('Repractice'),
          actions: [
            IconButton(onPressed: () {
              Mymessage("this is a commentBox", context);
            }, icon: Icon(Icons.comment)),
            IconButton(onPressed: () {
              Mymessage("this is a AddButton", context);
            }, icon: Icon(Icons.add))
          ],

          bottom: TabBar(tabs: [
            Icon(Icons.home),
            Icon(Icons.calculate),
            Icon(Icons.add_alert),
            Icon(Icons.message),
          ]),


        ),

        floatingActionButton: FloatingActionButton(
          elevation: 10,
          child: Icon(Icons.place),
          onPressed: () {
            Mymessage("this is a floatingActionButton", context);
          },
        ),

        bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
              BottomNavigationBarItem(
                icon: Icon(Icons.email), label: 'message',),

              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: 'profile'),
            ],

            onTap: (int index) {
              if (index == 0) {
                Mymessage('this is a home index 0', context);
              }

              if (index == 1) {


              }

              if (index == 2) {
                Mymessage('this is a profile index 2', context);
              }
            }

        ),

        drawer: Drawer(child: ListView(
          children: [
            DrawerHeader( // user profile

              padding: EdgeInsets.all(0),
              child: UserAccountsDrawerHeader(
                decoration:
                BoxDecoration(color: Colors.green),
                accountName: Text('nahid alam rahat'),
                accountEmail: Text('nahidalam007@gmail.com'),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://images.pexels.com/photos/771742/pexels-photo-771742.jpeg"),
                ),
              ),
            ), //// user profile end

            ListTile(leading: Icon(Icons.call),
              title: Text('0164606799'),
              onTap: () {},),
            ListTile(leading: Icon(Icons.message), title: Text('text me'),),


          ],

        )
        ),

        body: TabBarView(
            children: [
              HomeScreen(),
              Calculator(),
              AlertScreen(),
              MessageScreen(),
            ] // Children End

        ),

      ),

    );
  }

} // HomeActivity End

