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

         body: Center(
           child: SingleChildScrollView(

             child:Column(

               mainAxisAlignment: MainAxisAlignment.center,
               crossAxisAlignment: CrossAxisAlignment.center, // Horizontally center korte
               children: [
                 SizedBox(
                   height: 10,
                 ),
                 Icon(
                   Icons.account_balance,
                   size: 150,
                   color: Colors.white,
                 ),
                 SizedBox(
                   height: 10,
                 ),
                 Text(
                   'Bank Account',
                   style: TextStyle(
                     fontSize: 20,
                     fontWeight: FontWeight.bold,
                     color: Colors.white,
                   ),
                 ),

                 SizedBox(height: 40,),


                 SizedBox(
                   width: 300,
                   child: Card(
                     elevation: 10,
                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                     shadowColor: Color(0xFFFEFFA7),
                     color: Color(0xFF1A237E),
                     child: TextField(
                       decoration: InputDecoration(
                         filled: true,
                         fillColor: Color(0xFF1A237E),
                         border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0),
                           borderSide: BorderSide.none,
                         ),
                         hintText: 'Account Name',
                         hintStyle: TextStyle(color: Colors.white70),
                         prefixIcon: Icon(Icons.person, color: Colors.white70,),

                       ),
                       style: TextStyle(color: Colors.white),
                       controller: FirstController,
                     ),

                   ),
                 ),

                   SizedBox(
                     height: 16,
                   ),

                   SizedBox(
                     width: 300,
                     child: Card(
                       shadowColor: Color(0xFFFEFFA7),
                       color: Color(0xFF1A237E),
                       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                       elevation: 10,
                       child: TextField(
                         decoration: InputDecoration(
                           filled: true,
                           fillColor: Color(0xFF1A237E),
                           border:OutlineInputBorder(
                             borderRadius: BorderRadius.circular(30.0),
                             borderSide: BorderSide.none,
                           ) ,
                           hintText: 'Account Number',
                           hintStyle: TextStyle(color: Colors.white70,),
                           prefixIcon: Icon(Icons.credit_card,color: Colors.white70,),

                         ),
                         style: TextStyle(color: Colors.white),
                         controller: SecondController,
                       ),
                     ),

                   ),


                   SizedBox(
                     height: 28,
                   ),
                   SizedBox(
                     width: 130,
                     child: Card(
                       elevation: 10,
                       shadowColor: Color(0xFFFEFFA7),
                       color: Color(0xFF1A237E),
                       shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(30.0),
                       ),
                       child: ElevatedButton(onPressed: (){
                         late String userName = FirstController.text;
                         late String accountNumber= SecondController.text;
                         if(userName !=null && userName.isNotEmpty && accountNumber !=null && accountNumber.isNotEmpty){
                           showSnackbar('Account Created:\nName: $userName\nNumber: $accountNumber',
                               context);
                           Navigator.push(context, MaterialPageRoute(builder: (context) =>
                               BankHome(accountName: userName, accountNumber: accountNumber),));
                         }
                         else{
                           showSnackbar('Please enter a valid Name and Account Number', context);
                         }

                       },
                           style: ButtonStyle(
                             backgroundColor: MaterialStateProperty.all(Color(0xFF1A237E))
                           ),

                           child: Text('Submit', style: TextStyle(color: Colors.white, fontSize: 20),)),
                     ),
                   )

                  ],
                ),
              ),
         ),
   );

  }

} // _HomeActivityState end