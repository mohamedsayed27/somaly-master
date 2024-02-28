import 'dart:io';

class UpdateProviderProfileModel {
  String? userName;
  String? email;
  String? phone;
  String? password;
  String? lat;
  String? lng;
  String? location;
  File? imgProfile;
  String? idsSubCat;
  String? bankAccountNumber;
  File? commercialRegisterImg;
  File? indentityImg;
  String? info;
  String? whatsUp;

  UpdateProviderProfileModel(
      {this.userName,
      this.imgProfile,
      this.info,
      this.lng,
      this.lat,
      this.location,
      this.bankAccountNumber,
      this.password,
      this.whatsUp,
      this.phone,
      this.indentityImg,
      this.email,
      this.commercialRegisterImg,
      this.idsSubCat});

  Map<String, dynamic> toJson() => {
        "userName": userName,
        "phone": phone,
        "email": email,
        "imgProfile": imgProfile,
        "whatsUp": whatsUp,
        "bankAccountNumber": bankAccountNumber,
        "idSubCat": idsSubCat,
        "commercialRegisterImg": commercialRegisterImg,
        "indentityImg": indentityImg,
        "lat": lat,
        "lng": lng,
        "location": location,
    "info": info,
      };
}
