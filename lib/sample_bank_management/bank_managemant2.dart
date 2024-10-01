import 'dart:js_interop';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:repractice/main.dart';
import 'package:repractice/sample_bank_management/deposit.dart';

import 'bank_management.dart';

 class BankHome extends StatefulWidget{
 late String accountName;
 late String accountNumber;

 BankHome({required this. accountName, required this. accountNumber, });

 late double balance1=0;
addmethot(){
  return balance1;
}


 @override
  Bank createState() => Bank();

}


class Bank extends State<BankHome>{



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('Your Account'),
      ),

      drawer: Drawer(child: ListView(
        children: [
          DrawerHeader( // user profile
            padding: EdgeInsets.all(0),
            child: UserAccountsDrawerHeader(
              decoration:
              BoxDecoration(color: Colors.green),
              accountName: Text('Name: ${widget.accountName.toUpperCase()}',style: TextStyle(fontSize: 14),),
              accountEmail: Text('Account No: ${widget.accountNumber.toUpperCase()}'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://images.pexels.com/photos/771742/pexels-photo-771742.jpeg"),
              ),
            ),
          ), //// user profile end

          ListTile(leading: Icon(Icons.account_balance),
            title: Text('Deposit'),
            onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => Deposit(acName: widget.accountName, acNumber: widget.accountNumber,),));},),
          ListTile(leading: Icon(Icons.account_balance_wallet), title: Text('Withdraw'),),

        ],

      )
      ),

      body: SingleChildScrollView(

        child: Container(
          margin: EdgeInsets.fromLTRB(0, 80, 0, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Icon(Icons.account_balance,size: 130,color: Color.fromRGBO(1, 161, 113 ,1),),
              ),
              Text('Your Account Balance',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),),

              Padding(padding: EdgeInsets.all(15),
                child: Text('${widget.balance1}',style: TextStyle(fontSize: 30,color: Colors.black,fontWeight: FontWeight.bold ),),)
            ],

          ),
        )
      ),

    );


  }

}
