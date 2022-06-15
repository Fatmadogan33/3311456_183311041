import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


void main() {
  runApp(hastasonuclari());
}

class hastasonuclari extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pushNamed(context, '/Menu',arguments: {}),
             ), 
          centerTitle: true,
          title:Text('Hasta Sonuçları',
            textAlign: TextAlign.center,
            style:TextStyle(
              color: Colors.black45,
              fontWeight:FontWeight.w800,
              fontSize: 30,
            ),
          ),
          backgroundColor:Color.fromARGB(136, 252, 155, 155) ,
        ),
      
      body: Column(
        
        children: <Widget>[
           Padding(padding:const EdgeInsets.symmetric(vertical:16.0),
                  ),
           Image(
             image:AssetImage('assets/enabiz.png')),
          ListTile(
            title: Text("Sonuçlarınızı almak için tıklayınız.",
             textAlign: TextAlign.center,
            style:TextStyle(
              color: Colors.black45,
              fontWeight:FontWeight.w800,
              fontSize: 30,
          backgroundColor:Color.fromARGB(135, 196, 18, 18)

            ),
            ),
            
            onTap: () async {
              const url = 'https://enabiz.gov.tr/';

              if (await canLaunch(url)) {
                await launch(url, forceWebView: true);
              } else {
                throw 'Could not launch $url';
              }
            },
            
          ),
        ],
        
      ),
    );
  }
}


