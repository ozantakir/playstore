import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:playstore/colors.dart';
import 'package:playstore/deneme.dart';
import 'package:playstore/deneme2.dart';
import 'apps_page.dart';
import 'books_page.dart';
import 'games_page.dart';
import 'movies_page.dart';
void main() {
  runApp(const MyApp());
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Color(0xFF1b1b1b)));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedButtonIndex = 0;
  var pageList = [GamesPage(),AppsPage(),MoviesPage(),BooksPage()];

  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
      length: 5,
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          title: Card(
            color: secondBackgroundColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(Icons.search,color: textColor,),
                Text("Uygulama ve oyun arayın",style: TextStyle(color: textColor),),
                Icon(Icons.mic_none,color: textColor,),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      primary: Colors.green
                    ),
                    onPressed: (){},
                    child: Text("O",style: TextStyle(color: titleColor),)
                )
              ],
            ),
          ),
          shape: Border(bottom: BorderSide(color: textColor,width: 0.5)),
          elevation: 0,
          backgroundColor: backgroundColor,
          bottom: TabBar(
            padding: EdgeInsets.only(left: 20),
            isScrollable: true,
            indicatorColor: pickColor,
            labelColor: pickColor,
            unselectedLabelColor: textColor,
            tabs: [
              Tab(text: "Size özel"),
              Tab(text: "Üst sıralar"),
              Tab(text: "Çocuklar"),
              Tab(text: "Ücretli"),
              Tab(text: "Kategoriler"),
            ],
          ),
        ),
        body: Column(
          children: [
            pageList[selectedButtonIndex]
          ],
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
              border: Border(
                  top: BorderSide(width: 1,color: textColor)
              )
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: selectedButtonIndex,
            onTap: (index){
              setState(() {
                selectedButtonIndex = index;
              });
            },
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.videogame_asset_sharp), label: "Oyunlar"),
              BottomNavigationBarItem(icon: Icon(Icons.apps), label: "Uyg.lar"),
              BottomNavigationBarItem(icon: Icon(Icons.local_movies), label: "Filmler"),
              BottomNavigationBarItem(icon: Icon(Icons.menu_book_sharp), label: "Kitaplar"),
            ],

            backgroundColor: backgroundColor,
            selectedItemColor: pickColor,
            unselectedItemColor: textColor,
          ),
        )
      ),
    );

  }
}



