import 'package:flutter/material.dart';

class UserScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => {Navigator.pop(context)},
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black45,
          ),
        ),
        title: Text('Profile', style: TextStyle(color: Colors.black45)),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          SizedBox(height: 15),
          CircleAvatar(
            backgroundColor: Colors.black12,
            maxRadius: 100,
            child: Icon(
              Icons.account_circle,
              size: 200,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              children: [
                Text("Morteza Kolivand",
                    style: TextStyle(color: Colors.black45, fontSize: 40)),
                Text("Estonia, Tallinn",
                    style: TextStyle(color: Colors.black38, fontSize: 20)),
                SizedBox(
                  height: 10,
                ),
                Text("Joined on 2022/01/19",
                    style: TextStyle(color: Colors.black26, fontSize: 16)),
                SizedBox(
                  height: 15,
                ),
                Divider(),
                SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
