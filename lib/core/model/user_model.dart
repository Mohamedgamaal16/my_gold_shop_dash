class UserModel {
  static final UserModel _instance = UserModel._internal();

  String? token;  // التخزين للتوكن

  // منشئ خاص لضمان استخدام الكائن بشكل واحد (singleton)
  UserModel._internal();

  // الحصول على الكائن الوحيد من UserModel
  static UserModel get instance => _instance;

  // لتحديث التوكن عند تسجيل الدخول
  void setToken(String newToken) {
    token = newToken;
  }

  // للحصول على التوكن
  String? getToken() {
    return token;
  }
}
