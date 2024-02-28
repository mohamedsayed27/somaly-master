part of 'RouterImports.dart';

@AdaptiveAutoRouter(
  routes: <AutoRoute>[
    //general routes
    AdaptiveRoute(
      page: Splash,
      initial: true,
    ),
    CustomRoute(
      page: Login,
    ),
    AdaptiveRoute(page: ForgetPassword),
    AdaptiveRoute(page: ActiveAccount),
    AdaptiveRoute(page: ResetPassword),
    AdaptiveRoute(page: SelectLang),
    AdaptiveRoute(page: Terms),
    AdaptiveRoute(page: About),
    AdaptiveRoute(page: ContactUs),
    CustomRoute(
        page: SelectUser,
        transitionsBuilder: TransitionsBuilders.fadeIn,
        durationInMilliseconds: 1500),
    AdaptiveRoute(page: ConfirmPassword),
    AdaptiveRoute(page: ChangePassword),
    AdaptiveRoute(page: ImageZoom),
    AdaptiveRoute(page: Welcome),
    AdaptiveRoute(page: Done),
    AdaptiveRoute(page: Chats),

    //customer
    AdaptiveRoute(page: Register),
    AdaptiveRoute(page: Home),
    AdaptiveRoute(page: TestDirectoryScreen),
    AdaptiveRoute(page: OrderDetails),
    AdaptiveRoute(page: PaymentMethod),
    AdaptiveRoute(page: VisaPayment),
    AdaptiveRoute(page: Success),
    AdaptiveRoute(page: Profile),
    AdaptiveRoute(page: EditProfile),
    AdaptiveRoute(page: Payment),
    AdaptiveRoute(page: FollowingList),
    AdaptiveRoute(page: Services),
    AdaptiveRoute(page: ServiceDetails),
    AdaptiveRoute(page: ProviderDetails),
    AdaptiveRoute(page: RequestService),
    AdaptiveRoute(page: MainPage),

    //provider
    AdaptiveRoute(page: ProRegister),
    AdaptiveRoute(page: ProHome),
    AdaptiveRoute(page: ProOrders),
    AdaptiveRoute(page: Conversations),
    AdaptiveRoute(page: ProNotifications),
    AdaptiveRoute(page: ProMainHome),
    AdaptiveRoute(page: ProMore),
    AdaptiveRoute(page: ProChats),
    AdaptiveRoute(page: ProSendOffer),
    AdaptiveRoute(page: ProDone),
  ],
)
class $AppRouter {}
