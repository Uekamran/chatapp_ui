import 'package:chatapp_ui/widgets/category_selector.dart';
import 'package:chatapp_ui/widgets/favorite_contacts.dart';
import 'package:chatapp_ui/widgets/fv_images.dart';
import 'package:chatapp_ui/widgets/recent_chats.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.menu, size: 30),
        ),
        title: Text(
          "Chats",
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search, size: 30),
          ),
        ],
      ),
      body: Column(
        children: [
          CategorySelector(),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  children: [
                    FavoriteContacts(),
                    FvImages(),
                    RecentChats(),
                   
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
