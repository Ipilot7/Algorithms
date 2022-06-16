void main(List<String> args) {
  var p = Polindrom();
  print(p.isPalindrome('Aziza'));
  print(p.isPalindromeRecursion('оно'));
  print(p.isPalindrome1('yes'));
}

class Polindrom {
  // Провеярем строку на полиндросность
  bool isPalindrome(String s) => (s.length <= 1 ||
      (s == (s.split('').toList().reversed).join().toLowerCase()));

  // Проверяем строку на полиндромность используя рекурсию
  bool isPalindromeRecursion(String s) {
    if (s.length <= 1) {
      return true;
    }

    if (s.codeUnitAt(0) != s.codeUnitAt(s.length - 1)) {
      return false;
    }

    return isPalindrome(s.substring(1, s.length - 1));
  }

  // Проверяем стору на полиндрому если нет другого способа

  bool isPalindrome1(String s) {
    if (s.length <= 1) {
      return true;
    }
    for (int i = 0, j = s.length - 1; i < j; i++, j++) {
      if (s.codeUnitAt(i) != s.codeUnitAt(j)) {
        return false;
      }
    }
    return true;
  }
}
