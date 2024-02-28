import 'dart:io';

import 'package:base_flutter/customer/models/message_model.dart';
import 'package:base_flutter/customer/models/service_model.dart';
import 'package:base_flutter/customer/resources/CustomerRepositoryImports.dart';
import 'package:base_flutter/customer/screens/home/tabs/main/widgets/MainWidgetsImports.dart';
import 'package:base_flutter/general/blocks/user_cubit/user_cubit.dart';
import 'package:base_flutter/general/constants/MyColors.dart';
import 'package:base_flutter/general/models/UserModel.dart';
import 'package:base_flutter/general/utilities/utils_functions/LifecycleEventHandler.dart';
import 'package:base_flutter/general/utilities/utils_functions/LoadingDialog.dart';
import 'package:base_flutter/general/utilities/utils_functions/UtilsImports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:intl/intl.dart';
import 'package:signalr_core/signalr_core.dart';
import 'package:tf_custom_widgets/tf_custom_widgets.dart';

part 'MainPage.dart';
part 'MainPageData.dart';
