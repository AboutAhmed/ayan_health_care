/// YApi QuickType插件生成，具体参考文档:https://plugins.jetbrains.com/plugin/18847-yapi-quicktype/documentation
library;

import 'dart:convert';

FileModel fileModelFromJson(String str) => FileModel.fromJson(json.decode(str));

String fileModelToJson(FileModel data) => json.encode(data.toJson());

class FileModel {
  FileModel({
    required this.response,
    required this.meta,
  });

  FileModelResponse response;
  Meta meta;

  factory FileModel.fromJson(Map<dynamic, dynamic> json) => FileModel(
        response: FileModelResponse.fromJson(json["Response"]),
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

class FileModelResponse {
  FileModelResponse({
    required this.response,
  });

  List<ResponseElement> response;

  factory FileModelResponse.fromJson(Map<dynamic, dynamic> json) =>
      FileModelResponse(
        response: List<ResponseElement>.from(
            json["Response"].map((x) => ResponseElement.fromJson(x))),
      );

  Map<dynamic, dynamic> toJson() => {
        "Response": List<dynamic>.from(response.map((x) => x.toJson())),
      };
}

class ResponseElement {
  ResponseElement({
    required this.filePath,
    required this.fileName,
    required this.id,
    this.description,
  });

  String filePath;
  String fileName;
  String id;
  String? description;

  factory ResponseElement.fromJson(Map<dynamic, dynamic> json) =>
      ResponseElement(
        filePath: json["FilePath"],
        fileName: json["FileName"],
        id: json["ID"],
        description: json["Description"],
      );

  Map<String, dynamic> toJson() => {
        "FilePath": filePath,
        "FileName": fileName,
        "ID": id,
        "Description": description,
      };
}
