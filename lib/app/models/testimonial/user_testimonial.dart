import 'dart:convert';

TestimonialModel testimonialModelFromJson(String str) => TestimonialModel.fromJson(json.decode(str));

String testimonialModelToJson(TestimonialModel data) => json.encode(data.toJson());

class TestimonialModel {
  String? message;
  List<Payload>? payload;
  int? statusCode;
  bool? isSuccess;

  TestimonialModel({
    this.message,
    this.payload,
    this.statusCode,
    this.isSuccess,
  });

  factory TestimonialModel.fromJson(Map<String, dynamic> json) => TestimonialModel(
    message: json["message"],
    payload: json["payload"] == null ? [] : List<Payload>.from(json["payload"]!.map((x) => Payload.fromJson(x))),
    statusCode: json["statusCode"],
    isSuccess: json["isSuccess"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "payload": payload == null ? [] : List<dynamic>.from(payload!.map((x) => x.toJson())),
    "statusCode": statusCode,
    "isSuccess": isSuccess,
  };
}

class Payload {
  int? id;
  String? uid;
  String? name;
  String? image;
  String? projectTitle;
  String? projectDescription;
  String? position;
  DateTime? payloadCreatedAt;
  DateTime? payloadUpdatedAt;
  dynamic payloadDeletedAt;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;

  Payload({
    this.id,
    this.uid,
    this.name,
    this.image,
    this.projectTitle,
    this.projectDescription,
    this.position,
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
    name: json["name"],
    image: json["image"],
    projectTitle: json["projectTitle"],
    projectDescription: json["projectDescription"],
    position: json["position"],
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
    "name": name,
    "image": image,
    "projectTitle": projectTitle,
    "projectDescription": projectDescription,
    "position": position,
    "created_at": payloadCreatedAt?.toIso8601String(),
    "updated_at": payloadUpdatedAt?.toIso8601String(),
    "deleted_at": payloadDeletedAt,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "deletedAt": deletedAt,
  };
}
