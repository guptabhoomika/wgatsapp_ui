import 'package:flutter/material.dart';
import 'package:whatsapp_ui/Chat_Screen.dart';
import 'package:whatsapp_ui/Emoji.dart';
import 'package:whatsapp_ui/main.dart';
class chatlist_scrren extends StatefulWidget {
  @override
  _chatlist_scrrenState createState() => _chatlist_scrrenState();
}

class _chatlist_scrrenState extends State<chatlist_scrren> {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     body: Container(
        child: ListView(
          children: <Widget>[
            
            Chattile(name: "MOM",ca:"MM"),
            Divider(thickness: 0.3),
            Chattile(name: "Papa",ca:"PA"),
            Divider(thickness: 0.3),
            Chattile(name: "Manu",ca:"SG"),
            Divider(thickness: 0.3),
            Chattile(name:"Akruti",ca:"AS"),
            Divider(thickness: 0.3),
            Chattile(name: "Ayush",ca: "AA"),
            Divider(thickness: 0.3),
            Chattile(name: "Swati",ca:"SK"),
            Divider(thickness: 0.3),

            
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        
        child: Icon(Icons.message)
      ),

   );

     
      
  }
   
}

class Chattile extends StatelessWidget {
  final String name,ca;
  Chattile({this.name,this.ca});
 
   @override
  Widget build(BuildContext context) {
    return 
      ListTile(
              leading: CircleAvatar(child: Text(ca)),
              onTap: (){
                Navigator.push(context,MaterialPageRoute(builder: (context)=> ChatScreen(name) ));
              },
              title: Text(name,style: TextStyle(fontWeight: FontWeight.bold),),
              subtitle: Text("Chat...."),
              trailing: 
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: new Column(
                    
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Text("12:45",style: TextStyle(fontSize: 10,color: Colors.grey)),
                      ),
      
                      CircleAvatar(backgroundColor: Colors.lightGreen,radius: 9.5,child: Text("10",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 9,color: Colors.white),),),
                      //Divider(thickness: 0.7),
                    ],
                  ),
                  
                )

                  
              )
              

              
              
              
            );
    
  }
}