import 'package:flutter/material.dart';




import 'main.dart';
import 'iletisim.dart';
import 'hakkimizda.dart';


void main() {
  runApp(Menu());
}

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme:ThemeData(fontFamily: 'Calibri'),
      home:Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title:Text('MENÜ',
            textAlign: TextAlign.center,
            style:TextStyle(
              color: Colors.black45,
              fontWeight:FontWeight.w800,
              fontSize: 30,
            ),
          ),
          backgroundColor:Color.fromARGB(136, 252, 155, 155) ,
        ),
        body:SafeArea(
          
          child:(Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceAround,

             
            children: <Widget>[
               
              new GestureDetector(
                onTap:() => Navigator.pushNamed(context, '/kadromuz',arguments: {}),
                child: Container(
                  color: Color.fromARGB(255, 135, 155, 163),
                  margin: EdgeInsets.all(5.0),
                  alignment: Alignment.center,
                  child: new Text("Kadromuz",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black38,
                      fontSize: 20,
                  ),
                ),
              ),
              ),
              new GestureDetector(
                onTap:() => Navigator.pushNamed(context, '/hastayorumlari',arguments: {}),
                child: Container(
                  color: Color.fromARGB(255, 135, 155, 163),
                  margin: EdgeInsets.all(5.0),
                  alignment: Alignment.center,
                  child: new Text("Hasta Yorumları",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black38,
                      fontSize: 20,
                  ),
                ),
              ),
              ),
              new GestureDetector(
                onTap:() => Navigator.pushNamed(context, '/doktorasorun',arguments: {}),
                child: Container(
                  color: Color.fromARGB(255, 135, 155, 163),
                  margin: EdgeInsets.all(5.0),
                  alignment: Alignment.center,
                  child: new Text("Doktora Sorun",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black38,
                      fontSize: 20,
                  ),
                ),
              ),
              ),
              new GestureDetector(
                onTap:() => Navigator.pushNamed(context, '/nobetcihemsirelerlistesi',arguments: {}),
                child: Container(
                  color: Color.fromARGB(255, 135, 155, 163),
                  margin: EdgeInsets.all(5.0),
                  alignment: Alignment.center,
                  child: new Text("Nöbetçi Hemşireler Listesi",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black38,
                      fontSize: 20,
                  ),
                ),
              ),
              ),
              new GestureDetector(
                onTap:() => Navigator.pushNamed(context, '/iletisim',arguments: {}),
                child: Container(
                  color: Color.fromARGB(255, 135, 155, 163),
                  margin: EdgeInsets.all(5.0),
                  alignment: Alignment.center,
                  child: new Text("İletişim",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black38,
                      fontSize: 20,
                  ),
                ),
              ),
              ),
              new GestureDetector(
                onTap:() => Navigator.pushNamed(context, '/hizmetbinalarimiz',arguments: {}),
                child: Container(
                  color: Color.fromARGB(255, 135, 155, 163),
                  margin: EdgeInsets.all(5.0),
                  alignment: Alignment.center,
                  child: new Text("Hizmet Binalarımız",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black38,
                      fontSize: 20,
                  ),
                ),
              ),
              ),
              new GestureDetector(
                onTap:() => Navigator.pushNamed(context, '/hakkimizda',arguments: {}),
                child: Container(
                  color: Color.fromARGB(255, 135, 155, 163),
                  margin: EdgeInsets.all(5.0),
                  alignment: Alignment.center,
                  child: new Text("Hakkımızda",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black38,
                      fontSize: 20,
                  ),
                ),
              ),
              ),
              new GestureDetector(
                onTap:() => Navigator.pushNamed(context, '/hastasonuclari',arguments: {}),
                child: Container(
                  color: Color.fromARGB(255, 135, 155, 163),
                  margin: EdgeInsets.all(5.0),
                  alignment: Alignment.center,
                  child: new Text("Hasta Sonuçları",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black38,
                      fontSize: 20,
                  ),
                ),
              ),
              ),
              new GestureDetector(
                onTap:() => Navigator.pushNamed(context, '/corona',arguments: {}),
                child: Container(
                  color: Color.fromARGB(255, 135, 155, 163),
                  margin: EdgeInsets.all(5.0),
                  alignment: Alignment.center,
                  child: new Text("COVID-19",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black38,
                      fontSize: 20,
                  ),
                ),
              ),
              ),





            ],
          )),
        ),
      ),
    );

  }
}
