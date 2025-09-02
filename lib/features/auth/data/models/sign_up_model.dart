class SignUpModel {
  String? message;
  User? user;
  bool? success;
  bool? error;

  SignUpModel({this.message, this.user, this.success, this.error});

  SignUpModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    success = json['success'];
    error = json['error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['success'] = this.success;
    data['error'] = this.error;
    return data;
  }
}

class User {
  String? username;
  String? email;
  String? role;
  String? sId;
  String? createdAt;
  String? updatedAt;
  int? iV;

  User(
      {this.username,
        this.email,
        this.role,
        this.sId,
        this.createdAt,
        this.updatedAt,
        this.iV});

  User.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    email = json['email'];
    role = json['role'];
    sId = json['_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['email'] = this.email;
    data['role'] = this.role;
    data['_id'] = this.sId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}