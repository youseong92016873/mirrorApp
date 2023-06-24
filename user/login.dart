import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prc6/widget/mainpage.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:prc6/user/signup_form.dart';
import '../http_setup.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isVisible = true;

  Future<void> loginUser() async {
    var jsonResponse;

    Map<String, dynamic> data = {
      'email': emailController.text,
      'password': passwordController.text,
    };
    print('data: $data');

    String url = '/user/login/';
    var response = await post(
      url,
      json.encode(data),
    );
    print('Response Status Code: ${response.statusCode}');

    if (response.statusCode == 200) {
      jsonResponse = json.decode(response.body.toString());
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(" ${jsonResponse['Message']}")));
      print('success');
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('로그인 성공'),
            actions: [
              TextButton(
                child: Text('확인'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MainPage()),
                  );
                },
              ),
            ],
          );
        },
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login failed')),
      );
      print('error');
    }



  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      resizeToAvoidBottomInset: false,
      body: Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 30),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 22),
                constraints: BoxConstraints.expand(),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: Column(
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Text(
                      '로그인',
                      style:
                      TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    TextField(
                      controller: emailController,
                      onChanged: (value) {
                        setState(() {});
                      },
                      decoration: InputDecoration(
                        // icon: Icon(Icons.mail),
                          prefixIcon: Icon(Icons.mail),
                          suffixIcon: emailController.text.isEmpty
                              ? Text('')
                              : GestureDetector(
                              onTap: () {
                                emailController.clear();
                              },
                              child: Icon(Icons.close)),
                          hintText: 'abc1234@mail.com',
                          labelText: 'email',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                              BorderSide(color: Colors.red, width: 1))),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextField(
                      obscureText: isVisible,
                      controller: passwordController,
                      onChanged: (value) {
                        print(value);
                      },

//
                      decoration: InputDecoration(
// icon: Icon(Icons.mail),
                          prefixIcon: Icon(Icons.lock),
                          suffixIcon: GestureDetector(
                              onTap: () {
                                isVisible = !isVisible;
                                setState(() {});
                              },
                              child: Icon(isVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off)),
                          hintText: '비밀번호를 입력하세요',
                          labelText: '비밀번호',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                              BorderSide(color: Colors.red, width: 1))),
                    ),
                    SizedBox(
                      height: 30,
                    ),

                    ElevatedButton(
                      onPressed: () {
                        loginUser();
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MainPage()),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 10),
                        child: Text("확인"),



                      ),
                    ),
                    SizedBox(height: 30),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignUpPage()));
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 20),
                        padding: EdgeInsets.all(15),
                        alignment: Alignment.bottomCenter,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              '회원가입 하러 가기',
                              style: TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              '회원가입',
                              style: TextStyle(
                                  color: Color(0xff14279B),
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
