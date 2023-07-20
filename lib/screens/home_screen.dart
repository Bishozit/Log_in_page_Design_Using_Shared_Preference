import 'package:autologin/controller/auth_controller.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final List<Map<String, String>> _itemList = [
    {
      "food_image":
          "https://th.bing.com/th?id=OIP.RWaaZCnAJwE8O0FxwD7y0AHaEo&w=316&h=197&c=8&rs=1&qlt=90&o=6&pid=3.1&rm=2",
      "food_title": " Pizza"
    },
    {
      "food_image":
          "https://th.bing.com/th?id=OIP.h7UYfFzZLt46PpSyWsCM-gHaFv&w=283&h=220&c=8&rs=1&qlt=90&o=6&pid=3.1&rm=2",
      "food_title": "Burger"
    },
    {
      "food_image":
          "https://uploads-ssl.webflow.com/5c481361c604e53624138c2f/5c579defb111ce565802f348_egg-roll-website_-thumbnail-_h4tzx1.png",
      "food_title": "Egg roll"
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 6, 0, 15),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(63, 17, 1, 1),
        elevation: 0,
        centerTitle: true,
        title: Text("Food Details"),
        actions: [
          IconButton(
              onPressed: () {
                AuthController.logOut();
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            color: Color.fromARGB(255, 6, 0, 15),
            elevation: 10,
            child: Container(
              height: 230,
              child: Column(
                children: [
                  Container(
                    height: 200,
                    width: double.infinity,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5),
                      ),
                      child: Image.network(
                        '${_itemList[index]['food_image']}',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    '${_itemList[index]['food_title']}',
                    style: TextStyle( fontSize: 18, color: Colors.white),
                  )
                ],
              ),
            ),
          );
        },
        itemCount: _itemList.length,
      ),
    );
  }
}
