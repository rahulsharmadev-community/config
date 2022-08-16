enum RegExpType {
  usernameRegExp,
  emailRegExp,
  numberRegExp,
  mobilenoRegExp,
  alphabeatRegExp,
  passwordRegExp
}

class _RegExpData {
  final String regExpSyntax;
  final String errorMsg;
  const _RegExpData({required this.regExpSyntax, required this.errorMsg});
}

class Validation {
  final RegExpType _regExpType;
  final String? _errorMsg;
  Validation(RegExpType regExpType, {String? errorMsg})
      : _errorMsg = errorMsg,
        _regExpType = regExpType;

  static const Map<RegExpType, _RegExpData> regExpLibrary = {
    /// Username Exception must contain 8-16 character
    RegExpType.usernameRegExp: _RegExpData(
        regExpSyntax: r'[a-zA-Z0-9@\_\-\.]{8,16}',
        errorMsg: 'Invalid Username'),

    /// Email Exception must ba a patten like rahul@gmail.com
    RegExpType.emailRegExp: _RegExpData(
        regExpSyntax:
            r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
        errorMsg: 'Invalid Email-Id'),

    /// Number Exception is contain 0-9 numbers
    RegExpType.numberRegExp:
        _RegExpData(regExpSyntax: r'^[0-9]+$', errorMsg: 'Invalid Number'),

    /// Mobile Exception has only 10 digits from 0 to 9.
    RegExpType.mobilenoRegExp: _RegExpData(
        regExpSyntax: r'^[0-9]{10}+$', errorMsg: 'Invalid Mobile Number'),

    /// Alphabeat Exception is contain all alphabeats a-z, A-Z.
    RegExpType.alphabeatRegExp: _RegExpData(
        regExpSyntax: r'^[a-zA-Z]+$',
        errorMsg: 'Only alphabeat are allow to use'),

    /// Password Exception is contain ?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$
    RegExpType.passwordRegExp: _RegExpData(
        regExpSyntax: r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$',
        errorMsg: 'Invalid Password Found')
  };

  String? set(String? text) {
    final _temp =
        regExpLibrary.entries.singleWhere((e) => e.key == _regExpType).value;

    return RegExp(_temp.regExpSyntax).hasMatch(text ?? '')
        ? null
        : _errorMsg ?? _temp.errorMsg;
  }

  @override
  String toString() {
    // TODO: implement toString
    super.toString();
    return 'RegExpType: ' +
        _regExpType.name +
        'ErrorMsg: ' +
        (_errorMsg ??
            regExpLibrary.entries
                .singleWhere((e) => e.key == _regExpType)
                .value
                .errorMsg);
  }
}
