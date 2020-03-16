import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
class ProfilePage extends StatefulWidget {
  final String name;
  ProfilePage({this.name});
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
     File _image;
      TextEditingController _textmessage = TextEditingController();

  Future getImageCam() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = image;
    });
  }
     File _image1;

  Future getImageGal() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image1 = image;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        backgroundColor: Color.fromRGBO(7, 94, 84, 1),
      ),
      body: Container(
        
        child: Column(
          
          children: <Widget>[
             SizedBox(
          width: 300,
          height: 200,
          child: Stack(children: <Widget>[
            Positioned(
              top: 30,
              //right: 60,
              left: 100,
              //bottom: 20,
              child:CircleAvatar(backgroundColor: Colors.lightGreen,radius:50,child: Text(widget.name,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white),),),
               //child: Text("AA"),
            ),
            
            //CircleAvatar(backgroundColor: Colors.lightGreen,child: Text("10",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 9,color: Colors.white),),),
              Positioned(
                 top: 95,
                 right: 100,
                child: CircleAvatar(backgroundColor: Colors.red,child: IconButton(icon: Icon(Icons.camera_alt), onPressed: (){
                  showModalBottomSheet(context: context, builder:(context){
                    return Container(
                      height: MediaQuery.of(context).size.height *0.25,
                      child: Column(
                        
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Align(
                              alignment: Alignment.bottomLeft,
                              child: Text("  Profile photo",style: TextStyle(fontSize: 20,color: Colors.black87),)
                              ),
                          ),
                            Text(""),
                          Row(
                        children: <Widget>[
                          Padding(padding: const EdgeInsets.all(8.0)),

                          Padding(
                            padding: const EdgeInsets.all(8.0),
                           child: Column(children: <Widget>[
                                
                                CircleAvatar(child: IconButton(icon: Icon(Icons.delete,size: 25,color: Colors.white,), onPressed: (){print("Delete");}),radius: 25,backgroundColor: Colors.red[300],),
                                Text("Remove",style: TextStyle(color: Colors.grey),),
                                Text("Photo",style: TextStyle(color: Colors.grey),)
                            ],)
                            //child: 
                          ),
                        
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: <Widget>[
                                CircleAvatar(child: IconButton(icon: Icon(Icons.add_photo_alternate,size: 25,color: Colors.white,), onPressed: getImageGal),radius: 25,backgroundColor: Colors.purple[300],),
                                Text("Gallery",style: TextStyle(color: Colors.grey),),
                                Text("")
                              ],
                            ),
                            //child: CircleAvatar(child: IconButton(icon: Icon(Icons.add_photo_alternate,size: 25,color: Colors.white,), onPressed: getImageGal),radius: 25,backgroundColor: Colors.purple[300],),
                          ),
                         
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: <Widget>[
                                CircleAvatar(child: IconButton(icon: Icon(Icons.camera_alt,size:25,color: Colors.white,), onPressed: getImageCam),radius:25,backgroundColor: Colors.deepOrange,),
                                Text("Camera",style: TextStyle(color: Colors.grey),),
                                Text("")
                              ],
                            ),
                            //child: CircleAvatar(child: IconButton(icon: Icon(Icons.camera_alt,size:25,color: Colors.white,), onPressed: getImageCam),radius:25,backgroundColor: Colors.deepOrange,),
                          ),

                                         

                                         
                          
                          
                        ],
                          ),
                        ],

                      ),
                    );


                    
                  });
                })),

              ),
              //CircleAvatar(backgroundColor: Colors.lightGreen,child: Text("10",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 100,color: Colors.white),),),
          ],
          ),
        ),
                
          ListTile(
            leading: Icon(Icons.person,size: 30,color: Color.fromRGBO(7,94,84, 1),),
           
            title: Text("Name",style: TextStyle(fontSize: 12,color: Colors.grey[700]),),
            subtitle: Align(
                              alignment: Alignment.bottomLeft,
                          child: Container(
                child: Column(
                  children: [
          Align(
                         alignment: Alignment.bottomLeft,
                            child: Text("Bhoomika",style: TextStyle(color: Colors.black),),
                  ),
                   Align(
                        alignment: Alignment.bottomLeft,
                          child: Text(" ",style: TextStyle(color: Colors.grey[700],fontSize: 10),),
                ),
          Align(
                        alignment: Alignment.bottomLeft,
                          child: Text("This is not your username or pin.This name wil be visible to your Whatsapp Contacts.",style: TextStyle(color: Colors.grey[700],fontSize: 11),),
                ),
                
                  ],

                ),

              ),
            ),
            trailing: Icon(Icons.edit),
            onTap: (){showModalBottomSheet(context: context, builder:(context){
                    return Container(
                      height: MediaQuery.of(context).size.height*200,
                      
                      child: Column( children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Text("Enter your name")
                            ),
                        ),
                        
                            TextFormField(
                              
  
                          autofocus: true,
  
                        
  
                          controller: _textmessage,
                          decoration: InputDecoration(
                            isDense: true,
                            hintText: "Type your name",
                            suffixIcon: Icon(Icons.tag_faces,size: 30,)

                          ),
  
  
  
                        ),
                        Row(children: <Widget>[
                          Text("Cancel"),
                          Text("Save")
                        ],)
                              ],
                        ),
                     
                    );

                    
                  });}

              
            

          ),
            Divider(thickness: 0.3,color: Colors.grey,indent: 75),
          ListTile(
           leading: Icon(Icons.info_outline,size: 30,color: Color.fromRGBO(7,94,84, 1),),
           
            title: Text("About",style: TextStyle(fontSize: 12,color: Colors.grey[700]),),
            subtitle: Text("Available",style: TextStyle(color: Colors.black),),
             trailing: Icon(Icons.edit),
          ),
           Divider(thickness: 0.3,color: Colors.grey,indent: 75),
          ListTile(
             leading: Icon(Icons.call,size: 30,color: Color.fromRGBO(7,94,84, 1),),
           
            title: Text("Phone",style: TextStyle(fontSize: 12,color: Colors.grey[700]),),
            subtitle: Text("+91 74570 30549",style: TextStyle(color: Colors.black),),
             //trailing: Icon(Icons.edit),

          ),


        

          ],

        

      
        ),
        

        
      ),
      );
  }
}