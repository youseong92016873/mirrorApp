import 'package:flutter/foundation.dart';

class UserProvider with ChangeNotifier {
  String _email = '';
  String _nickname = '';
  String _name = '';
  String _phone = '';
  String _password = '';

  String get email => _email;
  String get nickname => _nickname;
  String get name => _name;
  String get phone => _phone;
  String get password => _password;

  void setEmail(String email) {
    _email = email;
    notifyListeners();
  }

  void setNickname(String nickname) {
    _nickname = nickname;
    notifyListeners();
  }

  void setName(String name) {
    _name = name;
    notifyListeners();
  }

  void setPhone(String phone) {
    _phone = phone;
    notifyListeners();
  }

  void setPassword(String password) {
    _password = password;
    notifyListeners();
  }

  void registerUser() {
    // 회원가입 처리 로직을 구현합니다.
    // email, nickname, name, phone, password를 사용하여 회원가입을 완료합니다.
    // 성공적으로 회원가입이 완료되면 알맞은 처리를 수행하고, 실패했을 경우 에러 처리를 합니다.
    // 필요한 API 호출이나 데이터베이스 작업 등을 수행할 수 있습니다.
    // 예시로는 각 필드의 값을 출력하는 것으로 대체했습니다.
    print('Email: $_email');
    print('Nickname: $_nickname');
    print('Name: $_name');
    print('Phone: $_phone');
    print('Password: $_password');
  }
}
