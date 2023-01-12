
import 'package:flutter/material.dart';

import 'main.dart';

import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'dart:io';


Future<void> saveAndLaunchFile(List<int> bytes, String fileName) async {
  final path = (await getExternalStorageDirectory())?.path;
  final file = File('$path/$fileName');
  await file.writeAsBytes(bytes, flush: true);
  OpenFile.open('$path/$fileName');
}

Future<void> _createPDF() async {
    PdfDocument document = PdfDocument();
    final page = document.pages.add();
    PdfGrid grid = PdfGrid();
    grid.style = PdfGridStyle(
        font: PdfStandardFont(PdfFontFamily.helvetica, 30),
        cellPadding: PdfPaddings(left: 5, right: 2, top: 2, bottom: 2));
    grid.columns.add(count: 3);
    grid.headers.add(1);
    PdfGridRow header = grid.headers[0];
    header.cells[0].value = 'Günler';
    header.cells[1].value = 'Yemekler';
    header.cells[2].value = 'Toplam Kalori';

    PdfGridRow row = grid.rows.add();
    row.cells[0].value = 'Pazartesi';
    row.cells[1].value = 'Etli Nohut / Şehriyeli Pirinç Pilavı / Peynir Tatlısı ';
    row.cells[2].value = '965 kcal';

    row = grid.rows.add();
    row.cells[0].value = 'Salı';
    row.cells[1].value = 'Fırın Tavuk-Patates / Kremalı Tavuk Çorba / Ayran';
    row.cells[2].value = '883 kcal';

    row = grid.rows.add();
    row.cells[0].value = 'Çarşamba';
    row.cells[1].value = 'Terbiyeli Köfte / Soslu Makarna / Mevsim Salata';
    row.cells[2].value = '706 kcal';

    row = grid.rows.add();
    row.cells[0].value = 'Perşembe';
    row.cells[1].value = 'Ispanaklı Tavuk Sarma / Mercimekli Bulgur Pilavı / Yoğurt';
    row.cells[2].value = '766 kcal';
    
    row = grid.rows.add();
    row.cells[0].value = 'Cuma';
    row.cells[1].value = 'Yoğurtlu Kıymalı Ispanak / Peynirli Tepsi Böreği / Aşure';
    row.cells[2].value = '1197 kcal';

    grid.draw(page: page, bounds: const Rect.fromLTWH(0, 0, 0, 0));

    List<int> bytes = await document.save();
    document.dispose();
    saveAndLaunchFile(bytes, 'Cikti.pdf');
  }
class yemeklistesi extends StatelessWidget {
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
        body:Center(
         
            child:Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                
                IconButton(
                    icon: Icon(Icons.save),
                    iconSize: 72,
                    onPressed: () {
                      _createPDF();
                    }),
                      ListTile(
            title: Text("Haftalık Yemek Listesini İndirmek İçin Tıklayınız.",
             textAlign: TextAlign.center,
            style:TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
              fontWeight:FontWeight.w800,
              fontSize: 15,
          backgroundColor:Color.fromARGB(134, 0, 0, 0)
            ),
            ),
          ),
              ],         
              ),
            )
            ),
        )
      ),
      );
  }
}