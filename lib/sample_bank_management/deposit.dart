import 'package:flutter/material.dart';
import 'package:repractice/sample_bank_management/bank_managemant2.dart';

class Deposit extends StatefulWidget {
  late String acName;
  late String acNumber;
  late final double currentBalance;
  late double balance;

  Deposit({required this.acName, required this.acNumber, required this.currentBalance, required this.balance});

  @override
  DepositBalance createState() => DepositBalance();
}

class DepositBalance extends State<Deposit> {
  TextEditingController depositController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Color(0xFF134B70),
        title: Text('Deposit'),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 8),
            child: Text('${widget.balance}\$',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          Padding(
            padding:  EdgeInsets.only(right: 8),
            child: Icon(Icons.account_balance),
          )
        ],
      ),
      body:
      SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            Center(
              child: SizedBox(

                width: 400,
                child: Padding(
                  padding:  EdgeInsets.all(8.0),
                  child: Container(
                    color: Colors.white,
                    child: TextField(
                      controller: depositController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Enter Deposit Amount',
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: 400,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 1.0),
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  child: Text.rich(TextSpan(text: 'Account Name: ', children: [
                    TextSpan(
                      text: widget.acName.toUpperCase(),
                      style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
                    )
                  ])),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: SizedBox(
                width: 400,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 1.0),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: Text.rich(TextSpan(text: 'Account No: ', children: [
                      TextSpan(
                        text: widget.acNumber.toUpperCase(),
                        style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
                      )
                    ])),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 17, 0, 0),
              child: ElevatedButton(
                onPressed: () {
                  double deposit_Amount = double.tryParse(depositController.text) ?? 0;

                  if(deposit_Amount>0){
                    // Pass the deposit amount back to the BankHome screen to update the balance
                    // Navigator.pop( context,deposit_Amount);

                    // setState(() {
                    //   widget.balance += deposit_Amount; // Update the balance with the deposit amount
                    // });

                    Navigator.push(context, MaterialPageRoute(builder: (context,) =>
                        BankHome(accountName: widget.acName, accountNumber: widget.acNumber,balance: widget.balance+=deposit_Amount,),));

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text('Deposit Successful ${deposit_Amount}\$')

                      )
                    );

                  }
                  else{
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text('Please enter a valid deposit amount greater than 0'),
                        duration: Duration(seconds: 2),
                      )
                    );
                  }


                },
                child: Text('Submit',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  fontSize: 20,
                  ),


                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
