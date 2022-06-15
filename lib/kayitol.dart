import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui';


import 'Service/auth.dart';
import 'giris.dart';
import 'main.dart';
void main() {
  runApp(Kayitol());
}
class Kayitol extends StatefulWidget {
  @override
  _KayitolState createState() => _KayitolState();
}

class _KayitolState extends State<Kayitol> {
  
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordAgainController =TextEditingController();

   AuthService _authService=AuthService(); 

  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return Scaffold(
      body:Stack(
        children: [
          Center(child:Padding(
              padding:const EdgeInsets.symmetric(horizontal:10.0),
              child:Container(
                height:size.height*.7,
                width:size.width*.85,
                decoration: BoxDecoration(
                    color:Color.fromARGB(136, 252, 155, 155),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    boxShadow:[
                      BoxShadow(
                          color:Colors.grey.withOpacity(0.75),
                          blurRadius: 10,
                          spreadRadius: 2
                      )
                    ]
                ),
                child: Padding(
                    padding: const EdgeInsets.all(10),
                    child:Center(
                        child:Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:[
                             
                              SizedBox(height: size.height*0.02,),
                              TextField(
                                controller: _emailController,
                                style:TextStyle(
                                  color:Colors.white,
                                ),
                                cursorColor:Colors.white,
                                keyboardType:TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  prefixIcon:Icon(
                                    Icons.mail,
                                    color:Color.fromARGB(221, 81, 140, 228),
                                  ),
                                  hintText:'E-Mail',
                                  prefixText: ' ',
                                  hintStyle: TextStyle(
                                      color:Colors.white),
                                  focusColor:Colors.white,
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide:BorderSide(
                                        color:Colors.white,
                                      )
                                  ),
                                  enabledBorder:UnderlineInputBorder(
                                      borderSide:BorderSide(
                                        color:Colors.white,
                                      )
                                  ),
                                ),
                              ),
                              SizedBox(
                                height:size.height*0.02,
                              ),
                              TextField(
                                  style:TextStyle(
                                    color:Colors.white,),
                                  cursorColor: Colors.white,
                                  controller:_passwordController,
                                  obscureText:true,
                                  decoration:InputDecoration(
                                      prefixIcon:Icon(
                                        Icons.vpn_key,
                                        color:Colors.white,
                                      ),
                                      hintText:'Şifre',
                                      prefixText:' ',
                                      hintStyle: TextStyle(color:Colors.white),
                                      focusColor:Colors.white,
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide:BorderSide(
                                            color:Colors.white,
                                          )
                                      ),
                                      enabledBorder: UnderlineInputBorder(
                                          borderSide:BorderSide(
                                            color:Colors.white,
                                          )
                                      )
                                  )
                              ),
                              SizedBox(
                                height:size.height*0.02,
                              ),
                              TextField(
                                  style:TextStyle(
                                    color:Colors.white,),
                                  cursorColor: Colors.white,
                                  controller:_passwordAgainController,
                                  obscureText:true,
                                  decoration:InputDecoration(
                                      prefixIcon:Icon(
                                        Icons.vpn_key,
                                        color:Colors.white,
                                      ),
                                      hintText:'Şifre Tekrar',
                                      prefixText:' ',
                                      hintStyle: TextStyle(color:Colors.white),
                                      focusColor:Colors.white,
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide:BorderSide(
                                            color:Colors.white,
                                          )
                                      ),
                                      enabledBorder: UnderlineInputBorder(
                                          borderSide:BorderSide(
                                            color:Colors.white,
                                          )
                                      )
                                  )
                              ),
                              SizedBox(
                                height:size.height*0.08,
                              ),
                                InkWell(
                                  onTap:(){
                                    _authService
                                       .createPerson(
                                        _emailController.text, _passwordController.text).then((value){
                                      return Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>Giris()));
                                    });
                                  },
                                  child:Container(
                                      padding:EdgeInsets.symmetric(vertical:5),
                                      decoration:BoxDecoration(
                                          border:Border.all(color:Colors.white,
                                              width:2),
                                          borderRadius:BorderRadius.all(Radius.circular(30))),
                                      child:Padding(
                                          padding:const EdgeInsets.all(5.0),
                                          child:Center(
                                              child:Text(
                                                  "Kaydet",
                                                  style:TextStyle(
                                                    color:Colors.white,fontSize:20,
                                                  )
                                              )
                                          )
                                      )
                                  )

                              ) 
                            ]
                        )
                    )
                ),

              )
          )),
          Padding(
              padding:EdgeInsets.only(top:size.height*0.06,left:size.width*0.02),
              child:Align(
                  alignment: Alignment.topLeft,
                  child:Row(
                      children:[
                        IconButton(
                            onPressed:()=>Navigator.pop(context),
                            icon:Icon(
                              Icons.arrow_back_ios_outlined,
                              color:Colors.black26.withOpacity(0.75),
                              size:25,
                            )
                        ),
                        SizedBox(width:size.width*0.3,),
                        Text("Kayıt Ol",
                        textAlign: TextAlign.center,
                          style:TextStyle(
                              fontSize:20,
                              color:Colors.black26.withOpacity(0.75),
                              fontWeight:FontWeight.bold),
                        )
                      ]
                  )
              )
          )
        ],
      ),
    );
  }
}
