import 'dart:convert';
import 'dart:io';

import 'package:base_flutter/customer/screens/register/widgets/RegisterWidgetsImports.dart';
import 'package:base_flutter/general/blocks/lang_cubit/lang_cubit.dart';
import 'package:base_flutter/general/models/Dtos/LocationModel.dart';
import 'package:base_flutter/general/screens/location_address/LocationAddressImports.dart';
import 'package:base_flutter/general/screens/location_address/location_cubit/location_cubit.dart';
import 'package:base_flutter/general/utilities/utils_functions/UtilsImports.dart';
import 'package:base_flutter/general/widgets/AuthScaffold.dart';
import 'package:base_flutter/general/widgets/DefaultAppBar.dart';
import 'package:base_flutter/general/widgets/HeaderLogo.dart';
import 'package:base_flutter/provider/models/dots/ProRegisterModel.dart';
import 'package:base_flutter/provider/models/dots/drop_down_model.dart';
import 'package:base_flutter/provider/resources/ProviderRepoImports.dart';
import 'package:base_flutter/provider/screens/pro_register/widgets/ProRegisterWidgetsImports.dart';
import 'package:dio_helper/modals/LoadingDialog.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:tf_custom_widgets/Inputs/custom_dropDown/CustomDropDown.dart';
import 'package:tf_custom_widgets/utils/CustomButtonAnimation.dart';
import 'package:tf_custom_widgets/utils/generic_cubit/generic_cubit.dart';
import 'package:tf_validator/localization/LocalizationMethods.dart';

part 'ProRegister.dart';
part 'ProRegisterData.dart';
