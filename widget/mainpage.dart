import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prc6/coummunity/community.dart';
import 'package:prc6/user/signup_form.dart';
import 'package:http/http.dart' as http;
import 'package:prc6/widget/profile.dart';
import 'package:url_launcher/url_launcher.dart';


int _curPageIndex = 0;

// void main() {
//   runApp(MainPage());
// }

class MainPage extends StatefulWidget {
  final String? name;
  final String? email;
  final String? phone;

  MainPage({this.name, this.email, this.phone});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool _isSearching = true; // 검색바를 기본적으로 보여주도록 변경
  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, // 화면이 키보드에 의해 밀리지 않도록 설정
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0), // AppBar의 높이를 조정
        child: AppBar(
          backgroundColor: Colors.white,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(50.0), // 검색 박스가 확장될 수 있는 충분한 공간 확보
            child: _buildSearchField(),
          ),
          // actions: [
          //   IconButton(
          //     icon: Icon(Icons.search),
          //     color: Colors.black,
          //     onPressed: () {
          //       setState(() {
          //         _isSearching = !_isSearching;
          //       });
          //     },
          //   ),
          // ],
        ),

      ),


      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  GestureDetector(
                    onTap: () {
                      String url = ' https://clubclio.co.kr/shop/goodsView/0000003551';
                      // 버튼을 눌렀을 때 동작할 코드 작성
                      launch(url); // 원하는 URL로 이동하는 예시
                    },

                    child: Image.asset(
                      'assets/images/lip.jpg',
                      width: 160,
                      height: 140,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 20),
                  GestureDetector(
                    onTap: () {
                      String url = 'https://clubclio.co.kr/shop/goodsView/0000004472';
                      // 버튼을 눌렀을 때 동작할 코드 작성
                      launch(url); // 원하는 URL로 이동하는 예시
                    },
                    child: Image.asset(
                      'assets/images/skin2.jpg', // 이미지 파일의 경로
                      width: 160, // 이미지의 너비
                      height: 140, // 이미지의 높이
                      fit: BoxFit.cover, // 이미지가 올바르게 표시되도록 조정
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      String url = 'https://clubclio.co.kr/shop/goodsView/0000004254';
                      // 버튼을 눌렀을 때 동작할 코드 작성
                      launch(url); // 원하는 URL로 이동하는 예시
                    },
                    child: Image.asset(
                      'assets/images/eye.jpg', // 이미지 파일의 경로
                      width: 160, // 이미지의 너비
                      height: 140, // 이미지의 높이
                      fit: BoxFit.cover, // 이미지가 올바르게 표시되도록 조정
                    ),
                  ),
                  SizedBox(width: 20),
                  GestureDetector(
                    onTap: () {
                      String url = 'https://clubclio.co.kr/shop/goodsView/0000003551';
                      // 버튼을 눌렀을 때 동작할 코드 작성
                      launch(url); // 원하는 URL로 이동하는 예시
                    },
                    child: Image.asset(
                      'assets/images/lip3.jpg', // 이미지 파일의 경로
                      width: 160, // 이미지의 너비
                      height: 140, // 이미지의 높이
                      fit: BoxFit.cover, // 이미지가 올바르게 표시되도록 조정
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      String url = 'https://clubclio.co.kr/shop/goodsView/0000004472';
                      // 버튼을 눌렀을 때 동작할 코드 작성
                      launch(url); // 원하는 URL로 이동하는 예시
                    },
                    child: Image.asset(
                      'assets/images/skin.jpg', // 이미지 파일의 경로
                      width: 160, // 이미지의 너비
                      height: 140, // 이미지의 높이
                      fit: BoxFit.cover, // 이미지가 올바르게 표시되도록 조정
                    ),
                  ),
                  SizedBox(width: 20),
                  GestureDetector(
                    onTap: () {
                      String url = 'https://clubclio.co.kr/shop/goodsView/0000003551';
                      // 버튼을 눌렀을 때 동작할 코드 작성
                      launch(url); // 원하는 URL로 이동하는 예시
                    },
                    child: Image.asset(
                      'assets/images/lip2.jpg', // 이미지 파일의 경로
                      width: 160, // 이미지의 너비
                      height: 140, // 이미지의 높이
                      fit: BoxFit.cover, // 이미지가 올바르게 표시되도록 조정
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      String url = 'https://clubclio.co.kr/shop/goodsView/0000004254';
                      // 버튼을 눌렀을 때 동작할 코드 작성
                      launch(url); // 원하는 URL로 이동하는 예시
                    },
                    child: Image.asset(
                      'assets/images/eye.jpg', // 이미지 파일의 경로
                      width: 160, // 이미지의 너비
                      height: 140, // 이미지의 높이
                      fit: BoxFit.cover, // 이미지가 올바르게 표시되도록 조정
                    ),
                  ),
                  SizedBox(width: 20),
                  GestureDetector(
                    onTap: () {
                      String url = 'https://clubclio.co.kr/shop/goodsView/0000003551';
                      // 버튼을 눌렀을 때 동작할 코드 작성
                      launch(url); // 원하는 URL로 이동하는 예시
                    },
                    child: Image.asset(
                      'assets/images/lip3.jpg', // 이미지 파일의 경로
                      width: 160, // 이미지의 너비
                      height: 140, // 이미지의 높이
                      fit: BoxFit.cover, // 이미지가 올바르게 표시되도록 조정
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (index) {
          setState(() {
            _curPageIndex = index;
          });
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>MainPage(
                name: widget.name,
                email: widget.email,
                phone: widget.phone,
              )),
            );
          }
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CommunityPage()),
            );
          }
          if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CommunityPage()),
            );
          }
          if (index == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfilePage(
                name: widget.name ?? "",
                email: widget.email ?? "",
                phone: widget.phone ?? "",
              )),
            );
          }
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.black12),
            label: 'home',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.chat_bubble_2_fill, color: Colors.black12),
            label: 'talk',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.heart_fill, color: Colors.black12),
            label: 'shop',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.perm_identity_rounded, color: Colors.black12),
            label: 'my page',
          ),
        ],
      ),
    );
  }

  Widget _buildSearchField() {
    return Container(
      height: 40.0,
      margin: EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        controller: _searchController,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search, color: Colors.black),
          hintText: '검색',
          border: OutlineInputBorder(
            borderSide: BorderSide(width: 3.0),
            borderRadius: BorderRadius.circular(20.0),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
          suffixIcon: IconButton(
            icon: Icon(Icons.clear),
            onPressed: () {
              setState(() {
                _searchController.clear();
              });
            },
          ),
        ),
        onChanged: (value) {
          // 검색어 변경 시 검색 결과 처리 로직 구현
          // value 변수에 현재 검색어가 들어옵니다.
          // 검색 결과를 업데이트하거나 검색 API를 호출하는 등의 작업을 수행하세요.
        },
      ),
    );
  }
}