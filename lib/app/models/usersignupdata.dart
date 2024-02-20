class Usersignupdata {
  String? name;
  String? email;
  String? mobile;
  String? password;
  String? confirmPassword;
  String? role;

  Usersignupdata(
      {this.name,
        this.email,
        this.mobile,
        this.password,
        this.confirmPassword,
        this.role});

  Usersignupdata.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    mobile = json['mobile'];
    password = json['password'];
    confirmPassword = json['confirm_password'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['mobile'] = this.mobile;
    data['password'] = this.password;
    data['confirm_password'] = this.confirmPassword;
    data['role'] = this.role;
    return data;
  }
}
