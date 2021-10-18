import 'package:chatapp_ui/models/message_model.dart';
import 'package:chatapp_ui/screens/chat_screen.dart';
import 'package:flutter/material.dart';

class FvImages extends StatefulWidget {
  const FvImages({Key? key}) : super(key: key);

  @override
  _FvImagesState createState() => _FvImagesState();
}

class _FvImagesState extends State<FvImages> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      child: ListView.builder(
        padding: EdgeInsets.only(left: 10),
        scrollDirection: Axis.horizontal,
        itemCount: favorites.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => ChatScreen(user: favorites[index]))),
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 35,
                    backgroundImage: AssetImage(favorites[index].imageUrl),
                  ),
                  SizedBox(height: 5),
                  Text(
                    favorites[index].name,
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
