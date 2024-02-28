import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:base_flutter/customer/models/Dtos/AddOrderModel.dart';
import 'package:base_flutter/customer/models/city_model.dart';
import 'package:base_flutter/customer/resources/CustomerRepositoryImports.dart';
import 'package:base_flutter/customer/screens/request_service/widgets/RequestServiceWidgetsImports.dart';
import 'package:base_flutter/general/utilities/utils_functions/AdaptivePicker.dart';
import 'package:base_flutter/general/utilities/utils_functions/UtilsImports.dart';
import 'package:base_flutter/general/widgets/DefaultAppBar.dart';
import 'package:dio_helper/modals/LoadingDialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tf_custom_widgets/Inputs/custom_dropDown/CustomDropDown.dart';
import 'package:tf_custom_widgets/tf_custom_widgets.dart';
import 'package:tf_custom_widgets/widgets/GenericListView.dart';
import 'package:tf_validator/tf_validator.dart';

part 'RequestService.dart';
part 'RequestServiceData.dart';
