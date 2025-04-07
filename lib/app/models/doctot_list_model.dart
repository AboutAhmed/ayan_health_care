/// YApi QuickType插件生成，具体参考文档:https://plugins.jetbrains.com/plugin/18847-yapi-quicktype/documentation
library;

import 'dart:convert';

DoctotListModel doctotListFromJson(String str) =>
    DoctotListModel.fromJson(json.decode(str));

String doctotListToJson(DoctotListModel data) => json.encode(data.toJson());

class DoctotListModel {
  DoctotListModel({
    this.response,
    this.meta,
  });

  DoctotListResponse? response;
  Meta? meta;

  factory DoctotListModel.fromJson(Map<String, dynamic> json) =>
      DoctotListModel(
        response: DoctotListResponse.fromJson(json["Response"]),
        meta: Meta.fromJson(json["Meta"]),
      );

  Map<String, dynamic> toJson() => {
        "Response": response?.toJson(),
        "Meta": meta?.toJson(),
      };
}

class Meta {
  Meta({
    this.status,
    this.message,
  });

  String? status;
  String? message;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        status: json["Status"],
        message: json["Message"],
      );

  Map<String, dynamic> toJson() => {
        "Status": status,
        "Message": message,
      };
}

class DoctotListResponse {
  DoctotListResponse({
    this.response,
  });

  ResponseResponse? response;

  factory DoctotListResponse.fromJson(Map<String, dynamic> json) =>
      DoctotListResponse(
        response: ResponseResponse.fromJson(json["Response"]),
      );

  Map<String, dynamic> toJson() => {
        "Response": response?.toJson(),
      };
}

class ResponseResponse {
  ResponseResponse({
    this.doctorList,
    this.total,
  });

  List<DoctorList>? doctorList;
  int? total;

  factory ResponseResponse.fromJson(Map<String, dynamic> json) =>
      ResponseResponse(
        doctorList: List<DoctorList>.from(
            json["DoctorList"].map((x) => DoctorList.fromJson(x))),
        total: json["Total"],
      );

  Map<String, dynamic> toJson() => {
        "DoctorList": List<dynamic>.from(doctorList!.map((x) => x.toJson())),
        "Total": total,
      };
}

class DoctorList {
  DoctorList({
    this.id,
    this.email,
    this.fee,
    this.name,
    this.about,
    this.locationName,
    this.username,
    this.phone,
    this.specialityName,
    this.profilePicture,
    this.workingSince,
  });

  String? id;
  String? email;
  int? fee;
  String? name;
  String? about;
  String? locationName;
  String? username;
  String? phone;
  String? specialityName;
  String? profilePicture;
  String? workingSince;

  factory DoctorList.fromJson(Map<String, dynamic> json) => DoctorList(
        id: json["ID"],
        email: json["Email"],
        fee: json["Fee"],
        name: json["Name"],
        about: json["About"],
        locationName: json["LocationName"],
        username: json["Username"],
        phone: json["Phone"],
        specialityName: json["SpecialityName"],
        profilePicture: json["ProfilePicture"],
        workingSince: json["WorkingSince"],
      );

  Map<String, dynamic> toJson() => {
        "ID": id,
        "Email": email,
        "Fee": fee,
        "Name": name,
        "About": about,
        "LocationName": locationName,
        "Username": username,
        "Phone": phone,
        "SpecialityName": specialityName,
        "ProfilePicture": profilePicture,
        "WorkingSince": workingSince,
      };
}
