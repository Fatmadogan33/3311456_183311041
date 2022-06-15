import 'package:flutter/material.dart';

import 'main.dart';



void main() {
  runApp(hizmetbinalarimiz());
}
class hizmetbinalarimiz extends StatelessWidget {
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
          title:Text('Hizmet Binalarımız',
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
                  Text('Kalp Damar Hastanesi',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontFamily: 'Calibri',
                          fontSize:20
                      )),
                  Text('Ankara Şehir Hastanesi Kalp ve Damar Hastanesi Şubat 2019’dan itibaren, Türkiye Yüksek İhtisas Eğitim ve Araştırma Hastanesi, Ankara Atatürk Eğitim ve Araştırma Hastanesi ve Ankara Numune Eğitim ve Araştırma Hastanesi bünyesindeki köklü Kalp ve Damar Cerrahisi Klinikleri’nin tek bir çatı altında toplanması ile Kalp ve Damar Hastanesi(MH2) binasında hizmet vermeye başlamıştır. Alanında Türkiye’nin en büyüğü olan Kalp ve Damar Cerrahisi Kliniğimizde, ülkemizin en tecrübeli cerrahları, ülkemizin dört bir yanından vatandaşlarımıza ve yurtdışından gelen misafirlerimize 7 gün 24 saat aralıksız hizmet vermektedir.Kalp ve damar hastanesi binası, 441 yatak kapasitesine sahiptir. '


                    ,textAlign: TextAlign.justify,
                  ),
                  Padding(padding:const EdgeInsets.symmetric(vertical:16.0),
                  ),
                  Image(
                    image:AssetImage('assets/ankara.jpg')),


                   Text('Nöroloji Hastanesi',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontFamily: 'Calibri',
                          fontSize:20
                      )),
                  Text(''' Beyin Cerrahi, Dermatoloji, Enfeksiyon Hastalıkları ve Klinik Mikrobiyoloji, Nöroloji ve Ortopedi ve Travmatoloji kliniklerimiz mevcuttur.'''
                          
                    ,textAlign: TextAlign.justify,
                  ),
                  Padding(padding:const EdgeInsets.symmetric(vertical:16.0),
                  ),
                  Image(
                    image:AssetImage('assets/ankara.jpg')),


                    Text('Onkoloji Hastanesi',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontFamily: 'Calibri',
                          fontSize:20
                      )),
                  Text('''Onkoloji Hastanesi poliklinik binası 1993 yılında, klinikler binası ise 2005 yılında 120 yatak sayısı ile hizmete açılmıştır. Yeni ünitelerin eklenmesi ile 2013 yılında yatak kapasitesi 160’a yükseltilmiştir.
Kanser tedavisinde başarının vazgeçilmez koşulu, kanserle ilgili uzmanlık dallarının birlikte çalışması ve ekip yaklaşımının profesyonelce uygulanmasıdır. Hastanemizde kanserli hastaların tanı, tedavi ve takibinde modern tıbbın gerektirdiği tüm tıbbı bilgi ve teknik olanaklardan yararlanılmaktadır. Ülkemizin her köşesinden başvuran hastalarımıza en üst seviyede profesyonel sağlık hizmeti sunan hastanemiz, ülkemizin önde gelen kanser merkezlerindendir. Onkoloji Hastanesi ile birlikte Hacettepe Üniversitesi Kanser Enstitüsü de kanser alanında birçok eğitim ve araştırma programına öncülük etmektedir.'''
                    ,textAlign: TextAlign.justify,
                  ),
                  Padding(padding:const EdgeInsets.symmetric(vertical:16.0),
                  ),
                  Image(
                    image:AssetImage('assets/ankara.jpg')),


                    Text('Çocuk Hastanesi',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontFamily: 'Calibri',
                          fontSize:20
                      )),
                  Text(''' Çocuk Hastanesi 2003 yılında kurulmuştur. 210 yatak kapasitesine sahiptir.'''
                    ,textAlign: TextAlign.justify,
                  ),
                  Padding(padding:const EdgeInsets.symmetric(vertical:16.0),
                  ),
                  Image(
                    image:AssetImage('assets/ankara.jpg')),


                    Text('Kadın Doğum Hastanesi',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontFamily: 'Calibri',
                          fontSize:20
                      )),
                  Text('''Kadın Doğum, Acil Servis, Aile Planlaması, Cinsel Sağlık, Doğum Salonu-Antenatal (Normal Gebelik Servisi ve Polikliniği) ,Gebe Okulu IVF (Tüp Bebek), İnfertilite Jinekoloji (Kadın Hastalıkları 1), Jinekoloji (Kadın Hastalıkları 2), Kronik Pelvik Ağrı ve Endometriyozis Polikliniği Menopoz Polikistik Over Sendromu Suda Doğum Tekrarlayan Gebelik Kaybı Jinekolojik Onkoloji Cerrahisi Perinatoloji (Yüksek Riskli Gebelikler) Yeni Doğan Servisi bulunmaktadır.'''
                    ,textAlign: TextAlign.justify,
                  ),
                  Padding(padding:const EdgeInsets.symmetric(vertical:16.0),
                  ),
                  Image(
                    image:AssetImage('assets/ankara.jpg')),


                    Text('Fizik Tedavi ve Rehabilitasyon Hastanesi',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontFamily: 'Calibri',
                          fontSize:20
                      )),
                  Text('''Beyin Hasarı ve İnme Rehabilitasyonu, Pediatrik Rehabilitasyon Kliniği, Subakut Rehabilitasyon Kliniği - Yabancı Hasta Kliniği Romatoloji, Ortopedi Rehabilitasyon ve Ağrı Kliniği , Omurilik Hasarı Rehabilitasyon Kliniği ,Beyin Hasarı Rehabilitasyon Kliniği, Geleneksel ve Tamamlayıcı Tıp (Getat), Nöromusküler Hasar Rehabilitasyonu ,Omurilik Hasarı Rehabilitasyonu, Pediatrik Rehabilitasyon ,Romatolojik Rehabilitasyon, Sporcu Sağlığı Rehabilitasyon ,Laboratuvarı Subakut Rehabilitasyon kliniklerimiz bulunmaktadır.'''
                    ,textAlign: TextAlign.justify,
                  ),
                  Padding(padding:const EdgeInsets.symmetric(vertical:16.0),
                  ),
                  Image(
                    image:AssetImage('assets/ankara.jpg')),   
                     
                ],
              ),
              ),
              
            )
        )
      ),
      );
  }
}