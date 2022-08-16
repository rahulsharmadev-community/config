class Validation {
  const Validation._();

  /// Username Exception must contain 8-16 character
  static final usernameExp = RegExp(r'[a-zA-Z0-9@\_\-\.]{8,16}');

  /// Email Exception must ba a patten like rahul@gmail.com
  static final emailExp = RegExp(r'^[a-zA-Z0-9\_\-\.]+@[a-z]+\.[a-z]+$');

  /// Number Exception is contain 0-9 numbers
  static final numberExp = RegExp(r'^[0-9]+$');

  /// Mobile Exception has only 10 digits from 0 to 9.
  static final mobilenoExp = RegExp(r'[0-9]{10}');

  /// Alphabeat Exception is contain all alphabeats a-z, A-Z.
  static final alphabeatExp = RegExp(r'^[a-zA-Z]+$');

  static String? email(String? text, {String? errorMsg}) {
    bool value = text?.contains(emailExp) ?? false;
    return value || text!.isEmpty
        ? null
        : !value
            ? errorMsg ?? 'Invalid Email-Id'
            : null;
  }

  static String? username(String? text, {String? errorMsg}) {
    bool value = text?.contains(usernameExp) ?? false;
    return value || text!.isEmpty
        ? null
        : !value
            ? errorMsg ?? 'Invalid Username'
            : null;
  }

  static String? number(String? text, {String? errorMsg}) {
    bool value = text?.contains(numberExp) ?? false;
    return value || text!.isEmpty
        ? null
        : !value
            ? errorMsg ?? 'Invalid Number'
            : null;
  }

  static String? mobileNo(String? text, {String? errorMsg}) {
    bool value = text?.contains(mobilenoExp) ?? false;
    return value || text!.isEmpty
        ? null
        : !value
            ? errorMsg ?? 'Invalid Mobile Number'
            : null;
  }

  static String? alphabeat(String? text, {String? errorMsg}) {
    bool value = text?.contains(alphabeatExp) ?? false;
    return value || text!.isEmpty
        ? null
        : !value
            ? errorMsg ?? 'Only Use alphabeat'
            : null;
  }
}
