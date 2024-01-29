// To parse this JSON data, do
//
//     final cccdModel = cccdModelFromJson(jsonString);

import 'dart:convert';

CccdModel cccdModelFromJson(String str) => CccdModel.fromJson(json.decode(str));

String cccdModelToJson(CccdModel data) => json.encode(data.toJson());

class CccdModel {
  String? code;
  String? message;
  CccdDataModel? data;

  CccdModel({
    this.code,
    this.message,
    this.data,
  });

  factory CccdModel.fromJson(Map<String, dynamic> json) => CccdModel(
        code: json["code"],
        message: json["message"],
        data: json["data"] == null
            ? CccdDataModel(eidNumber: '')
            : CccdDataModel.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "data": data?.toJson(),
      };
}

class CccdDataModel {
  String? transactionId;
  String? eidNumber;
  String? fullName;
  String? dateOfBirth;
  String? gender;
  String? dateOfIssue;
  String? placeOfResidence;
  String? faceOnCard;
  CccdAddressDataModel? address;

  CccdDataModel({
    this.transactionId,
    this.eidNumber,
    this.fullName,
    this.dateOfBirth,
    this.gender,
    this.dateOfIssue,
    this.placeOfResidence,
    this.faceOnCard,
    this.address,
  });

  factory CccdDataModel.fromJson(Map<String, dynamic> json) => CccdDataModel(
        transactionId: json["transactionId"],
        eidNumber: json["eidNumber"],
        fullName: json["fullName"],
        dateOfBirth: json["dateOfBirth"],
        gender: json["gender"],
        dateOfIssue: json["dateOfIssue"],
        placeOfResidence: json["placeOfResidence"],
        faceOnCard: json["faceOnCard"],
        address: json["address"] == null
            ? CccdAddressDataModel()
            : CccdAddressDataModel.fromJson(json["address"]),
      );

  Map<String, dynamic> toJson() => {
        "transactionId": transactionId,
        "eidNumber": eidNumber,
        "fullName": fullName,
        "dateOfBirth": dateOfBirth,
        "gender": gender,
        "dateOfIssue": dateOfIssue,
        "placeOfResidence": placeOfResidence,
        "faceOnCard": faceOnCard,
        "address": address?.toJson(),
      };
}

class CccdAddressDataModel {
  String? address;
  String? hamlet;
  String? ward;
  String? district;
  String? province;

  CccdAddressDataModel({
    this.address,
    this.hamlet,
    this.ward,
    this.district,
    this.province,
  });

  factory CccdAddressDataModel.fromJson(Map<String, dynamic> json) =>
      CccdAddressDataModel(
        address: json["address"],
        hamlet: json["hamlet"],
        ward: json["ward"],
        district: json["district"],
        province: json["province"],
      );

  Map<String, dynamic> toJson() => {
        "address": address,
        "hamlet": hamlet,
        "ward": ward,
        "district": district,
        "province": province,
      };
}
