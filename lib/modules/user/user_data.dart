class User {
  String name;
  String email;
  String password;
  List<Map<String, dynamic>> photos;
  int index;

  User({
    required this.name,
    required this.email,
    required this.password,
    required this.photos,
    required this.index,
  });
}

class UserData {
  static final UserData _instance = UserData._internal();

  List<User> users = [];
  int currentUserIndex = -1;

  factory UserData() {
    return _instance;
  }

  UserData._internal();
}

final userData = UserData();
