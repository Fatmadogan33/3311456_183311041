import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:convert';
import 'model/loadData.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


void main() {
  runApp(hastayorumlari());
}


Future <List<loadData>> fetchloadData() async {
  final response = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));
      
 if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => new loadData.fromJson(data)).toList();
  } else {
    throw Exception('Unexpected error occured!');
  }
}
Future<loadData> createloadData(String title) async {
  final response = await http.post(
    Uri.parse('https://jsonplaceholder.typicode.com/albums'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'title': title,
    }),
  );

  if (response.statusCode == 201) {
    return loadData.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to create album.');
  }
}
class _MyAppState extends State<hastayorumlari> {
  final TextEditingController _controller = TextEditingController();
  Future<loadData>? _futureAlbum;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
       
        body: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8.0),
          child: (_futureAlbum == null) ? buildColumn() : buildFutureBuilder(),
        ),
      ),
    );
  }

  Column buildColumn() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TextField(
          controller: _controller,
          decoration: const InputDecoration(hintText: 'Yorum Giriniz'),
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              _futureAlbum = createloadData(_controller.text);
            });
          },
          child: const Text('Yorum oluşturuldu'),
        ),
      ],
    );
  }

  FutureBuilder<loadData> buildFutureBuilder() {
    return FutureBuilder<loadData>(
      future: _futureAlbum,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text(snapshot.data!.title);
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        return const CircularProgressIndicator();
      },
    );
  }
}
 class hastayorumlari extends StatefulWidget {
  const hastayorumlari({Key? key}) : super(key: key);
  


  @override
  _hastayorumlariState createState() => _hastayorumlariState();
}

class _hastayorumlariState extends State<hastayorumlari> {
  Future <List<loadData>>? futureloadData;

  @override
   void initState() {
    super.initState();
    futureloadData = fetchloadData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pushNamed(context, '/Menu',arguments: {}),
             ), 
          centerTitle: true,
          title:Text('Hasta Yorumları',
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
          
          child: FutureBuilder <List<loadData>>(
            future: futureloadData,
            builder: (context, snapshot) {
             if (snapshot.hasData) {
                List<loadData>? data = snapshot.data;
                return 
                ListView.builder(
                
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 75,
                    color: Colors.white,
                    child: Center(child: Text(data![index].title),
                  ),);
                }
              );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
} 




