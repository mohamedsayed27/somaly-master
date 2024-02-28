import 'dart:io';

class RegisterModel {
  RegisterModel({
    required this.userName,
    required this.imgProfile,
    required this.phone,
    required this.password,
    required this.deviceId,
    required this.deviceType,
    required this.projectName,
    required this.lat,
    required this.lng,
    required this.location,
  });

  String userName;
  File imgProfile;
  String phone;
  String password;
  String deviceId;
  String deviceType;
  String projectName;
  String? lat;
  String? lng;
  String location;

  Map<String, dynamic> toJson() => {
        "userName": userName,
        "imgProfile": imgProfile,
        "phone": phone,
        "deviceType": deviceType,
        "deviceId": deviceId,
        "projectName": projectName,
        "Lat": lat,
        "Lng": lng,
        "Location": location,
        "password": password,
      };
}
