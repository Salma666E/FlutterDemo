import 'package:flutter/material.dart';
import 'package:flutter_app_day01/models/post.dart';
import 'package:flutter_app_day01/services/postsService.dart';
import 'package:flutter_app_day01/views/mypage.dart';

class MyHome extends StatefulWidget {
  MyHome({Key key}) : super(key: key);

  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  // List cards = new List.generate(20, (i)=>new CustomCard()).toList();
  final List<String> entries = <String>[
    'https://i.ytimg.com/vi/fq4N0hgOWzU/maxresdefault.jpg',
    'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__340.jpg',
    'https://images.ctfassets.net/hrltx12pl8hq/6gefxWFu1cp4cECQE6qpRS/15f4228cb3a2265c990dbaf1304ecea2/shutterstock_1469674187.jpg?fit=fill&w=800&h=400'
  ];
  List<Post> postsList = new List();

  @override
  void initState() {
    super.initState();
    getPostFromsServer();
  }

  @override
  void dispose() {
    super.dispose();
  }

  getPostFromsServer() async {
    postsList = await PostService().getPosts();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Title Post",
            // style: TextStyle(backgroundColor: Color(0xFF673AB7)),
          ),
        ),
        body: ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: postsList.length,
            itemBuilder: (BuildContext context, int index) {
              return new Card(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MyPage(postsList[index].body)),
                    );
                  },
                  child: new Padding(
                    padding: new EdgeInsets.all(7.0),
                    child: new Text(
                      postsList[index].title,
                      style: new TextStyle(fontSize: 18.0),
                    ),
                  ),
                ),
              );
            })
            );
  }
}
