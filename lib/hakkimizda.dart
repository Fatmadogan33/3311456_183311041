import 'package:flutter/material.dart';

import 'main.dart';



void main() {
  runApp(hakkimizda());
}
class hakkimizda extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme:ThemeData(fontFamily: 'Calibri'),
      home:Scaffold(
        appBar: AppBar(
          leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pushNamed(context, '/Menu',arguments: {}),
             ), 
          centerTitle: true,
          title:Text('Hakkımızda',
            textAlign: TextAlign.center,
            style:TextStyle(
              color: Colors.black45,
              fontWeight:FontWeight.w800,
              fontSize: 30,
            ),
          ),
          backgroundColor:Color.fromARGB(136, 252, 155, 155) ,
        ),
        body:Center(
         
            child:Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Ankara Şehir Hastanesi',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontFamily: 'Calibri',
                          fontSize:20
                      )),
                  Text('Çankaya ilçesinin Bilkent semtinde yer alan hastane, 180 dekar alan üzerine kuruludur. Hastanede 131 ameliyathane, 904 poliklinik ile 82 VIP oda, 1.554 tek yataklı oda, 725 çift yataklı oda ve 700 yoğun bakım ünitesinde toplam 3.704 yatak vardır. Diyaliz kliniği 38 yataklıdır. Hastane tam kapasite çalıştığında günde 30.000 hastaya hizmet verecek ve 8.000 acil servis hastasınını tedavi edecektir. Hastanede kalp ve damar cerrahisi, nöroloji, onkoloji, ortopedi ve genel dal birimleri vardır. Hastane, ülkedeki dokuz şehir hastanesinin en büyüğüdür. Hastanede ayrıca tıbbi gözlem kliniği işlevi gören 100 yataklı bir otel ve ambulans helikopterlerin iniş yapabilmesi için iki heliport bulunur. Hastanede yaklaşık 2.700 akademisyen, doktor ve cerrah, 6.300 sağlık personeli ve 4.000 idari ve destek personeli istihdam edilmektedir.'
                    ,textAlign: TextAlign.justify,
                  ),
                  Padding(padding:const EdgeInsets.symmetric(vertical:16.0),
                  ),
                  Image(
                    image:AssetImage('assets/genel-hastane.png')),
                      
                     
                ],
              ),
            )
            ),
        )
      ),
      );
  }
}