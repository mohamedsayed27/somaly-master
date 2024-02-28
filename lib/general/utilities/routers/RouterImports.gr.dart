// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i42;
import 'package:base_flutter/customer/models/provider_details_model.dart'
    as _i44;
import 'package:base_flutter/customer/screens/chats/ChatsImports.dart' as _i16;
import 'package:base_flutter/customer/screens/edit_profile/EditProfileImports.dart'
    as _i24;
import 'package:base_flutter/customer/screens/following_list/FollowingListImports.dart'
    as _i26;
import 'package:base_flutter/customer/screens/home/HomeImports.dart' as _i18;
import 'package:base_flutter/customer/screens/home/tabs/main/MainPageImports.dart'
    as _i31;
import 'package:base_flutter/customer/screens/order_details/OrderDetailsImports.dart'
    as _i19;
import 'package:base_flutter/customer/screens/payment/PaymentImports.dart'
    as _i25;
import 'package:base_flutter/customer/screens/payment_method/PaymentMethodImports.dart'
    as _i20;
import 'package:base_flutter/customer/screens/profile/ProfileImports.dart'
    as _i23;
import 'package:base_flutter/customer/screens/provider_details/ProviderDetailsImports.dart'
    as _i29;
import 'package:base_flutter/customer/screens/register/RegisterImports.dart'
    as _i17;
import 'package:base_flutter/customer/screens/request_service/RequestServiceImports.dart'
    as _i30;
import 'package:base_flutter/customer/screens/service_details/ServiceDetailsImports.dart'
    as _i28;
import 'package:base_flutter/customer/screens/services/ServicesImports.dart'
    as _i27;
import 'package:base_flutter/customer/screens/success/SuccessImports.dart'
    as _i22;
import 'package:base_flutter/customer/screens/visa_payment/VisaPaymentImports.dart'
    as _i21;
import 'package:base_flutter/general/screens/about/AboutImports.dart' as _i8;
import 'package:base_flutter/general/screens/active_account/ActiveAccountImports.dart'
    as _i4;
import 'package:base_flutter/general/screens/change_password/ChangePasswordImports.dart'
    as _i12;
import 'package:base_flutter/general/screens/confirm_password/ConfirmPasswordImports.dart'
    as _i11;
import 'package:base_flutter/general/screens/contact_us/ContactUsImports.dart'
    as _i9;
import 'package:base_flutter/general/screens/forget_password/ForgetPasswordImports.dart'
    as _i3;
import 'package:base_flutter/general/screens/image_zoom/ImageZoom.dart' as _i13;
import 'package:base_flutter/general/screens/login/LoginImports.dart' as _i2;
import 'package:base_flutter/general/screens/reset_password/ResetPasswordImports.dart'
    as _i5;
import 'package:base_flutter/general/screens/select_lang/SelectLangImports.dart'
    as _i6;
import 'package:base_flutter/general/screens/select_user/SelectUserImports.dart'
    as _i10;
import 'package:base_flutter/general/screens/splash/SplashImports.dart' as _i1;
import 'package:base_flutter/general/screens/terms/TermsImports.dart' as _i7;
import 'package:base_flutter/general/screens/welcome/WelcomeImports.dart'
    as _i14;
import 'package:base_flutter/general/widgets/Done.dart' as _i15;
import 'package:base_flutter/provider/screens/pro_chats/ProChatsImports.dart'
    as _i39;
import 'package:base_flutter/provider/screens/pro_done/ProDoneImports.dart'
    as _i41;
import 'package:base_flutter/provider/screens/pro_home/ProHomeImports.dart'
    as _i33;
import 'package:base_flutter/provider/screens/pro_home/tabs/conversations/ConversationsImports.dart'
    as _i35;
import 'package:base_flutter/provider/screens/pro_home/tabs/main_home/ProMainHomeImports.dart'
    as _i37;
import 'package:base_flutter/provider/screens/pro_home/tabs/pro_more/ProMoreImports.dart'
    as _i38;
import 'package:base_flutter/provider/screens/pro_home/tabs/pro_notifications/ProNotificationsImports.dart'
    as _i36;
import 'package:base_flutter/provider/screens/pro_home/tabs/pro_orders/ProOrdersImports.dart'
    as _i34;
import 'package:base_flutter/provider/screens/pro_register/ProRegisterImports.dart'
    as _i32;
import 'package:base_flutter/provider/screens/pro_send_offer/ProSendOfferImports.dart'
    as _i40;
import 'package:flutter/material.dart' as _i43;

class AppRouter extends _i42.RootStackRouter {
  AppRouter([_i43.GlobalKey<_i43.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i42.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      final args = routeData.argsAs<SplashRouteArgs>();
      return _i42.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i1.Splash(navigatorKey: args.navigatorKey));
    },
    LoginRoute.name: (routeData) {
      final args = routeData.argsAs<LoginRouteArgs>();
      return _i42.CustomPage<dynamic>(
          routeData: routeData,
          child: _i2.Login(typeUser: args.typeUser),
          opaque: true,
          barrierDismissible: false);
    },
    ForgetPasswordRoute.name: (routeData) {
      return _i42.AdaptivePage<dynamic>(
          routeData: routeData, child: _i3.ForgetPassword());
    },
    ActiveAccountRoute.name: (routeData) {
      final args = routeData.argsAs<ActiveAccountRouteArgs>();
      return _i42.AdaptivePage<dynamic>(
          routeData: routeData, child: _i4.ActiveAccount(userId: args.userId));
    },
    ResetPasswordRoute.name: (routeData) {
      final args = routeData.argsAs<ResetPasswordRouteArgs>();
      return _i42.AdaptivePage<dynamic>(
          routeData: routeData, child: _i5.ResetPassword(userId: args.userId));
    },
    SelectLangRoute.name: (routeData) {
      return _i42.AdaptivePage<dynamic>(
          routeData: routeData, child: _i6.SelectLang());
    },
    TermsRoute.name: (routeData) {
      return _i42.AdaptivePage<dynamic>(
          routeData: routeData, child: _i7.Terms());
    },
    AboutRoute.name: (routeData) {
      return _i42.AdaptivePage<dynamic>(
          routeData: routeData, child: _i8.About());
    },
    ContactUsRoute.name: (routeData) {
      return _i42.AdaptivePage<dynamic>(
          routeData: routeData, child: _i9.ContactUs());
    },
    SelectUserRoute.name: (routeData) {
      return _i42.CustomPage<dynamic>(
          routeData: routeData,
          child: _i10.SelectUser(),
          transitionsBuilder: _i42.TransitionsBuilders.fadeIn,
          durationInMilliseconds: 1500,
          opaque: true,
          barrierDismissible: false);
    },
    ConfirmPasswordRoute.name: (routeData) {
      return _i42.AdaptivePage<dynamic>(
          routeData: routeData, child: _i11.ConfirmPassword());
    },
    ChangePasswordRoute.name: (routeData) {
      return _i42.AdaptivePage<dynamic>(
          routeData: routeData, child: _i12.ChangePassword());
    },
    ImageZoomRoute.name: (routeData) {
      final args = routeData.argsAs<ImageZoomRouteArgs>();
      return _i42.AdaptivePage<dynamic>(
          routeData: routeData, child: _i13.ImageZoom(images: args.images));
    },
    WelcomeRoute.name: (routeData) {
      return _i42.AdaptivePage<dynamic>(
          routeData: routeData, child: _i14.Welcome());
    },
    DoneRoute.name: (routeData) {
      return _i42.AdaptivePage<dynamic>(
          routeData: routeData, child: _i15.Done());
    },
    ChatsRoute.name: (routeData) {
      final args = routeData.argsAs<ChatsRouteArgs>();
      return _i42.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i16.Chats(
              receiverId: args.receiverId,
              receiverName: args.receiverName,
              color: args.color,
              orderId: args.orderId));
    },
    RegisterRoute.name: (routeData) {
      return _i42.AdaptivePage<dynamic>(
          routeData: routeData, child: _i17.Register());
    },
    HomeRoute.name: (routeData) {
      return _i42.AdaptivePage<dynamic>(
          routeData: routeData, child: _i18.Home());
    },
    OrderDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<OrderDetailsRouteArgs>();
      return _i42.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i19.OrderDetails(orderId: args.orderId));
    },
    PaymentMethodRoute.name: (routeData) {
      final args = routeData.argsAs<PaymentMethodRouteArgs>();
      return _i42.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i20.PaymentMethod(price: args.price, orderId: args.orderId));
    },
    VisaPaymentRoute.name: (routeData) {
      return _i42.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i21.VisaPayment());
    },
    SuccessRoute.name: (routeData) {
      final args = routeData.argsAs<SuccessRouteArgs>();
      return _i42.AdaptivePage<dynamic>(
          routeData: routeData,
          child:
              _i22.Success(mainTitle: args.mainTitle, subtitle: args.subtitle));
    },
    ProfileRoute.name: (routeData) {
      return _i42.AdaptivePage<dynamic>(
          routeData: routeData, child: _i23.Profile());
    },
    EditProfileRoute.name: (routeData) {
      return _i42.AdaptivePage<dynamic>(
          routeData: routeData, child: _i24.EditProfile());
    },
    PaymentRoute.name: (routeData) {
      return _i42.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i25.Payment());
    },
    FollowingListRoute.name: (routeData) {
      return _i42.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i26.FollowingList());
    },
    ServicesRoute.name: (routeData) {
      final args = routeData.argsAs<ServicesRouteArgs>();
      return _i42.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i27.Services(id: args.id, deptName: args.deptName));
    },
    ServiceDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<ServiceDetailsRouteArgs>();
      return _i42.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i28.ServiceDetails(subId: args.subId, subName: args.subName));
    },
    ProviderDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<ProviderDetailsRouteArgs>();
      return _i42.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i29.ProviderDetails(
              model: args.model,
              servId: args.servId,
              subDeptName: args.subDeptName));
    },
    RequestServiceRoute.name: (routeData) {
      final args = routeData.argsAs<RequestServiceRouteArgs>();
      return _i42.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i30.RequestService(
              servId: args.servId,
              providerId: args.providerId,
              subDeptName: args.subDeptName));
    },
    MainPageRoute.name: (routeData) {
      return _i42.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i31.MainPage());
    },
    ProRegisterRoute.name: (routeData) {
      return _i42.AdaptivePage<dynamic>(
          routeData: routeData, child: _i32.ProRegister());
    },
    ProHomeRoute.name: (routeData) {
      final args = routeData.argsAs<ProHomeRouteArgs>(
          orElse: () => const ProHomeRouteArgs());
      return _i42.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i33.ProHome(key: args.key, index: args.index));
    },
    ProOrdersRoute.name: (routeData) {
      return _i42.AdaptivePage<dynamic>(
          routeData: routeData, child: _i34.ProOrders());
    },
    ConversationsRoute.name: (routeData) {
      return _i42.AdaptivePage<dynamic>(
          routeData: routeData, child: _i35.Conversations());
    },
    ProNotificationsRoute.name: (routeData) {
      return _i42.AdaptivePage<dynamic>(
          routeData: routeData, child: _i36.ProNotifications());
    },
    ProMainHomeRoute.name: (routeData) {
      return _i42.AdaptivePage<dynamic>(
          routeData: routeData, child: _i37.ProMainHome());
    },
    ProMoreRoute.name: (routeData) {
      return _i42.AdaptivePage<dynamic>(
          routeData: routeData, child: _i38.ProMore());
    },
    ProChatsRoute.name: (routeData) {
      final args = routeData.argsAs<ProChatsRouteArgs>();
      return _i42.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i39.ProChats(
              receiverId: args.receiverId,
              receiverName: args.receiverName,
              color: args.color,
              orderId: args.orderId));
    },
    ProSendOfferRoute.name: (routeData) {
      final args = routeData.argsAs<ProSendOfferRouteArgs>();
      return _i42.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i40.ProSendOffer(orderId: args.orderId));
    },
    ProDoneRoute.name: (routeData) {
      return _i42.AdaptivePage<dynamic>(
          routeData: routeData, child: _i41.ProDone());
    }
  };

  @override
  List<_i42.RouteConfig> get routes => [
        _i42.RouteConfig(SplashRoute.name, path: '/'),
        _i42.RouteConfig(LoginRoute.name, path: '/Login'),
        _i42.RouteConfig(ForgetPasswordRoute.name, path: '/forget-password'),
        _i42.RouteConfig(ActiveAccountRoute.name, path: '/active-account'),
        _i42.RouteConfig(ResetPasswordRoute.name, path: '/reset-password'),
        _i42.RouteConfig(SelectLangRoute.name, path: '/select-lang'),
        _i42.RouteConfig(TermsRoute.name, path: '/Terms'),
        _i42.RouteConfig(AboutRoute.name, path: '/About'),
        _i42.RouteConfig(ContactUsRoute.name, path: '/contact-us'),
        _i42.RouteConfig(SelectUserRoute.name, path: '/select-user'),
        _i42.RouteConfig(ConfirmPasswordRoute.name, path: '/confirm-password'),
        _i42.RouteConfig(ChangePasswordRoute.name, path: '/change-password'),
        _i42.RouteConfig(ImageZoomRoute.name, path: '/image-zoom'),
        _i42.RouteConfig(WelcomeRoute.name, path: '/Welcome'),
        _i42.RouteConfig(DoneRoute.name, path: '/Done'),
        _i42.RouteConfig(ChatsRoute.name, path: '/Chats'),
        _i42.RouteConfig(RegisterRoute.name, path: '/Register'),
        _i42.RouteConfig(HomeRoute.name, path: '/Home'),
        _i42.RouteConfig(OrderDetailsRoute.name, path: '/order-details'),
        _i42.RouteConfig(PaymentMethodRoute.name, path: '/payment-method'),
        _i42.RouteConfig(VisaPaymentRoute.name, path: '/visa-payment'),
        _i42.RouteConfig(SuccessRoute.name, path: '/Success'),
        _i42.RouteConfig(ProfileRoute.name, path: '/Profile'),
        _i42.RouteConfig(EditProfileRoute.name, path: '/edit-profile'),
        _i42.RouteConfig(PaymentRoute.name, path: '/Payment'),
        _i42.RouteConfig(FollowingListRoute.name, path: '/following-list'),
        _i42.RouteConfig(ServicesRoute.name, path: '/Services'),
        _i42.RouteConfig(ServiceDetailsRoute.name, path: '/service-details'),
        _i42.RouteConfig(ProviderDetailsRoute.name, path: '/provider-details'),
        _i42.RouteConfig(RequestServiceRoute.name, path: '/request-service'),
        _i42.RouteConfig(MainPageRoute.name, path: '/main-page'),
        _i42.RouteConfig(ProRegisterRoute.name, path: '/pro-register'),
        _i42.RouteConfig(ProHomeRoute.name, path: '/pro-home'),
        _i42.RouteConfig(ProOrdersRoute.name, path: '/pro-orders'),
        _i42.RouteConfig(ConversationsRoute.name, path: '/Conversations'),
        _i42.RouteConfig(ProNotificationsRoute.name,
            path: '/pro-notifications'),
        _i42.RouteConfig(ProMainHomeRoute.name, path: '/pro-main-home'),
        _i42.RouteConfig(ProMoreRoute.name, path: '/pro-more'),
        _i42.RouteConfig(ProChatsRoute.name, path: '/pro-chats'),
        _i42.RouteConfig(ProSendOfferRoute.name, path: '/pro-send-offer'),
        _i42.RouteConfig(ProDoneRoute.name, path: '/pro-done')
      ];
}

/// generated route for [_i1.Splash]
class SplashRoute extends _i42.PageRouteInfo<SplashRouteArgs> {
  SplashRoute({required _i43.GlobalKey<_i43.NavigatorState> navigatorKey})
      : super(name,
            path: '/', args: SplashRouteArgs(navigatorKey: navigatorKey));

  static const String name = 'SplashRoute';
}

class SplashRouteArgs {
  const SplashRouteArgs({required this.navigatorKey});

  final _i43.GlobalKey<_i43.NavigatorState> navigatorKey;

  @override
  String toString() {
    return 'SplashRouteArgs{navigatorKey: $navigatorKey}';
  }
}

/// generated route for [_i2.Login]
class LoginRoute extends _i42.PageRouteInfo<LoginRouteArgs> {
  LoginRoute({required int typeUser})
      : super(name, path: '/Login', args: LoginRouteArgs(typeUser: typeUser));

  static const String name = 'LoginRoute';
}

class LoginRouteArgs {
  const LoginRouteArgs({required this.typeUser});

  final int typeUser;

  @override
  String toString() {
    return 'LoginRouteArgs{typeUser: $typeUser}';
  }
}

/// generated route for [_i3.ForgetPassword]
class ForgetPasswordRoute extends _i42.PageRouteInfo<void> {
  const ForgetPasswordRoute() : super(name, path: '/forget-password');

  static const String name = 'ForgetPasswordRoute';
}

/// generated route for [_i4.ActiveAccount]
class ActiveAccountRoute extends _i42.PageRouteInfo<ActiveAccountRouteArgs> {
  ActiveAccountRoute({required String userId})
      : super(name,
            path: '/active-account',
            args: ActiveAccountRouteArgs(userId: userId));

  static const String name = 'ActiveAccountRoute';
}

class ActiveAccountRouteArgs {
  const ActiveAccountRouteArgs({required this.userId});

  final String userId;

  @override
  String toString() {
    return 'ActiveAccountRouteArgs{userId: $userId}';
  }
}

/// generated route for [_i5.ResetPassword]
class ResetPasswordRoute extends _i42.PageRouteInfo<ResetPasswordRouteArgs> {
  ResetPasswordRoute({required String userId})
      : super(name,
            path: '/reset-password',
            args: ResetPasswordRouteArgs(userId: userId));

  static const String name = 'ResetPasswordRoute';
}

class ResetPasswordRouteArgs {
  const ResetPasswordRouteArgs({required this.userId});

  final String userId;

  @override
  String toString() {
    return 'ResetPasswordRouteArgs{userId: $userId}';
  }
}

/// generated route for [_i6.SelectLang]
class SelectLangRoute extends _i42.PageRouteInfo<void> {
  const SelectLangRoute() : super(name, path: '/select-lang');

  static const String name = 'SelectLangRoute';
}

/// generated route for [_i7.Terms]
class TermsRoute extends _i42.PageRouteInfo<void> {
  const TermsRoute() : super(name, path: '/Terms');

  static const String name = 'TermsRoute';
}

/// generated route for [_i8.About]
class AboutRoute extends _i42.PageRouteInfo<void> {
  const AboutRoute() : super(name, path: '/About');

  static const String name = 'AboutRoute';
}

/// generated route for [_i9.ContactUs]
class ContactUsRoute extends _i42.PageRouteInfo<void> {
  const ContactUsRoute() : super(name, path: '/contact-us');

  static const String name = 'ContactUsRoute';
}

/// generated route for [_i10.SelectUser]
class SelectUserRoute extends _i42.PageRouteInfo<void> {
  const SelectUserRoute() : super(name, path: '/select-user');

  static const String name = 'SelectUserRoute';
}

/// generated route for [_i11.ConfirmPassword]
class ConfirmPasswordRoute extends _i42.PageRouteInfo<void> {
  const ConfirmPasswordRoute() : super(name, path: '/confirm-password');

  static const String name = 'ConfirmPasswordRoute';
}

/// generated route for [_i12.ChangePassword]
class ChangePasswordRoute extends _i42.PageRouteInfo<void> {
  const ChangePasswordRoute() : super(name, path: '/change-password');

  static const String name = 'ChangePasswordRoute';
}

/// generated route for [_i13.ImageZoom]
class ImageZoomRoute extends _i42.PageRouteInfo<ImageZoomRouteArgs> {
  ImageZoomRoute({required List<dynamic> images})
      : super(name,
            path: '/image-zoom', args: ImageZoomRouteArgs(images: images));

  static const String name = 'ImageZoomRoute';
}

class ImageZoomRouteArgs {
  const ImageZoomRouteArgs({required this.images});

  final List<dynamic> images;

  @override
  String toString() {
    return 'ImageZoomRouteArgs{images: $images}';
  }
}

/// generated route for [_i14.Welcome]
class WelcomeRoute extends _i42.PageRouteInfo<void> {
  const WelcomeRoute() : super(name, path: '/Welcome');

  static const String name = 'WelcomeRoute';
}

/// generated route for [_i15.Done]
class DoneRoute extends _i42.PageRouteInfo<void> {
  const DoneRoute() : super(name, path: '/Done');

  static const String name = 'DoneRoute';
}

/// generated route for [_i16.Chats]
class ChatsRoute extends _i42.PageRouteInfo<ChatsRouteArgs> {
  ChatsRoute(
      {required String receiverId,
      required String receiverName,
      required _i43.Color color,
      required int orderId})
      : super(name,
            path: '/Chats',
            args: ChatsRouteArgs(
                receiverId: receiverId,
                receiverName: receiverName,
                color: color,
                orderId: orderId));

  static const String name = 'ChatsRoute';
}

class ChatsRouteArgs {
  const ChatsRouteArgs(
      {required this.receiverId,
      required this.receiverName,
      required this.color,
      required this.orderId});

  final String receiverId;

  final String receiverName;

  final _i43.Color color;

  final int orderId;

  @override
  String toString() {
    return 'ChatsRouteArgs{receiverId: $receiverId, receiverName: $receiverName, color: $color, orderId: $orderId}';
  }
}

/// generated route for [_i17.Register]
class RegisterRoute extends _i42.PageRouteInfo<void> {
  const RegisterRoute() : super(name, path: '/Register');

  static const String name = 'RegisterRoute';
}

/// generated route for [_i18.Home]
class HomeRoute extends _i42.PageRouteInfo<void> {
  const HomeRoute() : super(name, path: '/Home');

  static const String name = 'HomeRoute';
}

/// generated route for [_i19.OrderDetails]
class OrderDetailsRoute extends _i42.PageRouteInfo<OrderDetailsRouteArgs> {
  OrderDetailsRoute({required int orderId})
      : super(name,
            path: '/order-details',
            args: OrderDetailsRouteArgs(orderId: orderId));

  static const String name = 'OrderDetailsRoute';
}

class OrderDetailsRouteArgs {
  const OrderDetailsRouteArgs({required this.orderId});

  final int orderId;

  @override
  String toString() {
    return 'OrderDetailsRouteArgs{orderId: $orderId}';
  }
}

/// generated route for [_i20.PaymentMethod]
class PaymentMethodRoute extends _i42.PageRouteInfo<PaymentMethodRouteArgs> {
  PaymentMethodRoute({required num price, required int orderId})
      : super(name,
            path: '/payment-method',
            args: PaymentMethodRouteArgs(price: price, orderId: orderId));

  static const String name = 'PaymentMethodRoute';
}

class PaymentMethodRouteArgs {
  const PaymentMethodRouteArgs({required this.price, required this.orderId});

  final num price;

  final int orderId;

  @override
  String toString() {
    return 'PaymentMethodRouteArgs{price: $price, orderId: $orderId}';
  }
}

/// generated route for [_i21.VisaPayment]
class VisaPaymentRoute extends _i42.PageRouteInfo<void> {
  const VisaPaymentRoute() : super(name, path: '/visa-payment');

  static const String name = 'VisaPaymentRoute';
}

/// generated route for [_i22.Success]
class SuccessRoute extends _i42.PageRouteInfo<SuccessRouteArgs> {
  SuccessRoute({required String mainTitle, String? subtitle})
      : super(name,
            path: '/Success',
            args: SuccessRouteArgs(mainTitle: mainTitle, subtitle: subtitle));

  static const String name = 'SuccessRoute';
}

class SuccessRouteArgs {
  const SuccessRouteArgs({required this.mainTitle, this.subtitle});

  final String mainTitle;

  final String? subtitle;

  @override
  String toString() {
    return 'SuccessRouteArgs{mainTitle: $mainTitle, subtitle: $subtitle}';
  }
}

/// generated route for [_i23.Profile]
class ProfileRoute extends _i42.PageRouteInfo<void> {
  const ProfileRoute() : super(name, path: '/Profile');

  static const String name = 'ProfileRoute';
}

/// generated route for [_i24.EditProfile]
class EditProfileRoute extends _i42.PageRouteInfo<void> {
  const EditProfileRoute() : super(name, path: '/edit-profile');

  static const String name = 'EditProfileRoute';
}

/// generated route for [_i25.Payment]
class PaymentRoute extends _i42.PageRouteInfo<void> {
  const PaymentRoute() : super(name, path: '/Payment');

  static const String name = 'PaymentRoute';
}

/// generated route for [_i26.FollowingList]
class FollowingListRoute extends _i42.PageRouteInfo<void> {
  const FollowingListRoute() : super(name, path: '/following-list');

  static const String name = 'FollowingListRoute';
}

/// generated route for [_i27.Services]
class ServicesRoute extends _i42.PageRouteInfo<ServicesRouteArgs> {
  ServicesRoute({required int id, required String deptName})
      : super(name,
            path: '/Services',
            args: ServicesRouteArgs(id: id, deptName: deptName));

  static const String name = 'ServicesRoute';
}

class ServicesRouteArgs {
  const ServicesRouteArgs({required this.id, required this.deptName});

  final int id;

  final String deptName;

  @override
  String toString() {
    return 'ServicesRouteArgs{id: $id, deptName: $deptName}';
  }
}

/// generated route for [_i28.ServiceDetails]
class ServiceDetailsRoute extends _i42.PageRouteInfo<ServiceDetailsRouteArgs> {
  ServiceDetailsRoute({required int subId, required String subName})
      : super(name,
            path: '/service-details',
            args: ServiceDetailsRouteArgs(subId: subId, subName: subName));

  static const String name = 'ServiceDetailsRoute';
}

class ServiceDetailsRouteArgs {
  const ServiceDetailsRouteArgs({required this.subId, required this.subName});

  final int subId;

  final String subName;

  @override
  String toString() {
    return 'ServiceDetailsRouteArgs{subId: $subId, subName: $subName}';
  }
}

/// generated route for [_i29.ProviderDetails]
class ProviderDetailsRoute
    extends _i42.PageRouteInfo<ProviderDetailsRouteArgs> {
  ProviderDetailsRoute(
      {required _i44.ProviderDetailsModel model,
      required int servId,
      required String subDeptName})
      : super(name,
            path: '/provider-details',
            args: ProviderDetailsRouteArgs(
                model: model, servId: servId, subDeptName: subDeptName));

  static const String name = 'ProviderDetailsRoute';
}

class ProviderDetailsRouteArgs {
  const ProviderDetailsRouteArgs(
      {required this.model, required this.servId, required this.subDeptName});

  final _i44.ProviderDetailsModel model;

  final int servId;

  final String subDeptName;

  @override
  String toString() {
    return 'ProviderDetailsRouteArgs{model: $model, servId: $servId, subDeptName: $subDeptName}';
  }
}

/// generated route for [_i30.RequestService]
class RequestServiceRoute extends _i42.PageRouteInfo<RequestServiceRouteArgs> {
  RequestServiceRoute(
      {required int servId, String? providerId, required String subDeptName})
      : super(name,
            path: '/request-service',
            args: RequestServiceRouteArgs(
                servId: servId,
                providerId: providerId,
                subDeptName: subDeptName));

  static const String name = 'RequestServiceRoute';
}

class RequestServiceRouteArgs {
  const RequestServiceRouteArgs(
      {required this.servId, this.providerId, required this.subDeptName});

  final int servId;

  final String? providerId;

  final String subDeptName;

  @override
  String toString() {
    return 'RequestServiceRouteArgs{servId: $servId, providerId: $providerId, subDeptName: $subDeptName}';
  }
}

/// generated route for [_i31.MainPage]
class MainPageRoute extends _i42.PageRouteInfo<void> {
  const MainPageRoute() : super(name, path: '/main-page');

  static const String name = 'MainPageRoute';
}

/// generated route for [_i32.ProRegister]
class ProRegisterRoute extends _i42.PageRouteInfo<void> {
  const ProRegisterRoute() : super(name, path: '/pro-register');

  static const String name = 'ProRegisterRoute';
}

/// generated route for [_i33.ProHome]
class ProHomeRoute extends _i42.PageRouteInfo<ProHomeRouteArgs> {
  ProHomeRoute({_i43.Key? key, int index = 0})
      : super(name,
            path: '/pro-home', args: ProHomeRouteArgs(key: key, index: index));

  static const String name = 'ProHomeRoute';
}

class ProHomeRouteArgs {
  const ProHomeRouteArgs({this.key, this.index = 0});

  final _i43.Key? key;

  final int index;

  @override
  String toString() {
    return 'ProHomeRouteArgs{key: $key, index: $index}';
  }
}

/// generated route for [_i34.ProOrders]
class ProOrdersRoute extends _i42.PageRouteInfo<void> {
  const ProOrdersRoute() : super(name, path: '/pro-orders');

  static const String name = 'ProOrdersRoute';
}

/// generated route for [_i35.Conversations]
class ConversationsRoute extends _i42.PageRouteInfo<void> {
  const ConversationsRoute() : super(name, path: '/Conversations');

  static const String name = 'ConversationsRoute';
}

/// generated route for [_i36.ProNotifications]
class ProNotificationsRoute extends _i42.PageRouteInfo<void> {
  const ProNotificationsRoute() : super(name, path: '/pro-notifications');

  static const String name = 'ProNotificationsRoute';
}

/// generated route for [_i37.ProMainHome]
class ProMainHomeRoute extends _i42.PageRouteInfo<void> {
  const ProMainHomeRoute() : super(name, path: '/pro-main-home');

  static const String name = 'ProMainHomeRoute';
}

/// generated route for [_i38.ProMore]
class ProMoreRoute extends _i42.PageRouteInfo<void> {
  const ProMoreRoute() : super(name, path: '/pro-more');

  static const String name = 'ProMoreRoute';
}

/// generated route for [_i39.ProChats]
class ProChatsRoute extends _i42.PageRouteInfo<ProChatsRouteArgs> {
  ProChatsRoute(
      {required String receiverId,
      required String receiverName,
      required _i43.Color color,
      required int orderId})
      : super(name,
            path: '/pro-chats',
            args: ProChatsRouteArgs(
                receiverId: receiverId,
                receiverName: receiverName,
                color: color,
                orderId: orderId));

  static const String name = 'ProChatsRoute';
}

class ProChatsRouteArgs {
  const ProChatsRouteArgs(
      {required this.receiverId,
      required this.receiverName,
      required this.color,
      required this.orderId});

  final String receiverId;

  final String receiverName;

  final _i43.Color color;

  final int orderId;

  @override
  String toString() {
    return 'ProChatsRouteArgs{receiverId: $receiverId, receiverName: $receiverName, color: $color, orderId: $orderId}';
  }
}

/// generated route for [_i40.ProSendOffer]
class ProSendOfferRoute extends _i42.PageRouteInfo<ProSendOfferRouteArgs> {
  ProSendOfferRoute({required int orderId})
      : super(name,
            path: '/pro-send-offer',
            args: ProSendOfferRouteArgs(orderId: orderId));

  static const String name = 'ProSendOfferRoute';
}

class ProSendOfferRouteArgs {
  const ProSendOfferRouteArgs({required this.orderId});

  final int orderId;

  @override
  String toString() {
    return 'ProSendOfferRouteArgs{orderId: $orderId}';
  }
}

/// generated route for [_i41.ProDone]
class ProDoneRoute extends _i42.PageRouteInfo<void> {
  const ProDoneRoute() : super(name, path: '/pro-done');

  static const String name = 'ProDoneRoute';
}
