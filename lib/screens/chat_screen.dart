import 'dart:ui';

import 'package:chatapp_ui/models/message_model.dart';
import 'package:chatapp_ui/models/user_model.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  final User user;
  ChatScreen({required this.user});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  _buildMessage(Message message, bool isMe) {
    final Container msg = Container(
      width: MediaQuery.of(context).size.width * 0.75,
      margin: isMe
          ? EdgeInsets.only(
              bottom: 8,
              left: 80,
              top: 8,
            )
          : EdgeInsets.only(
              top: 8.0,
              bottom: 8.0,
              // right: 80.0,
            ),
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      decoration: BoxDecoration(
        color: isMe ? Theme.of(context).accentColor : Color(0xffffefee),
        borderRadius: isMe
            ? BorderRadius.only(
                topLeft: Radius.circular(15),
                bottomLeft: Radius.circular(15),
              )
            : BorderRadius.only(
                topRight: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(message.time),
          SizedBox(height: 8),
          Text(
            message.text,
            style: TextStyle(
                fontSize: 16,
                color: Colors.blueGrey,
                fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
    if (isMe) {
      return msg;
    }
    return Row(
      children: [
        msg,
        IconButton(
            color: message.isLiked
                ? Theme.of(context).primaryColor
                : Colors.blueGrey,
            onPressed: () {},
            icon: message.isLiked
                ? Icon(Icons.favorite)
                : Icon(Icons.favorite_border_outlined)),
      ],
    );
  }

  _buildMessageComposer() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      height: 70,
      color: Colors.white,
      child: Row(
        children: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.photo,
                size: 30, color: Theme.of(context).primaryColor),
          ),
          Expanded(
            child: TextField(
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration.collapsed(
                hintText: 'Type a message',
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.send,
                size: 30, color: Theme.of(context).primaryColor),
          ),
        ],
      ),

      // color: Theme.of(context).accentColor,
      // child: Row(
      //   children: [
      //     IconButton(
      //       onPressed: () {},
      //       icon: Icon(Icons.photo,
      //           size: 30, color: Theme.of(context).primaryColor),
      //     ),
      //     IconButton(
      //       onPressed: () {},
      //       icon: Icon(Icons.send,
      //           size: 30, color: Theme.of(context).primaryColor),
      //     ),
      //     // TextField(),
      //   ],
      // ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Text(widget.user.name,
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_horiz, size: 30),
          ),
        ],
        elevation: 0,
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    )),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  child: ListView.builder(
                    reverse: true,
                    padding: EdgeInsets.only(top: 8),
                    itemCount: messages.length,
                    itemBuilder: (BuildContext context, int index) {
                      final Message message = messages[index];
                      final bool isMe = message.sender.id == currentUser.id;
                      return _buildMessage(message, isMe);
                    },
                  ),
                ),
              ),
            ),
            _buildMessageComposer(),
          ],
        ),
      ),
    );
  }
}
