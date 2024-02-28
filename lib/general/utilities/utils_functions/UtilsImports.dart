import 'dart:convert';
import 'dart:io';



import 'package:auto_route/auto_route.dart';
import 'package:base_flutter/general/blocks/lang_cubit/lang_cubit.dart';
import 'package:base_flutter/general/blocks/user_cubit/user_cubit.dart';
import 'package:base_flutter/general/constants/MyColors.dart';
import 'package:base_flutter/general/constants/input_field_style/CustomInputDecoration.dart';
import 'package:base_flutter/general/constants/input_field_style/CustomInputTextStyle.dart';
import 'package:base_flutter/general/models/Dtos/LocationModel.dart';
import 'package:base_flutter/general/models/UserModel.dart';
import 'package:base_flutter/general/models/customer_model.dart';
import 'package:base_flutter/general/models/provider_model.dart';
import 'package:base_flutter/general/screens/location_address/LocationAddressImports.dart';
import 'package:base_flutter/general/screens/location_address/location_cubit/location_cubit.dart';
import 'package:base_flutter/general/utilities/routers/RouterImports.gr.dart';
import 'package:base_flutter/general/utilities/utils_functions/ApiNames.dart';
import 'package:base_flutter/general/utilities/utils_functions/LoadingDialog.dart';
import 'package:dio_helper/Modals/LoadingDialog.dart';
import 'package:dio_helper/utils/DioUtils.dart';
import 'package:dio_helper/utils/GlobalState.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geocoding/geocoding.dart' as asdf;

import 'package:location/location.dart' as locationCurrent;
// import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:location/location.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:share/share.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tf_custom_widgets/tf_custom_widgets.dart';
import 'package:url_launcher/url_launcher.dart';



part 'utils.dart';
