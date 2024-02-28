import 'package:auto_route/auto_route.dart';
import 'package:base_flutter/general/constants/MyColors.dart';
import 'package:base_flutter/general/utilities/routers/RouterImports.gr.dart';
import 'package:base_flutter/general/utilities/utils_functions/LoadingDialog.dart';
import 'package:base_flutter/general/widgets/DefaultAppBar.dart';
import 'package:base_flutter/provider/models/wallet_model.dart';
import 'package:base_flutter/provider/resources/ProviderRepoImports.dart';
import 'package:base_flutter/provider/screens/wallet/widgets/WalletWidgetsImports.dart';
import 'package:dio_helper/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:tf_custom_widgets/tf_custom_widgets.dart';
import 'package:tf_validator/localization/LocalizationMethods.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'Wallet.dart';
part 'WalletData.dart';