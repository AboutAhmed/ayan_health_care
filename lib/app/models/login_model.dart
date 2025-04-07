/// YApi QuickType插件生成，具体参考文档:https://plugins.jetbrains.com/plugin/18847-yapi-quicktype/documentation
library;

import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    this.response,
    this.meta,
  });

  LoginModelResponse? response;
  Meta? meta;

  factory LoginModel.fromJson(Map<dynamic, dynamic> json) => LoginModel(
        response: LoginModelResponse.fromJson(json["Response"]),
        meta: Meta.fromJson(json["Meta"]),
      );

  Map<dynamic, dynamic> toJson() => {
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

  factory Meta.fromJson(Map<dynamic, dynamic> json) => Meta(
        status: json["Status"],
        message: json["Message"],
      );

  Map<dynamic, dynamic> toJson() => {
        "Status": status,
        "Message": message,
      };
}

class LoginModelResponse {
  LoginModelResponse({
    this.response,
  });

  ResponseResponse? response;

  factory LoginModelResponse.fromJson(Map<dynamic, dynamic> json) =>
      LoginModelResponse(
        response: ResponseResponse.fromJson(json["Response"]),
      );

  Map<dynamic, dynamic> toJson() => {
        "Response": response?.toJson(),
      };
}

class ResponseResponse {
  ResponseResponse({
    this.user,
    this.humanUser,
    this.address,
    this.patient,
  });

  User? user;
  HumanUser? humanUser;
  Address? address;
  Patient? patient;

  factory ResponseResponse.fromJson(Map<dynamic, dynamic> json) =>
      ResponseResponse(
        user: User.fromJson(json["User"]),
        humanUser: HumanUser.fromJson(json["HumanUser"]),
        address: Address.fromJson(json["Address"]),
        patient: Patient.fromJson(json["Patient"]),
      );

  Map<dynamic, dynamic> toJson() => {
        "User": user?.toJson(),
        "HumanUser": humanUser?.toJson(),
        "Address": address?.toJson(),
        "Patient": patient?.toJson(),
      };
}

class Address {
  Address({
    this.username,
    this.id,
  });

  String? username;
  int? id;

  factory Address.fromJson(Map<dynamic, dynamic> json) => Address(
        username: json["Username"],
        id: json["ID"],
      );

  Map<dynamic, dynamic> toJson() => {
        "Username": username,
        "ID": id,
      };
}

class HumanUser {
  HumanUser({
    this.ageInMonths,
    this.gender,
    this.username,
    this.ageInDays,
    this.cnic,
    this.age,
  });

  int? ageInMonths;
  String? gender;
  String? username;
  int? ageInDays;
  String? cnic;
  int? age;

  factory HumanUser.fromJson(Map<dynamic, dynamic> json) => HumanUser(
        ageInMonths: json["AgeInMonths"],
        gender: json["Gender"],
        username: json["Username"],
        ageInDays: json["AgeInDays"],
        cnic: json["CNIC"],
        age: json["Age"],
      );

  Map<dynamic, dynamic> toJson() => {
        "AgeInMonths": ageInMonths,
        "Gender": gender,
        "Username": username,
        "AgeInDays": ageInDays,
        "CNIC": cnic,
        "Age": age,
      };
}

class Patient {
  Patient({
    this.fkMrnFormat,
    this.mrNo,
    this.username,
  });

  int? fkMrnFormat;
  String? mrNo;
  String? username;

  factory Patient.fromJson(Map<dynamic, dynamic> json) => Patient(
        fkMrnFormat: json["FkMRNFormat"],
        mrNo: json["MrNo"],
        username: json["Username"],
      );
  int? id;
  Map<dynamic, dynamic> toJson() => {
        "FkMRNFormat": fkMrnFormat,
        "MrNo": mrNo,
        "Username": username,
      };
}

class User {
  User({
    this.email,
    this.name,
    this.isWelcomeMessageViewed,
    this.phone,
    this.userId,
    this.isMaster,
    this.registrationSource,
    this.password,
    this.status,
    this.isLockoutEnabled,
    this.onlineStatus,
    this.timeStamp,
    this.imagePath,
    this.type,
    this.isTwoFactorEnabled,
    this.username,
    this.accessFailedCount,
    this.masterUsername,
    this.legalAgreement,
  });

  String? email;
  String? name;
  bool? isWelcomeMessageViewed;
  String? phone;
  String? imagePath;
  int? userId;
  bool? isMaster;
  String? registrationSource;
  String? password;
  bool? status;
  bool? isLockoutEnabled;
  bool? onlineStatus;
  DateTime? timeStamp;
  String? type;
  bool? isTwoFactorEnabled;
  String? username;
  int? accessFailedCount;
  String? masterUsername;
  bool? legalAgreement;

  factory User.fromJson(Map<dynamic, dynamic> json) => User(
        email: json["Email"],
        name: json["Name"],
        isWelcomeMessageViewed: json["IsWelcomeMessageViewed"],
        phone: json["Phone"],
        userId: json["UserID"],
         imagePath:"ImagePath",
        isMaster: json["IsMaster"],
        registrationSource: json["RegistrationSource"],
        password: json["Password"],
        status: json["Status"],
        isLockoutEnabled: json["IsLockoutEnabled"],
        onlineStatus: json["OnlineStatus"],
        timeStamp: DateTime.parse(json["TimeStamp"]),
        type: json["Type"],
        isTwoFactorEnabled: json["IsTwoFactorEnabled"],
        username: json["Username"],
        accessFailedCount: json["AccessFailedCount"],
        masterUsername: json["MasterUsername"],
        legalAgreement: json["legal_agreement"],
      );

  Map<dynamic, dynamic> toJson() => {
        "Email": email,
        "Name": name,
        "IsWelcomeMessageViewed": isWelcomeMessageViewed,
        "Phone": phone,
        "UserID": userId,
        "IsMaster": isMaster,
         "ImagePath": imagePath,
        "RegistrationSource": registrationSource,
        "Password": password,
        "Status": status,
        "IsLockoutEnabled": isLockoutEnabled,
        "OnlineStatus": onlineStatus,
        "TimeStamp": timeStamp?.toIso8601String(),
        "Type": type,
        "IsTwoFactorEnabled": isTwoFactorEnabled,
        "Username": username,
        "AccessFailedCount": accessFailedCount,
        "MasterUsername": masterUsername,
        "legal_agreement": legalAgreement,
      };
}
