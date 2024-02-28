import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:base_flutter/customer/models/Dtos/AcceptOrderModel.dart';
import 'package:base_flutter/customer/models/Dtos/AddOrderModel.dart';
import 'package:base_flutter/customer/models/Dtos/RegisterModel.dart';
import 'package:base_flutter/customer/models/Dtos/UpdateUserProfileModel.dart';
import 'package:base_flutter/customer/models/city_model.dart';
import 'package:base_flutter/customer/models/coupon_model.dart';
import 'package:base_flutter/customer/models/message_model.dart';
import 'package:base_flutter/customer/models/notify_model.dart';
import 'package:base_flutter/customer/models/order_model.dart';
import 'package:base_flutter/customer/models/provider_details_model.dart';
import 'package:base_flutter/customer/models/service_model.dart';
import 'package:base_flutter/general/blocks/lang_cubit/lang_cubit.dart';
import 'package:base_flutter/general/blocks/user_cubit/user_cubit.dart';
import 'package:base_flutter/general/models/UserModel.dart';
import 'package:base_flutter/general/models/customer_model.dart';
import 'package:base_flutter/general/utilities/routers/RouterImports.gr.dart';
import 'package:base_flutter/general/utilities/utils_functions/ApiNames.dart';
import 'package:base_flutter/general/utilities/utils_functions/UtilsImports.dart';
import 'package:base_flutter/provider/models/order_details_model.dart';
import 'package:dio_helper/dio_helper.dart';
import 'package:dio_helper/http/GenericHttp.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:tf_validator/tf_validator.dart';

part 'CustomerAuthMethods.dart';
part 'CustomerHttpMethods.dart';
part 'CustomerRepository.dart';
