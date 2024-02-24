import 'dart:convert';

MainUser mainUserFromJson(String str) => MainUser.fromJson(json.decode(str));

String mainUserToJson(MainUser data) => json.encode(data.toJson());

class MainUser {
  String? message;
  Payload? payload;
  int? statusCode;
  bool? isSuccess;

  MainUser({
    this.message,
    this.payload,
    this.statusCode,
    this.isSuccess,
  });

  factory MainUser.fromJson(Map<String, dynamic> json) => MainUser(
    message: json["message"],
    payload: json["payload"] == null ? null : Payload.fromJson(json["payload"]),
    statusCode: json["statusCode"],
    isSuccess: json["isSuccess"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "payload": payload?.toJson(),
    "statusCode": statusCode,
    "isSuccess": isSuccess,
  };
}

class Payload {
  int? id;
  String? uid;
  String? name;
  String? email;
  String? mobile;
  String? role;
  dynamic fcmToken;
  bool? verified;
  bool? status;
  String? headline;
  String? currentCompany;
  String? bio;
  int? cityId;
  DateTime? dob;
  int? professionalTypeId;
  String? education;
  String? linkedinLink;
  dynamic profilePicture;
  String? university;
  String? location;
  String? skills;
  DateTime? graduationDate;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? city;
  String? professionalTypesName;
  String? document;
  String? documentUid;
  int? documentStatus;
  String? identityDocument;
  String? identityDocumentUid;
  String? identityStatus;

  Payload({
    this.id,
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
    this.city,
    this.professionalTypesName,
    this.document,
    this.documentUid,
    this.documentStatus,
    this.identityDocument,
    this.identityDocumentUid,
    this.identityStatus,
  });

  factory Payload.fromJson(Map<String, dynamic> json) => Payload(
    id: json["id"],
    uid: json["uid"],
    name: json["name"],
    email: json["email"],
    mobile: json["mobile"],
    role: json["role"],
    fcmToken: json["fcm_token"],
    verified: json["verified"],
    status: json["status"],
    headline: json["headline"],
    currentCompany: json["currentCompany"],
    bio: json["bio"],
    cityId: json["cityId"],
    dob: json["dob"] == null ? null : DateTime.parse(json["dob"]),
    professionalTypeId: json["professionalTypeId"],
    education: json["education"],
    linkedinLink: json["linkedinLink"],
    profilePicture: json["profilePicture"],
    university: json["university"],
    location: json["location"],
    skills: json["skills"],
    graduationDate: json["graduation_date"] == null ? null : DateTime.parse(json["graduation_date"]),
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    city: json["city"],
    professionalTypesName: json["professionalTypesName"],
    document: json["document"],
    documentUid: json["document_uid"],
    documentStatus: json["document_status"],
    identityDocument: json["identity_document"],
    identityDocumentUid: json["identity_document_uid"],
    identityStatus: json["identity_status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "uid": uid,
    "name": name,
    "email": email,
    "mobile": mobile,
    "role": role,
    "fcm_token": fcmToken,
    "verified": verified,
    "status": status,
    "headline": headline,
    "currentCompany": currentCompany,
    "bio": bio,
    "cityId": cityId,
    "dob": "${dob!.year.toString().padLeft(4, '0')}-${dob!.month.toString().padLeft(2, '0')}-${dob!.day.toString().padLeft(2, '0')}",
    "professionalTypeId": professionalTypeId,
    "education": education,
    "linkedinLink": linkedinLink,
    "profilePicture": profilePicture,
    "university": university,
    "location": location,
    "skills": skills,
    "graduation_date": "${graduationDate!.year.toString().padLeft(4, '0')}-${graduationDate!.month.toString().padLeft(2, '0')}-${graduationDate!.day.toString().padLeft(2, '0')}",
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "city": city,
    "professionalTypesName": professionalTypesName,
    "document": document,
    "document_uid": documentUid,
    "document_status": documentStatus,
    "identity_document": identityDocument,
    "identity_document_uid": identityDocumentUid,
    "identity_status": identityStatus,
  };
}
