import 'package:uuid/uuid.dart';

const String signupTitle = '新規登録';
const String loginTitle = 'ログイン';
const String mainTitle = 'SNS';
const String tabBarHomeTitle = 'home';
const String tabBarSearchTitle = 'search';
const String tabBarProfileTitle = 'profile';
const String signupEmailAddressHint = 'メールアドレス';
const String loginEmailAddressHint = 'メールアドレス';
const String passwordHint = 'パスワード';
const String signupButtonText = '新規登録を行う';
const String loginButtonText = 'ログインを行う';
const String logoutButtonText = 'ログアウトを行う';
const String mainSignupButtonText = '新規登録';
const String mainLoginButtonText = 'ログイン';
const String loadingText = 'loading...';
const String aliceName = 'Alice';
const String snackBarText = 'ユーザが追加されました。';
const String usersFieldKey = 'users';
String returnUUIDv4() {
  const Uuid uuid = Uuid();
  return uuid.v4();
}

String returnJpegFileName() => '${returnUUIDv4()}.jpg';
