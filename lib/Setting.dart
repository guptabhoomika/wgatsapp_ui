import 'package:flutter/material.dart';
import 'Profile_Page.dart';
class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Text("Settings"),
      backgroundColor: Color.fromRGBO(7, 94, 84, 1),
      ),
      
     body: Container(
      child: ListView(children: <Widget>[
      
                    //tag: Text("Bhoomika"),
                   ListTile(
            leading: CircleAvatar(child: Text("ME"),radius: 25),
            title: Text("Bhoomika",style:  TextStyle(fontWeight: FontWeight.bold),),
          
            subtitle: Text("Available"),
              onTap: (){
                 Navigator.push(context,MaterialPageRoute(builder: (context)=> ProfilePage(name: "ME") ));
              },


          ),
        
        Divider(thickness: 0.7),
        ListTile(
          leading: Icon(Icons.vpn_key,color: Color.fromRGBO(7, 94, 84,1),),
          title: Text("Account",style: TextStyle(fontWeight: FontWeight.bold),),
          subtitle: Text("Privacy, security, change number"),

        ),
        ListTile(
          leading: Icon(Icons.chat,color: Color.fromRGBO(7, 94, 84,1),),
          title: Text("Chats",style: TextStyle(fontWeight: FontWeight.bold),),
          subtitle: Text("Backup, history, wallpaper"),

        ),
         ListTile(
          leading: Icon(Icons.notifications,color: Color.fromRGBO(7, 94, 84,1),),
          title: Text("Notifications",style: TextStyle(fontWeight: FontWeight.bold),),
          subtitle: Text("Message, group, call tones"),

        ),
         ListTile(
          leading: Icon(Icons.data_usage,color: Color.fromRGBO(7, 94, 84,1),),
          title: Text("Data and storage usage",style: TextStyle(fontWeight: FontWeight.bold),),
          subtitle: Text("Network usage, auto-downlod"),

        ),
          ListTile(
          leading: Icon(Icons.help_outline,color: Color.fromRGBO(7, 94, 84,1),),
          title: Text("Help",style: TextStyle(fontWeight: FontWeight.bold),),
          subtitle: Text("FAQ,contact us,privacy policy"),

        ),
            Divider(thickness: 0.7),
            ListTile(
             leading: Icon(Icons.group_add,color: Color.fromRGBO(7, 94, 84,1),),
             title: Text("Invite a friend"),

            ),

      ],
      ),
    ),
    );
  }

  
}