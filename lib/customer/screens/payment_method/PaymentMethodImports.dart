import 'package:auto_route/auto_route.dart';
import 'package:base_flutter/customer/models/Dtos/AcceptOrderModel.dart';
import 'package:base_flutter/customer/models/Dtos/TypePayEnum.dart';
import 'package:base_flutter/customer/models/coupon_model.dart';
import 'package:base_flutter/customer/resources/CustomerRepositoryImports.dart';
import 'package:base_flutter/customer/screens/payment_method/widgets/PaymentMethodWidgetsImports.dart';
import 'package:base_flutter/general/constants/MyColors.dart';
import 'package:base_flutter/general/utilities/routers/RouterImports.gr.dart';
import 'package:base_flutter/general/widgets/DefaultAppBar.dart';
import 'package:dio_helper/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tf_custom_widgets/tf_custom_widgets.dart';
import 'package:tf_validator/tf_validator.dart';

part 'PaymentMethod.dart';
part 'PaymentMethodData.dart';
