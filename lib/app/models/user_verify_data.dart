import 'dart:convert';

class VerifyOtp {
  String? mobile;
  int? otp;
  int? hashcode;

  VerifyOtp({
    this.mobile,
    this.otp,
    this.hashcode,
  });

  factory VerifyOtp.fromJson(Map<String, dynamic> json) => VerifyOtp(
    mobile: json["mobile"],
    otp: json["otp"],
    hashcode: json["hashcode"],
  );

  Map<String, dynamic> toJson() => {
    "mobile": mobile,
    "otp": otp,
    "hashcode": hashcode,
  };
}
