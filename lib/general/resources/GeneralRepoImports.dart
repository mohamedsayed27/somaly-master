import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:base_flutter/customer/models/message_model.dart';
import 'package:base_flutter/general/blocks/lang_cubit/lang_cubit.dart';
import 'package:base_flutter/general/blocks/user_cubit/user_cubit.dart';
import 'package:base_flutter/general/models/QuestionModel.dart';
import 'package:base_flutter/general/models/all_chats_model.dart';
import 'package:base_flutter/general/models/follower_model.dart';
import 'package:base_flutter/general/utilities/routers/RouterImports.gr.dart';
import 'package:base_flutter/general/utilities/utils_functions/ApiNames.dart';
import 'package:base_flutter/general/utilities/utils_functions/UtilsImports.dart';
import 'package:dio_helper/dio_helper.dart';
import 'package:dio_helper/http/GenericHttp.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:tf_validator/localization/LocalizationMethods.dart';

part 'GeneralHttpMethods.dart';
part 'GeneralRepository.dart';
