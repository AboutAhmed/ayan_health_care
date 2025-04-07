import 'dart:convert';

PrescriptionModel prescriptionModelFromJson(String str) =>
    PrescriptionModel.fromJson(json.decode(str));

String prescriptionModelToJson(PrescriptionModel data) =>
    json.encode(data.toJson());

class PrescriptionModel {
  PrescriptionModel({
    required this.response,
    required this.meta,
  });

  List<ResponseElement> response;
  Meta meta;

  factory PrescriptionModel.fromJson(Map<String, dynamic> json) =>
      PrescriptionModel(
        response: List<ResponseElement>.from(json["Response"]["Response"]
            .map((x) => ResponseElement.fromJson(x))),
        meta: Meta.fromJson(json["Meta"]),
      );

  Map<String, dynamic> toJson() => {
        "Response": {
          "Response": List<dynamic>.from(response.map((x) => x.toJson())),
        },
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

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        status: json["Status"],
        message: json["Message"],
      );

  Map<String, dynamic> toJson() => {
        "Status": status,
        "Message": message,
      };
}

class ResponseElement {
  ResponseElement({
    required this.doctorName,
    required this.title,
    required this.id,
    required this.dateTime,
  });

  String doctorName;
  String title;
  int id;
  String dateTime;

  factory ResponseElement.fromJson(Map<String, dynamic> json) =>
      ResponseElement(
        doctorName: json["DoctorName"],
        title: json["Title"],
        id: json["ID"],
        dateTime: json["DateTime"],
      );

  Map<String, dynamic> toJson() => {
        "DoctorName": doctorName,
        "Title": title,
        "ID": id,
        "DateTime": dateTime,
      };
}
