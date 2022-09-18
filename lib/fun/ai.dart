class Ai {
  /// return a array of string without space lowercase word.
  List<String> autokeywordsGenerator(String text) {
    var textlist = text.trim().split(' ');
    List<String> triggers = [];
    for (int i = 0; i < textlist.length; i++) {
      if (textlist[i].length > 3 || textlist[i].contains(RegExp(r'[0-9*$]'))) {
        var temp = textlist.sublist(i).join();
        triggers.add(temp.toLowerCase());
      }
    }
    var first = textlist.join().toLowerCase();
    if (!triggers.contains(first)) {
      triggers.insert(0, first);
    }
    return triggers;
  }

  /// return a string without space lowercase word.
  String keywordsGenerator(String text) => text.trim().toLowerCase();
}
