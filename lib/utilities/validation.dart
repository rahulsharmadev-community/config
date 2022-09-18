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
  final int min;
  final int? max;
  final String? errorMsg;
  Validation(RegExpType regExpType, {this.errorMsg, this.min = 0, this.max})
      : _regExpType = regExpType;

  static const Map<RegExpType, _RegExpData> regExpLibrary = {
    /// Username Exception must contain 8-16 character
    RegExpType.usernameRegExp: _RegExpData(
        regExpSyntax: r'[a-zA-Z0-9@\_\-\.]*$', errorMsg: 'Invalid Username'),

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
        regExpSyntax: r'^[0-9]+$', errorMsg: 'Invalid Mobile Number'),

    /// Alphabeat Exception is contain all alphabeats a-z, A-Z.
    RegExpType.alphabeatRegExp: _RegExpData(
        regExpSyntax: r'^[a-zA-Z]+$',
        errorMsg: 'Only alphabeat are allow to use'),

    /// Password Exception is contain ?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$
    RegExpType.passwordRegExp: _RegExpData(
        regExpSyntax: r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,}$',
        errorMsg: 'Invalid Password Found')
  };

  String? set(String? text) {
    final _temp =
        regExpLibrary.entries.singleWhere((e) => e.key == _regExpType).value;

    if (text!.isEmpty) {
      return null;
    } else {
      if (!RegExp(_temp.regExpSyntax).hasMatch(text))
        return errorMsg ?? _temp.errorMsg;

      if (text.length < min) return 'Too short';

      if (max != null && text.length > max!) return 'Too large';

      return null;
    }
  }

  @override
  String toString() {
    // TODO: implement toString
    super.toString();
    return 'RegExpType: ' +
        _regExpType.name +
        'ErrorMsg: ' +
        (errorMsg ??
            regExpLibrary.entries
                .singleWhere((e) => e.key == _regExpType)
                .value
                .errorMsg);
  }
}
