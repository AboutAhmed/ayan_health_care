/// YApi QuickType插件生成，具体参考文档:https://plugins.jetbrains.com/plugin/18847-yapi-quicktype/documentation
library;

import 'dart:convert';

DoctorProfileModel doctorProfileFromJson(String str) =>
    DoctorProfileModel.fromJson(json.decode(str));

String doctorProfileToJson(DoctorProfileModel data) => json.encode(data.toJson());

class DoctorProfileModel {
  DoctorProfileModel({
    required this.response,
    required this.meta,
  });

  DoctorProfileResponse response;
  Meta meta;

  factory DoctorProfileModel.fromJson(Map<dynamic, dynamic> json) => DoctorProfileModel(
        response: DoctorProfileResponse.fromJson(json["Response"]),
        meta: Meta.fromJson(json["Meta"]),
      );

  Map<dynamic, dynamic> toJson() => {
        "Response": response.toJson(),
        "Meta": meta.toJson(),
      };
}

class Meta {
  Meta({
    required this.status,
    required this.message,
  });

  String status;
  String message;

  factory Meta.fromJson(Map<dynamic, dynamic> json) => Meta(
        status: json["Status"],
        message: json["Message"],
      );

  Map<dynamic, dynamic> toJson() => {
        "Status": status,
        "Message": message,
      };
}

class DoctorProfileResponse {
  DoctorProfileResponse({
    required this.response,
  });

  ResponseResponse response;

  factory DoctorProfileResponse.fromJson(Map<dynamic, dynamic> json) =>
      DoctorProfileResponse(
        response: ResponseResponse.fromJson(json["Response"]),
      );

  Map<dynamic, dynamic> toJson() => {
        "Response": response.toJson(),
      };
}

class ResponseResponse {
  ResponseResponse({
    required this.email,
    required this.fee,
    required this.locationId,
    required this.name,
    required this.about,
    required this.locationName,
    required this.services,
    required this.reviews,
    required this.username,
    required this.phone,
    required this.specialityName,
    required this.profilePicture,
  });

  String email;
  int fee;
  String locationId;
  String name;
  String about;
  String locationName;
  List<Service> services;
  List<dynamic> reviews;
  String username;
  String phone;
  String specialityName;
  String profilePicture;

  factory ResponseResponse.fromJson(Map<dynamic, dynamic> json) =>
      ResponseResponse(
        email: json["Email"],
        fee: json["Fee"],
        locationId: json["LocationID"],
        name: json["Name"],
        about: json["About"],
        locationName: json["LocationName"],
        services: List<Service>.from(
            json["Services"].map((x) => Service.fromJson(x))),
        reviews: List<dynamic>.from(json["Reviews"].map((x) => x)),
        username: json["Username"],
        phone: json["Phone"],
        specialityName: json["SpecialityName"],
        profilePicture: json["ProfilePicture"],
      );

  Map<dynamic, dynamic> toJson() => {
        "Email": email,
        "Fee": fee,
        "LocationID": locationId,
        "Name": name,
        "About": about,
        "LocationName": locationName,
        "Services": List<dynamic>.from(services.map((x) => x.toJson())),
        "Reviews": List<dynamic>.from(reviews.map((x) => x)),
        "Username": username,
        "Phone": phone,
        "SpecialityName": specialityName,
        "ProfilePicture": profilePicture,
      };
}

class Service {
  Service({
    required this.fee,
    required this.id,
    required this.name,
  });

  String fee;
  String id;
  String name;

  factory Service.fromJson(Map<dynamic, dynamic> json) => Service(
        fee: json["Fee"],
        id: json["ID"],
        name: json["Name"],
      );

  Map<dynamic, dynamic> toJson() => {
        "Fee": fee,
        "ID": id,
        "Name": name,
      };
}
