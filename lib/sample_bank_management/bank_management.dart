import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'bank_managemant2.dart';

class BankManagement extends StatefulWidget{

  @override
    HomeActivityState createState() => HomeActivityState();

  } //StatefulWidget end

class HomeActivityState extends State<BankManagement> {
    TextEditingController  FirstController = TextEditingController();
   TextEditingController SecondController = TextEditingController();



  showSnackbar(message,context){
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message.toString().toUpperCase()))
    );
  } // showSnackbar end


  @override
  Widget build(BuildContext context) {


   return Scaffold(

backgroundColor: Color.fromRGBO(0, 40, 84 ,1),
     appBar: AppBar(
       iconTheme: IconThemeData(color: Colors.white),

     title:   Text('Bank Management',style: TextStyle(color: Colors.white),),
       backgroundColor: Color.fromRGBO(0, 40, 84 ,1),
     ),

         body:
         SingleChildScrollView(

       child: Column(

       mainAxisAlignment: MainAxisAlignment.center,
     children: [
       Icon(Icons.account_balance,size: 130,color: Color.fromRGBO(1, 161, 113 ,1),),

       Text('Bank Account',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),

       Padding(padding:EdgeInsets.all(15),
         child: Container( color: Colors.white,

          child: TextField(

           controller:  FirstController,
         decoration:InputDecoration(border: OutlineInputBorder() ,labelText: 'Enter Your Account Name',) ,
       ),
         ),
       ),

       Padding(padding:EdgeInsets.all(15),
         child:

         Container(color: Colors.white,
           child: TextField(

           controller: SecondController,
           decoration:InputDecoration( border: OutlineInputBorder(),labelText: 'Enter Your Account Number',) ,
         ),
         ),
       ),

       Padding(padding: EdgeInsets.all(15),

         child: ElevatedButton(onPressed: (){

           late  String userAccountName=FirstController.text;
          late String userAccountNumber= SecondController.text;

           if(userAccountName.isNotEmpty && userAccountNumber.isNotEmpty){
             showSnackbar('Account Created:\nName: $userAccountName\n Number: $userAccountNumber', context);
             Navigator.push(context, MaterialPageRoute(builder: (context) => BankHome(accountName: userAccountName, accountNumber: userAccountNumber,),));
           }
           else{
             showSnackbar("Please enter both name and account number", context);
           }

       },
           style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Color.fromRGBO(0, 169, 85, 1))),
         child:Text('Login', style: TextStyle(color: Colors.white,fontSize: 20),),

       ),

         ),



     ],
   ),
   ),

   );

  }

} // _HomeActivityState end