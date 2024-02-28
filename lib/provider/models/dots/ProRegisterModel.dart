import 'dart:io';

class ProRegisterModel {
  String? userName;
  String? email;
  String? phone;
  String? password;
  String? lang;
  String? lat;
  String? lng;
  String? whatsUp;
  String? location;
  File? imgProfile;
  String? idsSubCat;
  String? bankAccountNumber;
  File? commercialRegisterImg;
  File? indentityImg;
  String? info;
  String? deviceId;
  String? deviceType;
  String? projectName;
  ProRegisterModel(
      {this.userName,
      this.email,
      this.whatsUp,
      this.password,
      this.phone,
      this.lang,
      this.imgProfile,
      this.deviceId,
      this.deviceType,
      this.lat,
      this.lng,
      this.idsSubCat,
      this.location,
      this.bankAccountNumber,
      this.commercialRegisterImg,
      this.indentityImg,
      this.projectName,
      this.info});
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userName'] = this.userName;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['lang'] = this.lang;
    data['whatsUp'] = this.whatsUp;
    data['imgProfile'] = this.imgProfile;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    data['location'] = this.location;
    data['idsSubCat'] = this.idsSubCat;
    data['bankAccountNumber'] = this.bankAccountNumber;
    data['commercialRegisterImg'] = this.commercialRegisterImg;
    data['indentityImg'] = this.indentityImg;
    data['deviceId'] = this.deviceId;
    data['password'] = this.password;
    data['info'] = this.info;    return data;
  }
}
