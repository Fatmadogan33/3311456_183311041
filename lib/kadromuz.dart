import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(kadromuz());
}


class kadromuz extends StatelessWidget {
  final _firestore = FirebaseFirestore.instance;
  TextEditingController isimController = TextEditingController();
  TextEditingController bransController = TextEditingController();

  @override
  Widget build(BuildContext context) {
      
    


    CollectionReference kadromuzRef = _firestore.collection('kadromuz');
     DocumentReference aliRef = kadromuzRef.doc('ali'); 

    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
          leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pushNamed(context, '/Menu',arguments: {}),
             ), 
          centerTitle: true,
          title:Text('Kadromuz',
            textAlign: TextAlign.center,
            style:TextStyle(
              color: Colors.black45,
              fontWeight:FontWeight.w800,
              fontSize: 30,
            ),
          ),
          backgroundColor:Color.fromARGB(136, 252, 155, 155) ,
        ),
      body: Center(
        child: Container(
          child: Column(
            children: [
              

              StreamBuilder<QuerySnapshot>(
                
                stream: kadromuzRef.snapshots(),

                
                builder: (BuildContext context, AsyncSnapshot asyncSnapshot) {
                  if (asyncSnapshot.hasError) {
                    return Center(
                        child: Text('Bir Hata Oluştu, Tekrar Deneyiniz'));
                  } else {
                    if (asyncSnapshot.hasData) {
                      List<DocumentSnapshot> listOfDocumentSnap =
                          asyncSnapshot.data.docs;
                      return Flexible(
                        child: ListView.builder(
                          itemCount: listOfDocumentSnap.length,
                          itemBuilder: (context, index) {
                            return Card(
                              child: ListTile(
                                title: Text(
                                    '${listOfDocumentSnap[index]['isim']}',
                                    style: TextStyle(fontSize: 24)),
                                subtitle: Text(
                                    '${listOfDocumentSnap[index]['brans']}',
                                    style: TextStyle(fontSize: 16)),
                                trailing: IconButton(
                                  icon: Icon(Icons.delete),
                                  onPressed: () async {
                                    await listOfDocumentSnap[index]
                                        .reference
                                        .delete();
                                  },
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }
                },
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 3.0, vertical: 90),
                child: Form(
                  child: Column(
                    children: [
                      TextFormField(
                        controller: isimController,
                        decoration:
                            InputDecoration(hintText: 'Doktor Adını Giriniz'),
                      ),
                      TextFormField(
                        controller: bransController,
                        decoration: InputDecoration(hintText: 'Branş Giriniz'),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              FloatingActionButton(
                 child: Text('Ekle'),
        onPressed: () async {
          print(isimController.text);
          print(bransController.text);

          Map<String, dynamic> kadromuzData = {
            'isim': isimController.text,
            'brans': bransController.text
          };

          await kadromuzRef.doc(isimController.text).set(kadromuzData);
        },
      ),
              
              FloatingActionButton(
               child: Text('Güncelle',style: TextStyle(fontSize: 10),),
        onPressed: () async {
          print(isimController.text);
          print(bransController.text);

          Map<String, dynamic> kadromuzData = {
            'isim': isimController.text,
            'brans': bransController.text
          };

          await kadromuzRef.doc(isimController.text).update(kadromuzData);
        },
              )
            ],
          ),
        )
     
    );
  }
}