import 'dart:io';

class UpdateUserProfileModel {
  String? userName;
  String? phone;
  String? lat;
  String? lng;
  File? img;
  String? location;

  UpdateUserProfileModel(
      {this.img, this.phone, this.location, this.lng, this.lat, this.userName});
  Map<String, dynamic> toJson() => {
        "userName": userName,
        "phone": phone,
        "imgProfile": img,
        "lat": lat,
        "lng": lng,
        "location": location
      };
}
