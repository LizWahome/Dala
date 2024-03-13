class LoginResponse {
  String? token;
  User? user;

  LoginResponse({this.token, this.user});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? email;
  String? username;
  String? firstName;
  String? lastName;
  String? phone;
  String? role;
  String? gender;
  bool? isActive;
  String? idNumber;
  String? registrationNumber;
  String? profilePic;

  User(
      {this.id,
      this.email,
      this.username,
      this.firstName,
      this.lastName,
      this.phone,
      this.role,
      this.gender,
      this.isActive,
      this.idNumber,
      this.registrationNumber,
      this.profilePic});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    username = json['username'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    phone = json['phone'];
    role = json['role'];
    gender = json['gender'];
    isActive = json['is_active'];
    idNumber = json['id_number'];
    registrationNumber = json['registration_number'];
    profilePic = json['profile_pic'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['username'] = username;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['phone'] = phone;
    data['role'] = role;
    data['gender'] = gender;
    data['is_active'] = isActive;
    data['id_number'] = idNumber;
    data['registration_number'] = registrationNumber;
    data['profile_pic'] = profilePic;
    return data;
  }
}