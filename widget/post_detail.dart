import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prc6/coummunity/community.dart';
import 'package:prc6/coummunity/create_page.dart';
import 'package:prc6/http_setup.dart';


class Post {
  final String title;
  final String content;

  Post({required this.title, required this.content});
}

class PostDetailPage extends StatefulWidget {
  final Post post;
  PostDetailPage({required this.post});

  @override
  State<PostDetailPage> createState() => _PostDetailPageState();

}


class _PostDetailPageState extends State<PostDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('게시물',style: TextStyle(color: Colors.lightBlue),),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.post.title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            SizedBox(height: 50.0),
            Text(
              widget.post.content,
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}


