part of 'GeneralRepoImports.dart';

class GeneralRepository {
  late BuildContext _context;
  late GeneralHttpMethods _generalHttpMethods;

  GeneralRepository(BuildContext context) {
    _context = context;
    _generalHttpMethods = new GeneralHttpMethods(_context);
  }

  Future<bool> setUserLogin(String phone, String pass, int typeUser) =>
      _generalHttpMethods.userLogin(phone, pass, typeUser);

  Future<void> sendCode(int code, String userId) =>
      _generalHttpMethods.sendCode(code, userId);

  Future<void> resendCode(String userId) =>
      _generalHttpMethods.resendCode(userId);

  Future<String?> terms() => _generalHttpMethods.terms();

  Future<bool> switchNotify() => _generalHttpMethods.switchNotify();

  Future<String?> forgetPassword(String phone) =>
      _generalHttpMethods.forgetPassword(phone);

  Future<bool> resetUserPassword(String userId, String code, String pass) =>
      _generalHttpMethods.resetUserPassword(userId, code, pass);

  Future<List<QuestionModel>> frequentQuestions() =>
      _generalHttpMethods.frequentQuestions();

  Future<bool> contactUs({String? name, String? mail, String? message}) =>
      _generalHttpMethods.contactUs(name, mail, message);

  Future<void> changePassword(String oldPass, String newPass) =>
      _generalHttpMethods.changePassword(oldPass, newPass);

  Future<List<FollowerModel>> getListFollower(bool refresh) =>
      _generalHttpMethods.getListFollower(refresh);

  Future<bool> changeLanguage(String lang) =>
      _generalHttpMethods.changeLanguage(lang);

  Future<void> logOut() => _generalHttpMethods.logOut();

  Future<String?> about() => _generalHttpMethods.about();

  Future<List<AllChatsModel>> getAllChats(bool refresh) =>
      _generalHttpMethods.getAllChats(refresh);

  Future<List<MessageModel>> getChatMessages(int orderId, int pageNumber) =>
      _generalHttpMethods.getChatMessages(orderId, pageNumber);
}
