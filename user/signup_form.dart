import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../api_client.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'login.dart';
import 'user_provider.dart';
import '../http_setup.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final GlobalKey<FormState> _nicknameKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _phonekey = GlobalKey<FormState>();
  final GlobalKey<FormState> _emailKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _passwordKey = GlobalKey<FormState>();
  final TextEditingController nicknameController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  bool isVisible = true;
  bool register = true;

  Future<void> registrationOfuser(BuildContext context) async {
    var jsonResponse;
    Map<String, dynamic> data = {
      'name': nameController.text,
      'nickname': nicknameController.text,
      'email': emailController.text,
      'phone': phoneController.text,
      'password': passwordController.text,
    };
    print('data: $data');

    String url = '/user/signup/';
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

      //userprovider에 로그인 정보 업데이트
      Provider.of<UserProvider>(context, listen: false).setEmail(emailController.text);
      Provider.of<UserProvider>(context, listen: false).setName(nameController.text);
      Provider.of<UserProvider>(context, listen: false).setNickname(nicknameController.text);
      Provider.of<UserProvider>(context, listen: false).setPhone(phoneController.text);
      Provider.of<UserProvider>(context, listen: false).registerUser();

      showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: Text('가입이 완료되었습니다'),
            children: [
              ListTile(),
            ],
          );
        },
      );
      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
      print('Dialog shown');
    } else {
      print('Response Status Code : ${response.statusCode}');
      print('Response Body : ${response.body}');
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
                      '회원가입',
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    TextField(
                      controller: nameController,
                      onChanged: (value) {
                        setState(() {});
                      },
                      decoration: InputDecoration(
                          // icon: Icon(Icons.mail),
                          prefixIcon: Icon(Icons.person),
                          suffixIcon: nameController.text.isEmpty
                              ? Text('')
                              : GestureDetector(
                                  onTap: () {
                                    nameController.clear();
                                  },
                                  child: Icon(Icons.close)),
                          labelText: '이름을 입력하시오',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  BorderSide(color: Colors.red, width: 1))),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    TextField(
                      controller: nicknameController,
                      onChanged: (value) {
                        setState(() {});
                      },
                      decoration: InputDecoration(
                        // icon: Icon(Icons.mail),
                          prefixIcon: Icon(Icons.account_box),
                          suffixIcon: nicknameController.text.isEmpty
                              ? Text('')
                              : GestureDetector(
                              onTap: () {
                                nicknameController.clear();
                              },
                              child: Icon(Icons.close)),
                          labelText: '별명을 입력하시오',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                              BorderSide(color: Colors.red, width: 1))),
                    ),
                    SizedBox(
                      height: 16,
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
                      height: 16,
                    ),
                    TextField(
                      controller: phoneController,
                      onChanged: (value) {
                        setState(() {});
                      },
                      decoration: InputDecoration(
                          // icon: Icon(Icons.mail),
                          prefixIcon: Icon(Icons.call),
                          suffixIcon: phoneController.text.isEmpty
                              ? Text('')
                              : GestureDetector(
                                  onTap: () {
                                    phoneController.clear();
                                  },
                                  child: Icon(Icons.close)),
                          hintText: '전화번호',
                          labelText: '전화번호',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  BorderSide(color: Colors.red, width: 1))),
                    ),
                    SizedBox(
                      height: 16,
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
                      height: 16,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          registrationOfuser(context);
                    },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 10),
                          child: Text('가입'),
                        )
                    ),
                    Positioned(
                      top: 40,
                      left: 0,
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.only(
                                    left: 0, top: 10, bottom: 10),
                                child: Icon(Icons.keyboard_arrow_left,
                                    color: Colors.black),
                              ),
                              Text('Back',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500))
                            ],
                          ),
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
