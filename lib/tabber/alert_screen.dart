import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlertScreen extends StatelessWidget{


  Mymessage(message,context) {

    ScaffoldMessenger.of(context,).showSnackBar(
        SnackBar(content: Text(message))
    );
  }


//========================= mymessage end====================



  MyAlertDialog (context ){

    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Expanded(
            child: AlertDialog(
              title: Row(
                children: [
                  Icon(Icons.add_alert), // বামপাশে আইকন
                  SizedBox(width: 8), // আইকন ও টেক্সটের মধ্যে স্পেস
                  Text('Exit Alert!'), // শিরোনাম
                ],
              ),
              content: Text('Are you sure you want to exit this app?'),
              actions: [
                TextButton(
                    onPressed: (){

                    },
                    child: Text('Yes')),

                TextButton(
                    onPressed: (){Navigator.of(context).pop();},
                    child: Text('No')),
              ],

            )

        );

      },
    );
  }
  //===============================end AlertDialog========================

  @override
  Widget build(BuildContext context) {

    final ButtonStyle buttonStyle = ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(20))
    );

    return Scaffold(

        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // First row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                  child: Image.network('https://cdn.pixabay.com/photo/2024/08/05/21/19/lion-8947711_1280.jpg'),
                ),

                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                  child: Image.network('https://cdn.pixabay.com/photo/2024/08/05/21/19/lion-8947711_1280.jpg'),
                ),

                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                  child: Image.network('https://cdn.pixabay.com/photo/2024/08/05/21/19/lion-8947711_1280.jpg'),
                ),
              ],
            ),

            // Second row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                  child: Image.network('https://cdn.pixabay.com/photo/2024/08/05/21/19/lion-8947711_1280.jpg'),
                ),
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                  child: Image.network('https://cdn.pixabay.com/photo/2024/08/05/21/19/lion-8947711_1280.jpg'),
                ),
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                  child: Image.network('https://cdn.pixabay.com/photo/2024/08/05/21/19/lion-8947711_1280.jpg'),
                ),
              ],
            ),

            // Third row (with buttons)
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Mymessage("This is an ElevatedButton", context);
                      MyAlertDialog(context);
                    },
                    child: Text('Exit Now'),
                    style: buttonStyle,
                  ),
                  TextButton(
                    onPressed: () {
                      Mymessage("This is a TextButton", context);
                    },
                    child: Text('TextButton'),
                    style: buttonStyle,
                  ),
                  OutlinedButton(
                    onPressed: () {
                      Mymessage("This is an OutlinedButton", context);
                    },
                    child: Text('OutlinedButton'),
                    style: buttonStyle,
                  ),
                ],
              ),
            )
          ],
        )


    );

  }



}