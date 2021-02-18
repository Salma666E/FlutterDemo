import 'package:flutter/material.dart';

class MyPage extends StatelessWidget {
  String postBody;
  MyPage(this.postBody);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Body Post",
            // style: TextStyle(backgroundColor: Color(0xFF673AB7)),
          ),
        ),
        body: Container(
          child: new Padding(
            padding: new EdgeInsets.all(7.0),
            child: new Text(
              this.postBody,
              style: new TextStyle(fontSize: 18.0),
            ),
          ),
        ));
  }
}
