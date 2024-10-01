import 'package:flutter/material.dart';
import 'package:repractice/sample_bank_management/bank_managemant2.dart';
import 'package:repractice/sample_bank_management/bank_managemant2.dart';

import 'bank_managemant2.dart';


class Deposit extends StatefulWidget {

late String acName;
late String acNumber;


  Deposit({required this.acName, required this.acNumber});

  @override
  DepositBalance createState() => DepositBalance();
}

class DepositBalance extends State<Deposit> {
  TextEditingController depositController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Deposit'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center, // Centers horizontally

          children: [
            Center(
              child: SizedBox(
                width: 400,
                child: Container(
                  color: Colors.white,
                  child: TextField(keyboardType: TextInputType.number,
                    controller: depositController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter Deposit Amount',
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 12.0, vertical: 16.0),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: 400,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 1.0),
                  // Similar border to the text field
                  borderRadius: BorderRadius.circular(
                      4.0), // You can adjust the border radius
                ),
                child: Text.rich(TextSpan(text: 'Account Name: ', children: [
                  TextSpan(
                    text: widget.acName.toUpperCase(),
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  )
                ])),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: SizedBox(
                width: 400,
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 1.0),
                    // Similar border to the text field
                    borderRadius: BorderRadius.circular(
                        4.0), // You can adjust the border radius
                  ),
                  child: Text.rich(TextSpan(text: 'Account No: ', children: [
                    TextSpan(
                      text: widget.acNumber.toUpperCase(),
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    )
                  ])),
                ),
              ),
            ),
          Padding(padding: EdgeInsets.fromLTRB(0, 17, 0, 0),
            child: ElevatedButton(

                onPressed: (){
                  double addBalance=depositController as double;


                  Navigator.push(context, MaterialPageRoute(builder: (context) => BankHome(accountName: widget.acName, accountNumber: widget.acNumber)
                  ));},
                child: Text('Submit') ),
          ),
          ],
        ),
      ),
    );
  }
}
