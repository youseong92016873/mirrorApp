import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prc6/coummunity/community.dart';
import 'package:prc6/coummunity/create_page.dart';
import 'package:prc6/http_setup.dart';
import 'package:get/get.dart';




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
        // leading: IconButton(
        //   icon: Icon(
        //     Icons.arrow_back,
        //     color: Colors.black, // 원하는 색상으로 변경
        //   ),
        //   onPressed: () {
        //     Get.back();
        //     // 뒤로가기 동작
        //   },
        // ),
        // centerTitle: true,
        title: Text(
           widget.post.title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
            color: Colors.black
          ),
        ),
        backgroundColor: Colors.white ,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

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


