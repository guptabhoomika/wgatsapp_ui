import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';
//import 'package:intl/intl.dart';

class CallScreen extends StatefulWidget {
  @override
  _CallScreenState createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> {
  @override
  Widget build(BuildContext context) {
    var now;
  return Scaffold
  ( body:
     Container(
        child: StreamBuilder(
        stream: Firestore.instance.collection('Calls').orderBy("Date",descending: true).snapshots(),
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
              String callId = snapshot.data.documents[index].data["callID"];
               now = snapshot.data.documents[index].data["Date"];
               DateTime dateTime = snapshot.data.documents[index].data["Date"].toDate();
               String dt = dateTime.day.toStringAsPrecision(1).toString() + "/"+ dateTime.month.toString() +"/"+ dateTime.year.toString()+ "," + " "+ dateTime.hour.toString()+":"+dateTime.minute.toString();
               

              return GestureDetector(onLongPress: (){
                print("Delete");
                Firestore.instance.collection('Calls').document(callId).delete();
                    
              },
               
              child: Chattile(name: snapshot.data.documents[index].data["text"],ca:snapshot.data.documents[index].data["ca"],time:dt));
            },
          );
        },
      ),
      ),
      floatingActionButton: FloatingActionButton(child: Icon(Icons.call),onPressed: _showcontent,
              
     
      ),

  );


      
  }

  void _showcontent() {
    String name;
    TextEditingController _textmessage = TextEditingController();
    showDialog<Null>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return new AlertDialog(
        title: new Text('Make A Call'),
        content: new SingleChildScrollView(
          child: new ListBody(
            children: <Widget>[
              //new Text('Enter Name'),
              TextFormField(
                    controller: _textmessage,
                      decoration: InputDecoration(isDense: true,
                        

                              hintText: "Enter Name",
                                //prefixIcon: Icon(Icons.tag_faces,size: 30,),
                                  //suffixIcon:    Icon(Icons.attach_file,size: 30,),
 

),
                  ),
            ],
          ),
        ),
        actions: <Widget>[
          new FlatButton(
            child: new Text('Ok'),
            onPressed: () {
              var uuid=Uuid().v4();
                    print("Call done");
                   

                    Firestore.instance.collection("Calls").document(uuid).setData({
                      "text": _textmessage.text,
                      "Date": DateTime.now(),
                      "isUser": false,
                      "callID" : uuid,
                      "ca" : _textmessage.text.substring(0,2).toUpperCase(),
                      

                    }).catchError((e){
print(e.toString());
 

                    }   
                    );Navigator.of(context).pop();
             
            },
          ),
        ],
      );
    },
  );
  //Navigator.of(context).pop();
}
     

}

class Chattile extends StatelessWidget {
  final String name,ca,time;
  Chattile({this.name,this.ca,this.time});
 
   @override
  Widget build(BuildContext context) {
    return 
      ListTile(
              leading: CircleAvatar(child: Text(ca)),
              title: Text(name,style: TextStyle(fontWeight: FontWeight.bold),),
              subtitle: Text(time),
              trailing: Icon(Icons.call)


              
              
              
            );
    
  }
}