import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prc6/widget/mainpage.dart';
import 'package:prc6/coummunity/community.dart';
import 'package:prc6/http_setup.dart';

class CreatePage extends StatefulWidget {
  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _contentController = TextEditingController();

  Future<void> CreatePageOfUser() async {
    var jsonResponse;
    Map<String, dynamic> data = {
      'title': _titleController.text,
      'content': _contentController.text,
    };
    print('data: $data');

    String url = '/board/post/';
    var response = await post(
      url,
      json.encode(data),
    );
    print('Response Status Code: ${response.statusCode}');
    if (response.statusCode == 200) {
      jsonResponse = json.decode(response.body.toString());
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(" ${jsonResponse['Message']}")));
      print('success');
    }
    else {
      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(content: Text("An error occurred")),
      // );

    }
  }
  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.white,
        title: Text('게시물 작성',style: TextStyle(
        color:Colors.black,
        fontWeight:FontWeight.bold,
        fontSize: 30,),

        )
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                labelText: '제목',
              ),
            ),
            SizedBox(height: 50.0),
            TextField(
              controller: _contentController,
              decoration: InputDecoration(
                labelText: '내용',
              ),
              maxLines: null,
            ),

            SizedBox(height: 100.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: Container(), // 빈 컨테이너를 추가하여 체크 버튼을 오른쪽으로 밀어냄
            ),

            IconButton(

              color:Colors.lightBlue,
              onPressed: () {
                // 작성된 게시물 제목과 내용을 가져와서 처리
                final title = _titleController.text;
                final content = _contentController.text;

                CreatePageOfUser();

                // 게시물을 추가하고 이전 페이지(PostListScreen)로 돌아감
                Navigator.pop(
                  context,
                  '제목: $title'
                      '내용: $content',
                );
              },

              icon: Icon(Icons.check) ,

            ),
          ],

        ),
      ]
      ),
      )
    );
  }
}

