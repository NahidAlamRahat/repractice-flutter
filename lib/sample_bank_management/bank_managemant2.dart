import 'package:flutter/material.dart';
import 'package:repractice/sample_bank_management/deposit.dart';
import 'package:repractice/sample_bank_management/withdraw.dart';


class BankHome extends StatefulWidget {
  late String accountName;
  late String accountNumber;
  double balance;



  BankHome({required this.accountName, required this.accountNumber, this.balance=0});






  @override
  Bank createState() => Bank();
}
class Bank extends State<BankHome> {
  double totalBalance=0 ; // Store the total balance here

  // Function to update balance when a deposit is made
  void updateBalance(double depositAmount) {
    setState(() {
      totalBalance += depositAmount; // Add deposit amount to the total balance
    });
  }

  void withdrawBalance(double withdrawAmount) {
    setState(() {
      totalBalance -= withdrawAmount; // Add deposit amount to the total balance
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Account'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              padding: EdgeInsets.all(0),
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.green),
                accountName: Text(
                  'Name: ${widget.accountName.toUpperCase()}',
                  style: TextStyle(fontSize: 14),
                ),
                accountEmail: Text(
                  'Account No: ${widget.accountNumber.toUpperCase()}',
                ),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://images.pexels.com/photos/771742/pexels-photo-771742.jpeg"),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.account_balance),
              title: Text('Deposit'),
              onTap: () async {
                // Navigate to the Deposit screen and wait for the result
                final depositAmount = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Deposit(
                      acName: widget.accountName,
                      acNumber: widget.accountNumber,
                      currentBalance: totalBalance,
                      balance: totalBalance,// Pass current balance
                    ),
                  ),
                );

                // If a deposit amount is returned, update the total balance
                if (depositAmount != null && depositAmount is double) {
                  updateBalance(depositAmount);
                }
              },
            ),


            ListTile(
              leading: Icon(Icons.account_balance_wallet),
              title: Text('Withdraw'),
              onTap: ()async{
                final withdrawAmount = await Navigator.push(context,
                    MaterialPageRoute(
                      builder: (context) => WithdrawHome(
                        Ac_Name: widget.accountName,
                        Ac_number: widget.accountNumber,
                        balance: totalBalance,)
                      ,));

                if (withdrawAmount != null && withdrawAmount is double) {
                  withdrawBalance(withdrawAmount);
                }

              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.fromLTRB(0, 80, 0, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Icon(
                  Icons.account_balance,
                  size: 130,
                  color: Color.fromRGBO(1, 161, 113, 1),
                ),
              ),
              Text(
                'Your Account Balance',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: Text(
                  '${totalBalance=widget.balance}\$', // Display the cumulative balance
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
