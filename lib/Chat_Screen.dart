import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:whatsapp_ui/chat_list.dart';
import 'package:uuid/uuid.dart';
import 'package:uuid/uuid_util.dart';
import 'package:emoji_picker/emoji_picker.dart';
class ChatScreen extends StatefulWidget {
  final String name;
  ChatScreen(this.name);
 
  @override
  _ChatScreenState createState() => _ChatScreenState();
  
}

class _ChatScreenState extends State<ChatScreen> {
  bool isShowSticker;
  @override
  void initState() {
    super.initState();
    isShowSticker = false;
  }
   Future<bool> onBackPress() {
    if (isShowSticker) {
      setState(() {
        isShowSticker = false;
      });
    } else {
      Navigator.pop(context);
    }

    return Future.value(false);
  }


   TextEditingController _textmessage = TextEditingController();
   
  
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      

        appBar: AppBar(
          backgroundColor: Color.fromRGBO(7, 94, 84, 1),
          
        
            
         
          automaticallyImplyLeading: false,
            

        
              
          title: Row(
            children: <Widget>[
            InkWell(
onTap: (){
  Navigator.of(context).pop();
},
                     
                                                      child: Container(
                padding: EdgeInsets.all(8),
                // color: Colors.red,
                width: 80,
                height: 50,
                decoration: BoxDecoration(
                  // color: Colors.red,
                  // border: Border.all(width: 2),
                  borderRadius: BorderRadius.circular(40)

                ),
child:    new Row(
  mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  
                  Icon(Icons.arrow_back),
                    CircleAvatar(child: Text("aa"),radius: 20,backgroundColor: Colors.white)

                ],
              ),
              
                          ),
            ),
           
              Text(widget.name)
            ],
          ),
          actions: <Widget>[
            IconButton(icon: Icon(Icons.video_call), onPressed: (){}),
            IconButton(icon: Icon(Icons.call), onPressed: (){}),
            IconButton(icon: Icon(Icons.more_vert), onPressed: (){})
          ],
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                child: StreamBuilder(
        stream: Firestore.instance.collection('Chats').orderBy("Date").snapshots(),
        //print an integer every 2secs, 10 times
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Text("Loading..");
          }
          // print(snapshot.data.documents.length);
          // print(snapshot.data.documents[0].data["text"]);
          return ListView.builder(
            itemExtent: 80.0,
            itemCount: snapshot.data.documents.length,
            itemBuilder: (context, index) {
              String chatId = snapshot.data.documents[index].data["chatID"];
              return GestureDetector(onLongPress: (){
                print("Delete");
                Firestore.instance.collection('Chats').document(chatId).delete();
              },  child: ChatMessage(snapshot.data.documents[index].data["text"], "2:30",snapshot.data.documents[index].data["isUser"]));
            },
          );
        },
      ),
              ),
            ),
            (isShowSticker ? buildSticker() : Container()),
           
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                
                Container(
                  width: MediaQuery.of(context).size.width *0.85,
                  child: TextFormField(
                    controller: _textmessage,
        decoration: InputDecoration(isDense: true,
  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(40))),

  hintText: "Type a message",
  prefixIcon: IconButton(icon: Icon(Icons.tag_faces),iconSize: 30,onPressed: (){ setState(() {
                    isShowSticker = !isShowSticker;
                  });
  }),
      
  suffixIcon:    Icon(Icons.attach_file,size: 30,),
 

),
                  ),
                ),

                CircleAvatar(
                  radius: 25,
                  child: IconButton(icon: Icon(Icons.send), onPressed: (){
                    var uuid=Uuid().v4();
                    print(_textmessage.text);
                   

                    Firestore.instance.collection("Chats").document(uuid).setData({
                      "text": _textmessage.text,
                      "Date": DateTime.now(),
                      "isUser": false,
                      "chatID" : uuid
                      

                    }).catchError((e){
print(e.toString());

                    });
                     _textmessage.clear();
                    // .setData({
                    //   "message":"Hello"
                    // });
                  }),
                )
              ],
            )
          ],
        ),
        
    );
   
     
  
  }
   Widget buildSticker() {
    return EmojiPicker(
  rows: 3,
  columns: 7,
  buttonMode: ButtonMode.MATERIAL,
  recommendKeywords: ["racing", "horse"],
  numRecommended: 10,
  onEmojiSelected: (emoji, category) {
    print(emoji);
  },
    );
  }
}


class ChatMessage extends StatelessWidget {
  final String text, time;
  bool isCurrentUser;
  ChatMessage(this.text,this.time,this.isCurrentUser);
  @override
  Widget build(BuildContext context) {
    return 
           Container(
         
    
          child: Row(
            mainAxisAlignment: isCurrentUser? MainAxisAlignment.end:MainAxisAlignment.start,
            children: <Widget>[
              Container(
                 decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15)  ,   
            color: isCurrentUser? Colors.amberAccent : Colors.redAccent,
            // color: Colors.green[300],
          ),
                padding: EdgeInsets.all(8),
             margin: EdgeInsets.all(8),
                child: Text(text,
                style: TextStyle(
                  fontSize: 22,
color: Colors.black,
                ),),
              ),
            ],
          ),
        
      
    );
  }
}