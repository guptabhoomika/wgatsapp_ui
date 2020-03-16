import 'package:flutter/material.dart';
class StatusScreen extends StatefulWidget {
  @override
  _StatusScreenState createState() => _StatusScreenState();
}

class _StatusScreenState extends State<StatusScreen> {
  @override
  Widget build(BuildContext context) {
    
  return Scaffold(
    body:
    Padding(
      padding: const EdgeInsets.symmetric(),
      child: Container(
          child: ListView(
            children: <Widget>[
              ListTile(
                leading: CircleAvatar(child: Icon(Icons.add)),
                title: Text("My Status",style: TextStyle(fontWeight: FontWeight.bold),),
                subtitle: Text("Click Here to add a status"),
                //trailing: Icon(Icons.call)


                
                
                
              ),
            
              chattile(name: "MOM",ca:"MM"),
              chattile(name: "Papa",ca:"PA"),
              chattile(name:"Akruti",ca:"AS"),
              chattile(name: "Ayush",ca: "AA"),
              chattile(name: "Swati",ca:"SK")

              
            ],
          ),

        ),
    ),
      floatingActionButton: FloatingActionButton(
      onPressed: (){},
      child: 
     Icon(Icons.add_a_photo)),
     
    
  );
      
  }
}

class chattile extends StatelessWidget {
  String name,ca;
  chattile({this.name,this.ca});
 
   @override
  Widget build(BuildContext context) {
    return 
      ListTile(
              leading: CircleAvatar(child: Text(ca)),
              title: Text(name,style: TextStyle(fontWeight: FontWeight.bold),),
              subtitle: Text("Today,8:50 pm"),
              //trailing: Icon(Icons.call)


              
              
              
            );
     
    
  }
}