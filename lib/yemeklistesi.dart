
// import 'package:flutter/material.dart';

// import 'main.dart';

// import 'package:open_file/open_file.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:syncfusion_flutter_pdf/pdf.dart';
// import 'dart:io';


// Future<void> saveAndLaunchFile(List<int> bytes, String fileName) async {
//   final path = (await getExternalStorageDirectory())?.path;
//   final file = File('$path/$fileName');
//   await file.writeAsBytes(bytes, flush: true);
//   OpenFile.open('$path/$fileName');
// }

// Future<void> _createPDF() async {
//     PdfDocument document = PdfDocument();
//     final page = document.pages.add();
//     PdfGrid grid = PdfGrid();
//     grid.style = PdfGridStyle(
//         font: PdfStandardFont(PdfFontFamily.helvetica, 30),
//         cellPadding: PdfPaddings(left: 5, right: 2, top: 2, bottom: 2));
//     grid.columns.add(count: 3);
//     grid.headers.add(1);
//     PdfGridRow header = grid.headers[0];
//     header.cells[0].value = 'Günler';
//     header.cells[1].value = 'Yemekler';
//     header.cells[2].value = 'Toplam Kalori';

//     PdfGridRow row = grid.rows.add();
//     row.cells[0].value = 'Pazartesi';
//     row.cells[1].value = 'Etli Nohut / Şehriyeli Pirinç Pilavı / Peynir Tatlısı ';
//     row.cells[2].value = '965 kcal';

//     row = grid.rows.add();
//     row.cells[0].value = 'Salı';
//     row.cells[1].value = 'Fırın Tavuk-Patates / Kremalı Tavuk Çorba / Ayran';
//     row.cells[2].value = '883 kcal';

//     row = grid.rows.add();
//     row.cells[0].value = 'Çarşamba';
//     row.cells[1].value = 'Terbiyeli Köfte / Soslu Makarna / Mevsim Salata';
//     row.cells[2].value = '706 kcal';

//     row = grid.rows.add();
//     row.cells[0].value = 'Perşembe';
//     row.cells[1].value = 'Ispanaklı Tavuk Sarma / Mercimekli Bulgur Pilavı / Yoğurt';
//     row.cells[2].value = '766 kcal';
    
//     row = grid.rows.add();
//     row.cells[0].value = 'Cuma';
//     row.cells[1].value = 'Yoğurtlu Kıymalı Ispanak / Peynirli Tepsi Böreği / Aşure';
//     row.cells[2].value = '1197 kcal';

//     grid.draw(page: page, bounds: const Rect.fromLTWH(0, 0, 0, 0));

//     List<int> bytes = await document.save();
//     document.dispose();
//     saveAndLaunchFile(bytes, 'Cikti.pdf');
//   }
// class yemeklistesi extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme:ThemeData(fontFamily: 'Calibri'),
//       home:Scaffold(
//         appBar: AppBar(
//           leading: IconButton(
//           icon: Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () => Navigator.pushNamed(context, '/Menu',arguments: {}),
//              ), 
//           centerTitle: true,
//           title:Text('Haftalık Yemek Listesi',
//             textAlign: TextAlign.center,
//             style:TextStyle(
//               color: Colors.black45,
//               fontWeight:FontWeight.w800,
//               fontSize: 30,
//             ),
//           ),
//           backgroundColor:Color.fromARGB(136, 252, 155, 155) ,
//         ),
//         body:Center(
         
//             child:Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: SingleChildScrollView(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
                
//                 IconButton(
//                     icon: Icon(Icons.save),
//                     iconSize: 72,
//                     onPressed: () {
//                       _createPDF();
//                     }),
//                       ListTile(
//             title: Text("Haftalık Yemek Listesini İndirmek İçin Tıklayınız.",
//              textAlign: TextAlign.center,
//             style:TextStyle(
//               color: Color.fromARGB(255, 255, 255, 255),
//               fontWeight:FontWeight.w800,
//               fontSize: 15,
//           backgroundColor:Color.fromARGB(134, 0, 0, 0)
//             ),
//             ),
//           ),
//               ],         
//               ),
//             )
//             ),
//         )
//       ),
//       );
//   }
// }

import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';


class yemeklistesi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: dosyaIslemleri(),
    );
  }
}

class dosyaIslemleri extends StatefulWidget {
  @override
  _dosyaIslemleriState createState() => _dosyaIslemleriState();
}

class _dosyaIslemleriState extends State {
  //dosyaYolunu oluşturulması

  Future<String> get getDosyaYolu async {
    Directory dosya = await getApplicationDocumentsDirectory();
    return dosya.path;
  }

  //Dosyanın oluşturulması
  Future get dosyaOlustur async {
    var dosyakonumu = await getDosyaYolu;
    return File(dosyakonumu + "/olusturulandosya.txt");
  }

  //dosyaya yazma işlemi
  Future dosyaYaz(String dosyaninIcerigi) async {
    var myDosya = await dosyaOlustur;

    return myDosya.writeAsString(dosyaninIcerigi);
  }

  //dosyayı okuma
  

   Future<String> okunacakDosya() async {
     
       var myDosya = await dosyaOlustur;

       String dosyaicergi = myDosya.readAsStringSync();
       return dosyaicergi;
     
   }

  // Future<String> okunacakDosya() async {
  //   try {
  //     var myDosya = await dosyaOlustur;

  //     String dosyaicergi = myDosya.readAsStringSync();
  //     return dosyaicergi;
  //   } catch (exception) {
  //     debugPrint("HATA :$exception");
  //   }
  // }

  //Form Field'dan Input alabilmemiz için controller yapısı
  TextEditingController mycontroller = TextEditingController();

  //Dosyaya yazılan veriyi ekranda gösterebilmek için gerekli degişken
  var gosterilecekDeger = "";

  //Snackbar'ı kullanabilmek için gerekli key
  var key = GlobalKey();


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        key: key,
       theme:ThemeData(fontFamily: 'Calibri'),
       home:Scaffold(
         appBar: AppBar(
           leading: IconButton(
           icon: Icon(Icons.arrow_back, color: Colors.black),
           onPressed: () => Navigator.pushNamed(context, '/Menu',arguments: {}),
              ), 
           centerTitle: true,
           title:Text('Haftalık Yemek Listesi',
             textAlign: TextAlign.center,
             style:TextStyle(
               color: Colors.black45,
               fontWeight:FontWeight.w800,
               fontSize: 30,
             ),
           ),
           backgroundColor:Color.fromARGB(136, 252, 155, 155) ,
         ),
        body: ListView(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: mycontroller,
                    maxLines: 3,
                    decoration: InputDecoration(
                        hintText:
                            "Güncel Yemek Listesini Giriniz.",
                        hintStyle: TextStyle(
                            letterSpacing: 2,
                            fontSize: 15,
                            color: Colors.orange,
                            fontStyle: FontStyle.italic,
                            decoration: TextDecoration.underline)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: _Yaz,
                        child: Text("Dosya'ya Yaz"),
                          style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 255, 102, 92)),)
                      ),
                      ElevatedButton(
                        onPressed: _Oku,
                        child: Text("Dosya'dan oku"),
                         style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 255, 102, 92)),)
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Container(
                        child: Text("$gosterilecekDeger"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ))
    );
  }

  void _Yaz() async {
    dosyaYaz(mycontroller.text.toString()).then((value) {
      setState(() {
        gosterilecekDeger=value.toString();
      });
      // key.currentState.showSnackBar(SnackBar(
      //   content: Text("Başarıyla kaydedildi"),
      //   duration: Duration(seconds: 5),
      // ));
    });
  }

  void _Oku() async {
    okunacakDosya().then((String deger) {
      setState(() {
        gosterilecekDeger = deger;
        debugPrint("$gosterilecekDeger");
      });
    });
  }
}