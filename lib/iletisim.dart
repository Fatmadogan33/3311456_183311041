import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main(){
  runApp(iletisim(),
  );
}

class iletisim extends StatelessWidget {
  void customLaunch(command)async{
    if(await canLaunch(command))
    {
      await launch(command);
    }
    else
    {
      print("$command bulunamadı!");
    }
  }
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
          title:Text('İletişim',
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
            child:Center(
              child:Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  CircleAvatar(radius: 70.0,
                    backgroundColor: Colors.black54,
                    backgroundImage: AssetImage('assets/ankara.jpg'),
                  ),
                  Text(' Adres: Üniversiteler Mahallesi 1604. Cadde No: 9 Çankaya/ANKARA',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize:30,
                      color:Colors.black54,
                      backgroundColor:Color.fromARGB(135, 196, 18, 18)
                    ),
                  ),
                  Divider(height:10),
                  InkWell(
                    onTap: (){
                      customLaunch("mailto:ankarasehir@saglik.gov.tr");
                    },
                    child:Container(
                        margin:EdgeInsets.symmetric(
                          horizontal: 10.0,
                        ),
                        color:Colors.black12,
                        child:ListTile(leading:Icon(
                          Icons.email,
                          size:30,
                          color:Colors.black87,
                        ),title:Text('ankarasehir@saglik.gov.tr',
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            color:Colors.black54,
                            fontWeight:FontWeight.w800,
                            fontSize: 23,
                            backgroundColor:Color.fromARGB(135, 196, 18, 18)
                          ),
                        ),)
                    ),
                  ),
                  SizedBox(height:10,),
                  InkWell(
                    onTap: (){
                      customLaunch("tel:0312 552 60 00");
                    },
                    child:Container(
                        margin:EdgeInsets.symmetric(
                          horizontal: 10.0,
                        ),
                        color:Colors.black12,
                        child:ListTile(leading:Icon(
                          Icons.phone,
                          size:30,
                          color:Colors.black87,
                        ),title:Text('0312 552 60 00',
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            color:Colors.black54,
                            backgroundColor:Color.fromARGB(135, 196, 18, 18),
                            fontWeight:FontWeight.w800,
                            fontSize: 23,
                          ),
                        ),)
                    ),
                  ),
                  SizedBox(height:10,),
                  Container(
                      margin:EdgeInsets.symmetric(
                        horizontal: 10.0,
                      ),
                      color:Colors.black12,
                      child: ListTile(leading:Icon(
                        Icons.print,
                        size:30,
                        color:Colors.black87,
                      ),title:Text('ankarasehirhastanesi@hs03.kep.tr',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          color:Colors.black54,
                          backgroundColor:Color.fromARGB(135, 196, 18, 18),
                          fontWeight:FontWeight.w800,
                          fontSize: 23,
                        ),
                      ),)
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}


