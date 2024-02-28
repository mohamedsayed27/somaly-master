part of 'UtilsImports.dart';

class Utils {
  static locationCurrent.Location location = new locationCurrent.Location();

  static Future<void> manipulateSplashData(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    initDio(lang: "ar");
    initCustomWidgets(language: "ar");
    // await GeneralRepository(context).getHomeConstData();
    await location.requestPermission();
    var strUser = prefs.get("user");
    if (strUser != null) {
      UserModel? data = UserModel.fromJson(json.decode("$strUser"));
      GlobalState.instance.set("token", data.token);
      changeLanguage(data.lang ?? "ar", context);
      setCurrentUserData(data, context);
    } else {
      changeLanguage("ar", context);
      GlobalState.instance.set("token", "");
      AutoRouter.of(context).push(WelcomeRoute());
    }
  }

  static initDio({required String lang}) {
    DioUtils.init(
      baseUrl: ApiNames.baseUrl,
      style: CustomInputTextStyle(lang: lang),
      primary: MyColors.primary,
      authLink: LoginRoute.name,
      language: lang,
      dismissFunc: EasyLoading.dismiss,
      showLoadingFunc: LoadingDialog.showLoadingDialog,
      branch: ApiNames.branch,
      authClick: () {},
    );
  }

  static initCustomWidgets({required String language}) {
    WidgetUtils.init(
        style: CustomInputTextStyle(lang: language),
        primary: MyColors.primary,
        language: language,
        inputStyle: ({String? label,
          Color ? enableColor,
          Color ? fillColor,
          Color ? focusBorderColor,
          String ? hint,
          Color ? hintColor,
          double ? hintSize,
          EdgeInsets ? padding,
          Widget ? prefixIcon,
          Widget ? prefixWidget,
          BorderRadius ? radius,
          Widget ? suffixIcon,
          Widget ? suffixWidget
        }) =>
            InputDecoration(
              labelText: label,
              enabled: true,
              enabledBorder: OutlineInputBorder(
                borderRadius: radius ?? BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: enableColor ?? Colors.red,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: radius ?? BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: focusBorderColor ?? Colors.red,
                ),
              ),
              hintText: hint,
              hintStyle: TextStyle(
                color: hintColor,
                fontSize: hintSize,
              ),
              fillColor: fillColor,
              focusColor: focusBorderColor,
              contentPadding: padding,
              prefixIcon: prefixIcon,
              prefix: prefixWidget,
              suffixIcon: suffixIcon,
              suffix: suffixWidget,
            ));
  }

  static Future<bool> manipulateLoginData(BuildContext context, dynamic data,
      String token) async {
    if (data != null) {
      bool activated = data["activeCode"];
      if (activated == true) {
        await Utils.setDeviceId("$token");
        UserModel user = new UserModel();
        int type = data["typeUser"];
        user.typeUser = type;
        if (type == 1) {
          CustomerModel? customerModel = CustomerModel.fromJson(data);
          user.customerModel = customerModel;
        } else {
          ProviderModel? providerModel = ProviderModel.fromJson(data);
          user.providerModel = providerModel;
        }
        user.closeNotify = data["closeNotify"];
        user.token = data["token"];
        user.lang = data["lang"];
        GlobalState.instance.set("token", user.token);
        await Utils.saveUserData(user);
        Utils.setCurrentUserData(user, context);
      } else if (activated == false) {
        AutoRouter.of(context).push(ActiveAccountRoute(userId: data["id"]));
      }
      return true;
    }
    return false;
  }

  static void setCurrentUserData(UserModel model, BuildContext context) async {
    context.read<UserCubit>().onUpdateUserData(model);
    if (model.typeUser == 1) {
      //home
      AutoRouter.of(context).push(HomeRoute());
    } else {
      //provider home
      AutoRouter.of(context).push(ProHomeRoute());
    }
    // ExtendedNavigator.of(context).push(Routes.home,arguments: HomeArguments(parentCount: parentCount));
  }

  static Future<void> saveUserData(UserModel model) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("user", json.encode(model.toJson()));
  }

  static void changeLanguage(String lang, BuildContext context) {
    DioUtils.lang = lang;
    WidgetUtils.lang = lang;
    context.read<LangCubit>().onUpdateLanguage(lang);
  }

  static UserModel getSavedUser({required BuildContext context}) {
    return context
        .read<UserCubit>()
        .state
        .model;
  }

  static Future<String?> getDeviceId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("deviceId");
  }

  static Future<void> setDeviceId(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("deviceId", token);
  }

  static void clearSavedData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print("=======> prefs");
    prefs.clear();
    print("-------> $prefs");
  }

  static void launchURL({required String url}) async {
    if (!url.toString().startsWith("https")) {
      url = "https://" + url;
    }
    await launch(url);
    // if (await canLaunch(url)) {
    //   await launch(url);
    // } else {
    //   CustomToast.showToastNotification("من فضلك تآكد من الرابط");
    // }
  }

  static void launchWhatsApp(phone) async {
    String message = 'مرحبا بك';
    if (phone.startsWith("00966")) {
      phone = phone.substring(5);
    }
    var _whatsAppUrl = "whatsapp://send?phone=+966$phone&text=$message";
    print(_whatsAppUrl);
    if (await canLaunch(_whatsAppUrl)) {
      await launch(_whatsAppUrl);
    } else {
      throw 'حدث خطأ ما';
    }
  }

  static void launchYoutube({required String url}) async {
    if (Platform.isIOS) {
      if (await canLaunch('$url')) {
        await launch('$url', forceSafariVC: false);
      } else {
        if (await canLaunch('$url')) {
          await launch('$url');
        } else {
          throw 'Could not launch $url';
        }
      }
    } else {
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }
  }

  static void callPhone({phone}) async {
    await launch("tel:$phone");
  }

  static void sendMail(mail) async {
    await launch("mailto:$mail");
  }

  static void shareApp(url) {
    LoadingDialog.showLoadingDialog();
    Share.share(url).whenComplete(() {
      EasyLoading.dismiss();
    });
  }

  static Future<File?> getImage() async {
    final ImagePicker _picker = ImagePicker();
    XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      File imageFile = File(image.path);
      return imageFile;
    }
    return null;
  }

  static Future<List<File>> getImages() async {
    final ImagePicker _picker = ImagePicker();
    final List<XFile>? result = await _picker.pickMultiImage();
    if (result != null) {
      List<File> files = result.map((e) => File(e.path)).toList();
      return files;
    } else {
      return [];
    }
  }

  static Future<File?> getVideo() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? video = await _picker.pickVideo(source: ImageSource.gallery);
    if (video != null) {
      File imageFile = File(video.path);
      return imageFile;
    }
    return null;
  }

  static void copToClipboard(
      {required String text, required GlobalKey<ScaffoldState> scaffold}) {
    if (text
        .trim()
        .isEmpty) {
      CustomToast.showToastNotification("لا يوجد بيانات للنسخ");
      return;
    } else {
      Clipboard.setData(ClipboardData(text: "$text")).then((value) {
        CustomToast.showToastNotification("تم النسخ بنجاح");
      });
    }
  }

  // static Future<LocationData?> getCurrentLocation(BuildContext context) async {
  //   Location location = new Location();
  //
  //   bool _serviceEnabled;
  //   PermissionStatus _permissionGranted;
  //   LocationData _loc;
  //
  //   _serviceEnabled = await location.serviceEnabled();
  //   if (!_serviceEnabled) {
  //     _serviceEnabled = await location.requestService();
  //     if (!_serviceEnabled) {
  //       return null;
  //     }
  //   }
  //
  //   _permissionGranted = await location.hasPermission();
  //   if (_permissionGranted == PermissionStatus.denied) {
  //     _permissionGranted = await location.requestPermission();
  //     if (_permissionGranted != PermissionStatus.granted) {
  //       return null;
  //     }
  //   }
  //
  //   _loc = await location.getLocation();
  //   return _loc;
  // }
  static Future<Position?> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;
    LoadingDialog.showLoadingDialog();
    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      CustomToast.showSimpleToast(msg: 'Location services are disabled');
      return null;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      EasyLoading.dismiss();
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        CustomToast.showSimpleToast(msg: 'Location permissions are denied');
        return null;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      EasyLoading.dismiss();
      CustomToast.showSimpleToast(
          msg:
          'Location permissions are permanently denied, we cannot request permissions');
      return null;
    }

    return await Geolocator.getCurrentPosition();
  }

  static void navigateToMapWithDirection({required String lat,
    required String lng,
    required BuildContext context}) async {
    if (lat == "0") return;
    try {
      final coords = Coords(double.parse(lat), double.parse(lng));
      final title = "Destination";
      final availableMaps = await MapLauncher.installedMaps;

      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Container(
                child: Wrap(
                  children: <Widget>[
                    for (var map in availableMaps)
                      ListTile(
                        onTap: () =>
                            map.showMarker(
                              coords: coords,
                              title: title,
                            ),
                        title: Text(map.mapName),
                        leading: SvgPicture.asset(
                          map.icon,
                          height: 30.0,
                          width: 30.0,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    } catch (e) {
      CustomToast.showSimpleToast(msg: "$e");
    }
  }

  // static Future<String> getAddress(LatLng latLng, BuildContext context) async {
  //   GeoCode geoCode = GeoCode();
  //
  //   try {
  //     var address = await geoCode.reverseGeocoding(
  //         latitude: latLng.latitude, longitude: latLng.longitude);
  //     var data =
  //         "${address.countryName ?? ""}  ${address.city ?? ""}  ${address.region ?? ""}  ${address.streetAddress ?? ""}";
  //     print(data);
  //     return data;
  //   } catch (e) {
  //     return "";
  //   }
  // }
  static Future<String> getAddress(LatLng latLng, BuildContext context) async {
    // final coordinates = Coordinates(latLng.latitude, latLng.longitude);
    List<Placemark> placemarks = await placemarkFromCoordinates(
        latLng.latitude, latLng.longitude);

    if (placemarks.isNotEmpty) {
      Placemark placemark = placemarks.first;
      print("${placemark.name} : ${placemark.street}");
      return placemark.street ?? ""; // Adjust to return desired address format
    } else {
      return ""; // Return an empty string if no address is found
    }
  }

  static String convertDigitsToLatin(String s) {
    var sb = new StringBuffer();
    for (int i = 0; i < s.length; i++) {
      switch (s[i]) {
      //Arabic digits
        case '\u0660':
          sb.write('0');
          break;
        case '\u0661':
          sb.write('1');
          break;
        case '\u0662':
          sb.write('2');
          break;
        case '\u0663':
          sb.write('3');
          break;
        case '\u0664':
          sb.write('4');
          break;
        case '\u0665':
          sb.write('5');
          break;
        case '\u0666':
          sb.write('6');
          break;
        case '\u0667':
          sb.write('7');
          break;
        case '\u0668':
          sb.write('8');
          break;
        case '\u0669':
          sb.write('9');
          break;
        default:
          sb.write(s[i]);
          break;
      }
    }
    return sb.toString();
  }

  static void navigateToLocationAddress(BuildContext context,
      LocationCubit locCubit) async {
    FocusScope.of(context).requestFocus(FocusNode());
    // LoadingDialog.showLoadingDialog();
    var current = await Utils.getCurrentLocation();
    LocationModel locationModel = locCubit.state.model!;
    if (current != null) {
      locationModel = LocationModel(
          lat: current.latitude.toDouble(),
          lng: current.longitude.toDouble(),
          address: "");
    }

    double lat = locationModel.lat;
    double lng = locationModel.lng;
    String address = await getAddress(LatLng(lat, lng), context);
    locationModel.address = address;
    locCubit.onLocationUpdated(locationModel);
    EasyLoading.dismiss();
    Navigator.of(context).push(
      CupertinoPageRoute(
        builder: (cxt) =>
            BlocProvider.value(
              value: locCubit,
              child: LocationAddress(),
            ),
      ),
    );
  }
}
