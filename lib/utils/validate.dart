import 'package:get/utils.dart';

bool containEmoji(String s) {
  return s.contains(
      RegExp(r'(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])'));
}

bool isValidEmail(String email) {
  return !containEmoji(email) && GetUtils.isEmail(email);
}

bool isValidNickname(String nickname, {bool hideToast = false, bool? isDialog = false}) {
  return RegExp("^[a-zA-Z0-9가-힣!@#\$%^&*(),\.?:{}|<>]{3,8}\$").hasMatch(nickname) &&
      !nickname.contains(" ") &&
      !containEmoji(nickname);
}

bool isValidPassword(String password) {
  return RegExp("(?=.*[a-zA-Z])(?=.*[0-9])[a-zA-Z0-9\$&+,:;=?@#|'<>.^*()%!-]{8,20}\$").hasMatch(password);
}
