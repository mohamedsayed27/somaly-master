import 'package:auto_route/auto_route.dart';
import 'package:base_flutter/customer/models/message_model.dart';
import 'package:base_flutter/general/blocks/user_cubit/user_cubit.dart';
import 'package:base_flutter/general/constants/MyColors.dart';
import 'package:base_flutter/general/models/UserModel.dart';
import 'package:base_flutter/general/utilities/routers/RouterImports.gr.dart';
import 'package:flutter/material.dart';
import 'package:tf_custom_widgets/utils/generic_cubit/generic_cubit.dart';
import 'package:tf_custom_widgets/widgets/CachedImage.dart';
import 'package:tf_validator/localization/LocalizationMethods.dart';
import 'package:tf_validator/validator/Validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:tf_custom_widgets/Inputs/GenericTextField.dart';
import 'package:tf_custom_widgets/widgets/MyText.dart';
import '../ChatsImports.dart';


part 'BuildChatMessages.dart';
part 'BuildRightMsg.dart';
part 'BuildLeftMsg.dart';
part 'BuildChatInput.dart';