import 'dart:io';

import 'package:base_flutter/customer/models/Dtos/RegisterModel.dart';
import 'package:base_flutter/customer/resources/CustomerRepositoryImports.dart';
import 'package:base_flutter/customer/screens/register/widgets/RegisterWidgetsImports.dart';
import 'package:base_flutter/general/models/Dtos/LocationModel.dart';
import 'package:base_flutter/general/screens/location_address/LocationAddressImports.dart';
import 'package:base_flutter/general/screens/location_address/location_cubit/location_cubit.dart';
import 'package:base_flutter/general/utilities/utils_functions/UtilsImports.dart';
import 'package:base_flutter/general/widgets/AuthScaffold.dart';
import 'package:base_flutter/general/widgets/DefaultAppBar.dart';
import 'package:base_flutter/general/widgets/HeaderLogo.dart';
import 'package:dio_helper/modals/LoadingDialog.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:tf_custom_widgets/utils/CustomButtonAnimation.dart';
import 'package:tf_custom_widgets/utils/generic_cubit/generic_cubit.dart';
import 'package:tf_validator/localization/LocalizationMethods.dart';

part 'Register.dart';
part 'RegisterData.dart';
