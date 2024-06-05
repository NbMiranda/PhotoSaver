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

  // Método construtor opcional para adicionar um usuário padrão
  User.defaultUser()
  : name = 'Default User',
    email = 'admin',
    password = '123',
    photos = [],
    index = 0;
}

class UserData {
  static final UserData _instance = UserData._internal();

  List<User> users = [];
  int currentUserIndex = -1;

  factory UserData() {
    return _instance;
  }

  UserData._internal() {
    users.add(User.defaultUser());
  }
}

final userData = UserData();
