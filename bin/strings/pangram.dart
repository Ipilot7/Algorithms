import 'utils.dart';

void main(List<String> args) {
  var p = Pangram();
  print(p.isPangram("The quick brown fox jumps over the lazy dog"));
  print(p.isPangram("The quick brown fox jumps over the azy dog"));
}

class Pangram {
  bool isPangram(String s) {
    var marked = List<bool>.filled(26, false);
    /* by default all letters don't exists */
    List<String> values = s.split('').toList();

    for (var value in values) {
      int elem = value.codeUnitAt(0);
      if (isLetter(elem)) {
        int index = isUpperCase(elem) ? elem - 65 : elem - 97;
        marked[index] = true;
        /* mark current character exists */
      }
    }

    for (var b in marked) {
      if (!b) {
        return false;
      }
    }
    return true;
  }
}
