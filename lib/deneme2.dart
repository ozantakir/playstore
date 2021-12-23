import 'package:flutter/material.dart';
import 'package:playstore/rows.dart';

import 'categories.dart';
import 'colors.dart';
import 'each_row.dart';

class Deneme2 extends StatefulWidget {
  const Deneme2({Key? key}) : super(key: key);

  @override
  _Deneme2State createState() => _Deneme2State();
}

class _Deneme2State extends State<Deneme2> {

  // Future method for all the rows
  Future<List<Categories>> takeRows() async {
    var rowList = <Categories>[];
    var r1 = Categories(categoryId: 1, mainTitle: "durma söyle", item: EachRow(futureMethod: Rows().takeFirstItems()));
    var r2 = Categories(categoryId: 2, mainTitle: "Herkes oynuyor", item: EachRow(futureMethod: Rows().takeSecondItems()));
    var r3 = Categories(categoryId: 3, mainTitle: "beni", item: EachRow(futureMethod: Rows().takeThirdItems()));
    var r4 = Categories(categoryId: 4, mainTitle: "Ücretli oyunlar", item: EachRow(futureMethod: Rows().takeFirstItems()));

    rowList.add(r1);
    rowList.add(r2);
    rowList.add(r3);
    rowList.add(r4);

    return rowList;
  }

  @override
  Widget build(BuildContext context) {
    var screenInfo = MediaQuery.of(context);
    final double screenHeight = screenInfo.size.height;
    final double screenWidth = screenInfo.size.width;
    return Expanded(
      child: FutureBuilder<List<Categories>>(
        future: takeRows(),
        builder: (context,snapshot){
          if(snapshot.hasData){
            var rowList = snapshot.data;
            return ListView.builder(
              itemCount: rowList!.length,
              itemBuilder: (context,index){
                var row = rowList[index];
                return Card(
                  elevation: 0,
                  color: backgroundColor,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: screenWidth * 0.05,right: screenWidth * 0.03,top: screenHeight * 0.01),
                        child: Row(
                          children: [
                            Text(row.mainTitle,style: TextStyle(color: titleColor,fontSize: screenHeight * 0.022),),
                            const Spacer(),
                            Icon(Icons.arrow_forward,color: titleColor,)
                          ],
                        ),
                      ),
                      row.item
                    ],
                  ),
                );
              },
            );
          } else {
            return const Center();
          }
        },
      ),
    );
  }
}
