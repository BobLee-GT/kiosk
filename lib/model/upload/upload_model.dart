import 'dart:convert';

UploadModel uploadModelFromJson(String str) => UploadModel.fromJson(json.decode(str));

String uploadModelToJson(UploadModel data) => json.encode(data.toJson());

class UploadModel {
  String? code;
  String? message;
  UploadLinkModel? data;

  UploadModel({
    this.code,
    this.message,
    this.data,
  });

  factory UploadModel.fromJson(Map<String, dynamic> json) => UploadModel(
    code: json["code"],
    message: json["message"],
    data: json["data"] == null ? UploadLinkModel() : UploadLinkModel.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "message": message,
    "data": data?.toJson(),
  };
}

class UploadLinkModel {
  String? link;

  UploadLinkModel({
    this.link,
  });

  factory UploadLinkModel.fromJson(Map<String, dynamic> json) => UploadLinkModel(
    link: json["link"],
  );

  Map<String, dynamic> toJson() => {
    "link": link,
  };
}
