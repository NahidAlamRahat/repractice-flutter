import 'package:flutter/material.dart';
import 'package:repractice/sample_bank_management/bank_management.dart';
import 'package:repractice/tabber/calculator.dart';


class HomeScreen extends StatelessWidget{

  var MyArray=[
    {"img":"https://h5p.org/sites/default/files/h5p/content/1209180/images/file-6113d5f8845dc.jpeg", "title":"bag"},
    {"img":"https://h5p.org/sites/default/files/h5p/content/1209180/images/file-6113d745132d3.jpeg", "title":"pakhi"},
    {"img":"https://h5p.org/sites/default/files/h5p/content/1209180/images/file-6113d61122a5d.jpeg", "title":"shiyal"},
    {"img":"https://h5p.org/sites/default/files/h5p/content/1209180/images/file-6113d62c09fab.jpeg", "title":"hati"},
    {"img":"https://h5p.org/sites/default/files/h5p/content/1209180/images/file-6113d7c152b3f.jpeg", "title":"biral"},

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:

      Padding(padding: EdgeInsets.all(10),
        child:Column(
          children: [
            Scrollbar(
                child:
            ElevatedButton(
              onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => Calculator(), ));

              },
              child: Text("Calculate Percentagea..",style: TextStyle(fontSize: 18),),

            ),
            ),

           Padding(padding: EdgeInsets.all(15),child:Scrollbar(

              child:
              ElevatedButton(

                onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => BankManagement(), ));

                },
                child: Text("Bank Account",style: TextStyle(fontSize: 18),),

              ),
            ),),


            Expanded(child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 0,

                crossAxisCount: 2,
              ),


              itemCount: MyArray.length,
              itemBuilder: (context, index) {
                return GestureDetector(

                  onTap: (){
                   Badge.count(count: index);
                  },

                  child: Container(
                    width: double.infinity,
                    height: 250,
                    margin: EdgeInsets.all(10),
                    child: Image.network(MyArray[index]["img"]!),
                  ),
                );

              },),

            ),

          ],),
      ),


    );
  }
} // homeScreen