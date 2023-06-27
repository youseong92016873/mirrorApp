import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:prc6/widget/post_detail.dart';
import 'package:http/http.dart' as http;
import '../http_setup.dart';
import 'package:prc6/coummunity/create_page.dart';
import 'package:get_storage/get_storage.dart';
import 'package:prc6/user/signup_form.dart';


class Post {
  String title;
  String content;

  Post({required this.title, required this.content});

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'content': content,
    };
  }

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      title: json['title'],
      content: json['content'],
    );
  }
}

class CommunityPage extends StatefulWidget {
  const CommunityPage({Key? key}) : super(key: key);
  @override
  _CommunityPageState createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  List<Post> posts = []; // 게시물 목록
  final box = GetStorage(); // GetStorage 인스턴스

  @override
  void initState() {
    super.initState();
    // 앱 시작 시 저장된 게시물을 가져옴
    List<dynamic>? savedPosts = box.read('posts');
    if (savedPosts != null) {
      // 저장된 게시물을 List<Post>로 변환
      posts.addAll(savedPosts.map((post) => Post.fromJson(post)).toList());
    }
  }

  Future<void>postlistUser(BuildContext context) async {
    var jsonResponse;
    Map<String, dynamic> data = {
      'title': _titleController.text,
      'content': _contentController.text
    };

    String url = '/board/';
    var response = await post(
      url,
      json.encode(data),
    );
    print(response);

    if (response.statusCode == 200) {
      jsonResponse = json.decode(response.body.toString());
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(" ${jsonResponse['Message']}")));
      print('success');

      print('Dialog shown');

      setState(() {
        // 게시물 추가
        final newPost = Post(
          title: _titleController.text,
          content: _contentController.text,
        );
        posts.add(newPost);
        // 게시물 목록을 GetStorage에 저장
        box.write('posts', posts.map((post) => post.toJson()).toList());
      });
    } else {
      print('error');

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        centerTitle: true,
        backgroundColor:Colors.white,
        title: Text('게시판',style: TextStyle(
          color:Colors.black,
          fontWeight:FontWeight.bold,
          fontSize: 20,

        ),
          textAlign: TextAlign.center,

        ),
        // leading: IconButton(
        //   icon: Icon(Icons.arrow_back),
        //   onPressed: () {
        //     Get.back();
        //   },
        // ),
      ),
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(posts[index].title),
            trailing: Icon(Icons.navigate_next),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PostDetailPage(post: posts[index]),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // 작성 페이지로 이동하여 게시물 작성
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CreatePage()),
          );
          if (result != null) {

            final List<String> resultData = result.split('내용: ');
            final String title = resultData[0].substring(4);
            final String content = resultData[1];
            setState(() {
              // 게시물 추가
              posts.add(Post(title: title, content: content));
              // 게시물 목록을 GetStorage에 저장
              box.write('posts', posts.map((post) => post.toJson()).toList());
            });
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

