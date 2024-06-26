class User {
  String name;
  String email;
  String password;
  List<Map<String, dynamic>> photos;
  int index;
  String profilePhoto;

  User({
    required this.name,
    required this.email,
    required this.password,
    required this.photos,
    required this.index,
    required this.profilePhoto,
  });

  // Método construtor opcional para adicionar um usuário padrão
  User.defaultUser()
  : name = 'Default User',
    email = 'admin',
    password = '123',
    photos = [],
    index = 0,
    profilePhoto = 'bfgkxpiokdwbzkrirzj3';
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
    users.addAll([
      User(
        name: "luis_guilherme96",
        email: "luis@example.com",
        password: "password123",
        photos: [
          {
            "url": "vzda5jm6aieo35hwq0wq",
            "comments": [
              {
                "userIndex": 3,
                "comment": "Lindo demais"
              }
            ]
          }
        ],
        index: 1,
        profilePhoto: "vzda5jm6aieo35hwq0wq",
      ),
      User(
        name: "M.cunha",
        email: "matheus@example.com",
        password: "password123",
        photos: [
          {
            "url": "ruparzailraxzs46ya1f",
            "comments": [
              {
                "userIndex": 2,
                "comment": "Lindo demais"
              }
            ]
          }
        ],
        index: 2,
        profilePhoto: "ruparzailraxzs46ya1f",
      ),
      User(
        name: "Neight77",
        email: "nathan@example.com",
        password: "password123",
        photos: [
          {
            "url": "txcdpkllf6amgi8hagml",
            "comments": [
              {
                "userIndex": 1,
                "comment": "Lindo demais"
              }
            ]
          }
        ],
        index: 3,
        profilePhoto: "txcdpkllf6amgi8hagml",
      ),
    ]);
  }
}

  

final userData = UserData();
