import 'dart:io';

import 'package:base_flutter/customer/models/Dtos/UpdateUserProfileModel.dart';
import 'package:base_flutter/customer/resources/CustomerRepositoryImports.dart';
import 'package:base_flutter/customer/screens/edit_profile/widgets/EditProfileWidgetsImports.dart';
import 'package:base_flutter/general/blocks/user_cubit/user_cubit.dart';
import 'package:base_flutter/general/models/Dtos/LocationModel.dart';
import 'package:base_flutter/general/screens/location_address/LocationAddressImports.dart';
import 'package:base_flutter/general/screens/location_address/location_cubit/location_cubit.dart';
import 'package:base_flutter/general/utilities/utils_functions/UtilsImports.dart';
import 'package:base_flutter/general/widgets/DefaultAppBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:tf_custom_widgets/tf_custom_widgets.dart';
import 'package:tf_custom_widgets/widgets/GenericListView.dart';
import 'package:tf_validator/tf_validator.dart';

part 'EditProfile.dart';
part 'EditProfileData.dart';
