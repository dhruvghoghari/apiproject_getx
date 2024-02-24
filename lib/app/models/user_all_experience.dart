import 'dart:convert';

ExperienceModel experienceModelFromJson(String str) => ExperienceModel.fromJson(json.decode(str));

String experienceModelToJson(ExperienceModel data) => json.encode(data.toJson());

class ExperienceModel {
  String? message;
  Payload? payload;
  int? statusCode;
  bool? isSuccess;

  ExperienceModel({
    this.message,
    this.payload,
    this.statusCode,
    this.isSuccess,
  });

  factory ExperienceModel.fromJson(Map<String, dynamic> json) => ExperienceModel(
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
  String? title;
  String? company;
  dynamic soldUnits;
  dynamic soldAmount;
  dynamic skills;
  DateTime? startDate;
  DateTime? endDate;
  String? description;
  String? image;
  DateTime? payloadCreatedAt;
  DateTime? payloadUpdatedAt;
  dynamic payloadDeletedAt;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;

  Payload({
    this.id,
    this.uid,
    this.title,
    this.company,
    this.soldUnits,
    this.soldAmount,
    this.skills,
    this.startDate,
    this.endDate,
    this.description,
    this.image,
    this.payloadCreatedAt,
    this.payloadUpdatedAt,
    this.payloadDeletedAt,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  factory Payload.fromJson(Map<String, dynamic> json) => Payload(
    id: json["id"],
    uid: json["uid"],
    title: json["title"],
    company: json["company"],
    soldUnits: json["sold_units"],
    soldAmount: json["sold_amount"],
    skills: json["skills"],
    startDate: json["start_date"] == null ? null : DateTime.parse(json["start_date"]),
    endDate: json["end_date"] == null ? null : DateTime.parse(json["end_date"]),
    description: json["description"],
    image: json["image"],
    payloadCreatedAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    payloadUpdatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    payloadDeletedAt: json["deleted_at"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    deletedAt: json["deletedAt"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "uid": uid,
    "title": title,
    "company": company,
    "sold_units": soldUnits,
    "sold_amount": soldAmount,
    "skills": skills,
    "start_date": "${startDate!.year.toString().padLeft(4, '0')}-${startDate!.month.toString().padLeft(2, '0')}-${startDate!.day.toString().padLeft(2, '0')}",
    "end_date": "${endDate!.year.toString().padLeft(4, '0')}-${endDate!.month.toString().padLeft(2, '0')}-${endDate!.day.toString().padLeft(2, '0')}",
    "description": description,
    "image": image,
    "created_at": payloadCreatedAt?.toIso8601String(),
    "updated_at": payloadUpdatedAt?.toIso8601String(),
    "deleted_at": payloadDeletedAt,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "deletedAt": deletedAt,
  };
}
