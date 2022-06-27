import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

void main() {
  runApp(nobetcihemsirelerlistesi());
}


class nobetcihemsirelerlistesi extends StatefulWidget {
  @override
  _nobetcihemsirelerlistesiState createState() => _nobetcihemsirelerlistesiState();
}
class _nobetcihemsirelerlistesiState extends State<nobetcihemsirelerlistesi> {
 
  File? imageFile;

  void _getFromGallery() async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxHeight: 1080,
      maxWidth: 1080,);


    setState(() {
      imageFile= File(pickedFile!.path);
    });  
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
          leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pushNamed(context, '/Menu',arguments: {}),
             ), 
          centerTitle: true,
          title:Text('Nöbetçi Hemşireler Listesi',
            textAlign: TextAlign.center,
            style:TextStyle(
              color: Colors.black45,
              fontWeight:FontWeight.w800,
              fontSize: 30,
            ),
          ),
          backgroundColor:Color.fromARGB(136, 252, 155, 155) ,
        ),
        body: ListView (
          children: [
            SizedBox (height: 50,),
            imageFile != null?

            Container(
              child: Image.file(imageFile!),
              ):
              Container(
                child: Icon (
                  Icons.camera_enhance_rounded,
                  color: Colors.blue,
                  size: MediaQuery.of(context).size.width*.2,
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(30.0),
                child: ElevatedButton(child: Text('Galeriden Fotoğraf Seçin'),
                 onPressed:() {
                  _getFromGallery();
                 },
                 style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 54, 158, 206)),
                  padding: MaterialStateProperty.all(EdgeInsets.all(12)),
                  textStyle: MaterialStateProperty.all(TextStyle(fontSize:16))
                 ))

                )
          ],
          
            ));

            
  }

  
 

  
}


/* import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

void main() {
  runApp(images());
}


class images extends StatefulWidget {
  @override
  _imagesState createState() => _imagesState();
}
class _imagesState extends State<images> {
 
  File? imageFile;

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
          leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pushNamed(context, '/Menu',arguments: {}),
             ), 
          centerTitle: true,
          title:Text('Nöbetçi Hemşireler Listesi',
            textAlign: TextAlign.center,
            style:TextStyle(
              color: Colors.black45,
              fontWeight:FontWeight.w800,
              fontSize: 30,
            ),
          ),
          backgroundColor:Color.fromARGB(136, 252, 155, 155) ,
        ),
        body: Container(
          
            child: imageFile == null
                ? Container(
              color: Color.fromARGB(255, 135, 155, 163),
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    color: Color.fromARGB(255, 77, 156, 202),
                    onPressed: () {
                      _getFromGallery();
                    },
                    child: Text("Galeriden Seç"),
                  ),
                  Container(
                    height: 40.0,
                  ),
                  RaisedButton(
                    color: Color.fromARGB(255, 77, 156, 202),
                    onPressed: () {
                      _getFromCamera();
                    },
                    child: Text("Kamera ile Çek"),
                  )
                ],
              ),
            ): Container(
              child: Image.file(
                imageFile!,
                fit: BoxFit.cover,
              ),
            )));

            
  }

  
  _getFromGallery() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }

  _getFromCamera() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }
} */