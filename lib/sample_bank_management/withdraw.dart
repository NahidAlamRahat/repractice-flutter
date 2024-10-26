import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'bank_managemant2.dart';

class WithdrawHome extends StatefulWidget {
  double balance;
  late String Ac_Name;
  late String Ac_number;

  WithdrawHome({ required this.balance, required this.Ac_Name, required this.Ac_number});


  @override
  Withdraw createState() {
    return Withdraw();
  }
}

class Withdraw extends State<WithdrawHome> {
  TextEditingController balanceWithdraw = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Color(0xFF134B70),
        title: Text('Withdraw ') ,
        actions: [

          Text('${widget.balance}\$',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Padding(
            padding:  EdgeInsets.fromLTRB(8, 0, 16, 0),
            child: Icon(Icons.account_balance),
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: SizedBox(
          width: 400,
          child: Padding(
            padding:  EdgeInsets.fromLTRB(10, 24, 10, 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center, // Horizontally center korte
              children: [
                TextField(
                  controller: balanceWithdraw,
                  decoration: InputDecoration(
        
                      border: OutlineInputBorder(),
                      labelText: 'Enter withdraw Amount'),
                  keyboardType: TextInputType.number,
                ),
        
                SizedBox(
                  height: 20,
                ),
        
                SizedBox(
                  width: 400,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 1.0),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: Text.rich(TextSpan(text: 'Account Name: ', children: [
                      TextSpan(
                        text: widget.Ac_Name.toUpperCase(),
                        style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
                      )
                    ])),
                  ),
                ),
        
                SizedBox(
                  height: 20,
                ),
        
        
                SizedBox(
                  width: 400,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12,vertical: 16),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 1),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text.rich(TextSpan(text: 'Account Number: ',
                        children: [
        
                      TextSpan(
                        text: widget.Ac_number,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        )
                      )
                    ]
                    ),
        
                  )),
                ),
        
                Center(child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                      onPressed: (){
                        double withdrawBalance = double.tryParse(balanceWithdraw.text) ?? 0;
                        if(withdrawBalance>=1 && withdrawBalance<=widget.balance){

                          // Navigator.pop(context, withdrawBalance);

                          Navigator.push(context, MaterialPageRoute(builder: (context,) =>
                              BankHome(accountName: widget.Ac_Name, accountNumber: widget.Ac_number,balance: widget.balance-=withdrawBalance,),));
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text('Withdraw Successful $withdrawBalance\$')
                            )
                          );
                        }
                        else{
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Please enter a valid withdraw amount')

                            )
                          );
                        }
                      },

                      child: Text('Submit',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                  ),
                )
                )
        
        
              ],
            ),
          ),
        ),
      ),

    );
  }
}
