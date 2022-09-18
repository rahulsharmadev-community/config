String readableNumber(String number) {
  RegExp _readableNumber = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
  String Function(Match) _mathFunc = (Match match) => '${match[1]},';
  return number.replaceAllMapped(_readableNumber, _mathFunc);
}
