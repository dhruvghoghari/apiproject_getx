class ExperienceResponseModel {
  String? message;
  List<Payload>? payload;
  int? statusCode;
  bool? isSuccess;

  ExperienceResponseModel(
      {this.message, this.payload, this.statusCode, this.isSuccess});

  ExperienceResponseModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['payload'] != null) {
      payload = <Payload>[];
      json['payload'].forEach((v) {
        payload!.add(Payload.fromJson(v));
      });
    }
    statusCode = json['statusCode'];
    isSuccess = json['isSuccess'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    if (payload != null) {
      data['payload'] = payload!.map((v) => v.toJson()).toList();
    }
    data['statusCode'] = statusCode;
    data['isSuccess'] = isSuccess;
    return data;
  }
}

class Payload {
  int? id;
  String? uid;
  String? title;
  String? company;
  String? soldUnits;
  String? soldAmount;
  String? skills;
  String? startDate;
  String? endDate;
  String? description;
  String? image;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;

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
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  Payload.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uid = json['uid'];
    title = json['title'];
    company = json['company'];
    soldUnits = json['sold_units'];
    soldAmount = json['sold_amount'];
    skills = json['skills'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    description = json['description'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['uid'] = uid;
    data['title'] = title;
    data['company'] = company;
    data['sold_units'] = soldUnits;
    data['sold_amount'] = soldAmount;
    data['skills'] = skills;
    data['start_date'] = startDate;
    data['end_date'] = endDate;
    data['description'] = description;
    data['image'] = image;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;

    return data;
  }
}
