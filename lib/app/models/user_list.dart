
import 'dart:convert';

UserList UserListFromJson(String str) => UserList.fromJson(json.decode(str));
String UserListToJson(UserList data) => json.encode(data.toJson());

class UserList {
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
  String? company;
  String? bio;
  dynamic city;
  DateTime? birthdate;
  dynamic professionalTypeId;
  String? education;
  String? linkedinLink;
  String? picture;
  dynamic university;
  dynamic location;
  dynamic skills;
  dynamic graduationDate;
  DateTime? startDate;
  DateTime? endDate;
  String? originalCv;
  String? documentUid;
  dynamic documentStatus;
  String? identityDocument;
  String? identityDocumentUid;
  dynamic identityStatus;

  UserList({
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
    this.company,
    this.bio,
    this.city,
    this.birthdate,
    this.professionalTypeId,
    this.education,
    this.linkedinLink,
    this.picture,
    this.university,
    this.location,
    this.skills,
    this.graduationDate,
    this.startDate,
    this.endDate,
    this.originalCv,
    this.documentUid,
    this.documentStatus,
    this.identityDocument,
    this.identityDocumentUid,
    this.identityStatus,
  });

  factory UserList.fromJson(Map<String, dynamic> json) => UserList(
    id: json["id"] ?? "",
    uid: json["uid"] ?? "",
    name: json["name"] ?? "",
    email: json["email"] ?? "",
    mobile: json["mobile"] ?? "",
    role: json["role"] ?? "",
    fcmToken: json["fcm_token"] ?? "",
    verified: json["verified"] ?? "",
    status: json["status"] ?? "",
    headline: json["headline"] ?? "",
    company: json["currentCompany"] ?? "",
    bio: json["bio"] ?? "",
    city: json["cityId"] ?? "",
    birthdate: DateTime.parse(json["dob"] ?? DateTime.now()),
    professionalTypeId: json["professionalTypeId"] ?? "",
    education: json["education"] ?? "",
    linkedinLink: json["linkedinLink"] ?? "",
    picture: json["profilePicture"] ?? "",
    university: json["university"] ?? "",
    location: json["location"] ?? "",
    skills: json["skills"] ?? "",
    graduationDate: json["graduation_date"] ?? "",
    startDate: DateTime.parse(json["createdAt"] ?? DateTime.now()),
    endDate: DateTime.parse(json["updatedAt"] ?? DateTime.now()),
    originalCv: json["document"] ?? "",
    documentUid: json["document_uid"] ?? "",
    documentStatus: json["document_status"] ?? "",
    identityDocument: json["identity_document"] ?? "",
    identityDocumentUid: json["identity_document_uid"] ?? "",
    identityStatus: json["identity_status"] ?? "",
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
    "currentCompany": company,
    "bio": bio,
    "cityId": city,
    "dob": "${birthdate!.year.toString().padLeft(4, '0')}-${birthdate!.month.toString().padLeft(2, '0')}-${birthdate!.day.toString().padLeft(2, '0')}",
    "professionalTypeId": professionalTypeId,
    "education": education,
    "linkedinLink": linkedinLink,
    "profilePicture": picture,
    "university": university,
    "location": location,
    "skills": skills,
    "graduation_date": graduationDate,
    "createdAt": startDate!.toIso8601String(),
    "updatedAt": endDate!.toIso8601String(),
    "document": originalCv,
    "document_uid": documentUid,
    "document_status": documentStatus,
    "identity_document": identityDocument,
    "identity_document_uid": identityDocumentUid,
    "identity_status": identityStatus,
  };
}
