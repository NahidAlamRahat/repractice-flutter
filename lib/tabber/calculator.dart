import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class Calculator extends StatefulWidget {
  @override
  _HomeActivityState createState() => _HomeActivityState();
}

class _HomeActivityState extends State<Calculator> {
  final TextEditingController FirstController = TextEditingController();
  final TextEditingController SecondController = TextEditingController();

  double discount = 0;
  double total = 0;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        backgroundColor: Colors.cyan,
        title: Text('Percent Calculate'),
      ),


      body:  SingleChildScrollView( child: Column(

        mainAxisAlignment: MainAxisAlignment.start,

        children: [
          Padding(padding: EdgeInsets.all(15),
            child: TextField(
              controller: FirstController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(border: OutlineInputBorder(),labelText: 'Enter the number',),
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
            ),

          ),

          Padding(padding: EdgeInsets.all(15),
              child: TextField(
                controller: SecondController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(border: OutlineInputBorder(),labelText: 'Enter the percentage',),
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
              )

          ),


          Padding(padding: EdgeInsets.all(15),

              child: ElevatedButton(onPressed: (){

                String input1 = FirstController.text;
                String input2 = SecondController.text;

                double? number1 = double.tryParse(input1);
                double? number2 = double.tryParse(input2);


                double sum = number1! * number2!/100;
                double dis = number1 -sum;


                setState(() {
                  discount =sum;
                  print(discount);
                });

                setState(() {
                  total =dis;
                  print(dis);
                });


              },
                  child: Text('Submit')
              ),
          ) ,

          Text('Discount is : $discount', style: TextStyle(
            fontSize:18,
            fontWeight: FontWeight.bold,

          ),

          ),

          Text('Total : $total', style: TextStyle(
            fontSize:18,
            fontWeight: FontWeight.bold,
          ),
          ),
        ],

      ),
      ),

    );
  }

}