class UserLoginData {
  String? message;
  Payload? payload;
  int? statusCode;
  bool? isSuccess;

  UserLoginData({this.message, this.payload, this.statusCode, this.isSuccess});

  UserLoginData.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    payload =
    json['payload'] != null ? new Payload.fromJson(json['payload']) : null;
    statusCode = json['statusCode'];
    isSuccess = json['isSuccess'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.payload != null) {
      data['payload'] = this.payload!.toJson();
    }
    data['statusCode'] = this.statusCode;
    data['isSuccess'] = this.isSuccess;
    return data;
  }
}

class Payload {
  User? user;
  String? token;

  Payload({this.user, this.token});

  Payload.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['token'] = this.token;
    return data;
  }
}

class User {
  int? id;
  String? uid;
  String? name;
  String? email;
  String? mobile;
  String? role;
  Null? fcmToken;
  bool? verified;
  bool? status;
  String? headline;
  String? currentCompany;
  String? bio;
  int? cityId;
  String? dob;
  int? professionalTypeId;
  String? education;
  String? linkedinLink;
  Null? profilePicture;
  String? university;
  String? location;
  String? skills;
  String? graduationDate;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  int? cityID;

  User(
      {this.id,
        this.uid,
        this.name,
        this.email,
        this.mobile,
        this.role,
        this.fcmToken,
        this.verified,
        this.status,
        this.headline,
        this.currentCompany,
        this.bio,
        this.cityId,
        this.dob,
        this.professionalTypeId,
        this.education,
        this.linkedinLink,
        this.profilePicture,
        this.university,
        this.location,
        this.skills,
        this.graduationDate,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.cityID=0});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uid = json['uid'];
    name = json['name'];
    email = json['email'];
    mobile = json['mobile'];
    role = json['role'];
    fcmToken = json['fcm_token'];
    verified = json['verified'];
    status = json['status'];
    headline = json['headline'];
    currentCompany = json['currentCompany'];
    bio = json['bio'];
    cityId = json['cityId'];
    dob = json['dob'];
    professionalTypeId = json['professionalTypeId'];
    education = json['education'];
    linkedinLink = json['linkedinLink'];
    profilePicture = json['profilePicture'];
    university = json['university'];
    location = json['location'];
    skills = json['skills'];
    graduationDate = json['graduation_date'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    deletedAt = json['deletedAt'];
    cityId = json['CityId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['uid'] = this.uid;
    data['name'] = this.name;
    data['email'] = this.email;
    data['mobile'] = this.mobile;
    data['role'] = this.role;
    data['fcm_token'] = this.fcmToken;
    data['verified'] = this.verified;
    data['status'] = this.status;
    data['headline'] = this.headline;
    data['currentCompany'] = this.currentCompany;
    data['bio'] = this.bio;
    data['cityId'] = this.cityId;
    data['dob'] = this.dob;
    data['professionalTypeId'] = this.professionalTypeId;
    data['education'] = this.education;
    data['linkedinLink'] = this.linkedinLink;
    data['profilePicture'] = this.profilePicture;
    data['university'] = this.university;
    data['location'] = this.location;
    data['skills'] = this.skills;
    data['graduation_date'] = this.graduationDate;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['deletedAt'] = this.deletedAt;
    data['CityId'] = this.cityId;
    return data;
  }
}

class UserInputLogin {
  String? mobile;
  String? password;

  UserInputLogin({this.mobile, this.password});

  UserInputLogin.fromJson(Map<String, dynamic> json) {
    mobile = json['mobile'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mobile'] = this.mobile;
    data['password'] = this.password;
    return data;
  }
}