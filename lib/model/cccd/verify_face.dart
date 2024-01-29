// To parse this JSON data, do
//
//     final verifyFaceModel = verifyFaceModelFromJson(jsonString);

import 'dart:convert';

VerifyFaceModel verifyFaceModelFromJson(String str) => VerifyFaceModel.fromJson(json.decode(str));

String verifyFaceModelToJson(VerifyFaceModel data) => json.encode(data.toJson());

class VerifyFaceModel {
  String? code;
  String? message;
  VerifyFaceDataModel? data;

  VerifyFaceModel({
    this.code,
    this.message,
    this.data,
  });

  factory VerifyFaceModel.fromJson(Map<String, dynamic> json) => VerifyFaceModel(
    code: json["code"],
    message: json["message"],
    data: json["data"] == null ?  VerifyFaceDataModel() : VerifyFaceDataModel.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "message": message,
    "data": data?.toJson(),
  };
}

class VerifyFaceDataModel {
  double? matching;
  String? face1;
  String? face2;
  String? face1Score;
  String? face2Score;
  int? invalidCode;
  String? invalidMessage;
  String? match;

  VerifyFaceDataModel({
    this.matching,
    this.face1,
    this.face2,
    this.face1Score,
    this.face2Score,
    this.invalidCode,
    this.invalidMessage,
    this.match,
  });

  factory VerifyFaceDataModel.fromJson(Map<String, dynamic> json) => VerifyFaceDataModel(
    matching: double.tryParse(json["matching"]) ?? 0,
    face1: json["face1"],
    face2: json["face2"],
    face1Score: json["face1_score"],
    face2Score: json["face2_score"],
    invalidCode: json["invalidCode"],
    invalidMessage: json["invalidMessage"],
    match: json["match"],
  );

  Map<String, dynamic> toJson() => {
    "matching": matching,
    "face1": face1,
    "face2": face2,
    "face1_score": face1Score,
    "face2_score": face2Score,
    "invalidCode": invalidCode,
    "invalidMessage": invalidMessage,
    "match": match,
  };
}
