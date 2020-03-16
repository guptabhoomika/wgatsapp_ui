import 'package:flutter/material.dart';
import 'package:whatsapp_ui/CallScreen.dart';
import 'package:whatsapp_ui/Cam.dart';
import 'package:whatsapp_ui/GetContacts.dart';
import 'package:whatsapp_ui/Setting.dart';
import 'package:whatsapp_ui/StatusScreen.dart';
import 'package:whatsapp_ui/chat_list.dart';
import 'package:whatsapp_ui/constants.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      //title: 'Flutter Demo',
      theme: ThemeData(
     
        primarySwatch: Colors.teal,
      ),
      home: MyHomePage(title: 'WhatsApp'),
    );
  }
}
List<Text> choices = <Text>[
    new Text("WhatsApp Web"),
    new Text("Settings")

  ];

class MyHomePage extends StatefulWidget {
   
  MyHomePage({Key key, this.title} ) : super(key: key);

    
     
    
      final String title;
    
      @override
      _MyHomePageState createState() => _MyHomePageState();
    }
 

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin{

  TabController _tabController;
  @override
  void initState()
  {
    super.initState();
    _tabController = new TabController(length: 4, vsync: this,initialIndex: 1);
  }




  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
         backgroundColor: Color.fromRGBO(7, 94, 84, 1),
        
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: (){}),
         PopupMenuButton<String>(
            onSelected: ChoiceACtion,
            itemBuilder: (BuildContext context){
              return Constants.choices.map((String choice){
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          )
             
          
          
        

          
        ],
        elevation: 0.7,
        bottom: new TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          tabs: <Widget>[
            new Tab(icon: new Icon(Icons.camera_alt)),
            new Tab(text:  "CHATS"),
            new Tab(text: "STATUS"),
            new Tab(text: "CALLS")

          ],


        ),  
      ),
      body: TabBarView(
        
      
        controller: _tabController,
      children: <Widget>[
    
        
        CamScreen(),
        chatlist_scrren(),
        StatusScreen(),
        //AccessContacts(),
        CallScreen()


],
        
       
      
 
      
      ),
      );
    
        
    
  
}
    void ChoiceACtion(String choice)
    {
      if(choice == "Settings")
      {
       
                Navigator.push(context,MaterialPageRoute(builder: (context)=> Settings()) );
             
      }
    }

}