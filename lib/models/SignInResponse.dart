class SignInResponse {
  User? _user;
  String? _token;

  SignInResponse({User? user, String? token}) {
    if (user != null) {
      this._user = user;
    }
    if (token != null) {
      this._token = token;
    }
  }

  User? get user => _user;
  set user(User? user) => _user = user;
  String? get token => _token;
  set token(String? token) => _token = token;

  SignInResponse.fromJson(Map<String, dynamic> json) {
    _user = json['user'] != null ? new User.fromJson(json['user']) : null;
    _token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._user != null) {
      data['user'] = this._user!.toJson();
    }
    data['token'] = this._token;
    return data;
  }
}

class User {
  int? _age;
  String? _sId;
  String? _name;
  String? _email;
  String? _createdAt;
  String? _updatedAt;
  int? _iV;

  User(
      {int? age,
        String? sId,
        String? name,
        String? email,
        String? createdAt,
        String? updatedAt,
        int? iV}) {
    if (age != null) {
      this._age = age;
    }
    if (sId != null) {
      this._sId = sId;
    }
    if (name != null) {
      this._name = name;
    }
    if (email != null) {
      this._email = email;
    }
    if (createdAt != null) {
      this._createdAt = createdAt;
    }
    if (updatedAt != null) {
      this._updatedAt = updatedAt;
    }
    if (iV != null) {
      this._iV = iV;
    }
  }

  int? get age => _age;
  set age(int? age) => _age = age;
  String? get sId => _sId;
  set sId(String? sId) => _sId = sId;
  String? get name => _name;
  set name(String? name) => _name = name;
  String? get email => _email;
  set email(String? email) => _email = email;
  String? get createdAt => _createdAt;
  set createdAt(String? createdAt) => _createdAt = createdAt;
  String? get updatedAt => _updatedAt;
  set updatedAt(String? updatedAt) => _updatedAt = updatedAt;
  int? get iV => _iV;
  set iV(int? iV) => _iV = iV;

  User.fromJson(Map<String, dynamic> json) {
    _age = json['age'];
    _sId = json['_id'];
    _name = json['name'];
    _email = json['email'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['age'] = this._age;
    data['_id'] = this._sId;
    data['name'] = this._name;
    data['email'] = this._email;
    data['createdAt'] = this._createdAt;
    data['updatedAt'] = this._updatedAt;
    data['__v'] = this._iV;
    return data;
  }
}