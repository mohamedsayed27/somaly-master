import 'package:auto_route/auto_route.dart';
import 'package:base_flutter/customer/resources/CustomerRepositoryImports.dart';
import 'package:base_flutter/customer/screens/order_details/widgets/OrderDetailsWidgetsImports.dart';
import 'package:base_flutter/general/constants/MyColors.dart';
import 'package:base_flutter/general/models/Dtos/OrderStatusEnum.dart';
import 'package:base_flutter/general/utilities/routers/RouterImports.gr.dart';
import 'package:base_flutter/general/utilities/utils_functions/LoadingDialog.dart';
import 'package:base_flutter/general/widgets/DefaultAppBar.dart';
import 'package:base_flutter/provider/models/order_details_model.dart';
import 'package:dio_helper/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tf_custom_widgets/tf_custom_widgets.dart';
import 'package:tf_validator/localization/LocalizationMethods.dart';

part 'OrderDetails.dart';
part 'OrderDetailsData.dart';
