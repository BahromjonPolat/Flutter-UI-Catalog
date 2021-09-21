import 'package:flutter/material.dart';
import 'package:flutter_ui/pages/friendship/models/user_model.dart';

class MockChat extends StatelessWidget {
  User user;
  Size _size;

  MockChat({Key key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: _setAppBar(title: user.name),
      bottomNavigationBar: _sendMessage(),
      body: _chatBody(context),
    );
  }

  _chatBody(BuildContext context) {
    return ListView.builder(
        reverse: true,
        itemCount: _chats.length,
        itemBuilder: (context, index) {
          String message = _chats[index];
          return Container(
            alignment:
                index % 2 == 0 ? Alignment.centerLeft : Alignment.centerRight,
            child:
                index % 2 == 0 ? _inputMessage(message) : _sentMessage(message),
          );
        });
  }

  _sendMessage() => SizedBox(
        height: _size.height * 0.1,
        width: _size.width,
        child: Card(
          elevation: 6.0,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                  height: _size.height * 0.06,
                  width: _size.width * 0.8,
                  child: TextField()),
              SizedBox(
                  height: _size.width * 0.1,
                  width: _size.width * 0.1,
                  child: IconButton(
                    icon: Icon(
                      Icons.send,
                      color: Colors.teal,
                    ),
                    onPressed: () {},
                  ))
            ],
          ),
        ),
      );

  _sentMessage(String message) => Container(
        width: _size.width * 0.6,
        margin: EdgeInsets.symmetric(vertical: 6.0, horizontal: 16.0),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
        child: Text(message),
        decoration: BoxDecoration(
            color: Colors.teal,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.0),
              topRight: Radius.circular(16.0),
              bottomLeft: Radius.circular(16.0),
            )),
      );

  _inputMessage(String message) => Card(
        margin: EdgeInsets.symmetric(vertical: 6.0, horizontal: 16.0),
        child: Container(
          width: _size.width * 0.6,
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
          child: Text(message),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular(16.0),
                bottomRight: Radius.circular(16.0),
              )),
        ),
      );

  List<String> _chats = [
    "Hello",
    "Hello?",
    "How are you?",
    "I'm fine, thanks, and you?",
    "I am fine too",
    "What are you donig?",
    "I am in exam",
    "Oh, it is not difficult?",
    "No, It is very easy",
    "Nice, good luck",
    "Thank you bro",
    "You are welcome"
  ];

  AppBar _setAppBar({String title}) => AppBar(
        backgroundColor: Colors.teal,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          title,
          style: TextStyle(color: Colors.teal.shade100),
        ),
      );
}
