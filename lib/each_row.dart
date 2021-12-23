import 'package:flutter/material.dart';
import 'package:playstore/colors.dart';
import 'items.dart';

// Made for each horizantal scrollable part
class EachRow extends StatelessWidget {
  var futureMethod;
  EachRow({
    required this.futureMethod,
  });

  @override
  Widget build(BuildContext context) {
    var screenInfo = MediaQuery.of(context);
    final double screenHeight = screenInfo.size.height;
    final double screenWidth = screenInfo.size.width;
    return Padding(
      padding: EdgeInsets.only(top: screenHeight * 0.01),
      child: SizedBox(
        height: screenHeight * 0.23,
        child: FutureBuilder<List<Items>>(
          future: futureMethod,
          builder: (context,snapshot){
            if(snapshot.hasData){
              var itemsList = snapshot.data;
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: itemsList!.length,
                itemBuilder: (context,index){
                  var item = itemsList[index];
                  return Card(
                    elevation: 0,
                    margin: EdgeInsets.only(left: screenWidth * 0.05),
                    color: backgroundColor,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(borderRadius: BorderRadius.circular(10),child: Image.asset("images/${item.image}",height: screenHeight * 0.15,width: screenWidth * 0.5,fit: BoxFit.fill,)),
                        Padding(
                          padding: EdgeInsets.only(top:screenHeight * 0.01,left: screenWidth * 0.01),
                          child: Row(
                            children: [
                              ClipRRect(borderRadius: BorderRadius.circular(10),child: Image.asset("icons/${item.icon}",height: screenHeight * 0.06,width: screenWidth * 0.1,)),
                              Padding(
                                padding: EdgeInsets.only(left: screenWidth * 0.02),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(item.title,style: TextStyle(color: titleColor,fontSize: screenHeight * 0.015),),
                                    Text(item.type,style: TextStyle(color: textColor,fontSize: screenHeight * 0.014),),
                                    Text("${item.star}✰   ${item.priceOrSize}",style: TextStyle(color: textColor,fontSize: screenHeight * 0.014),),
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
              );
            }else {
              return Center();
            }
          },
        ),
      ),
    );
  }
}
