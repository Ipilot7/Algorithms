bool isAllCharactersSame(String s) {
  for (int i = 1; i < s.length; ++i) {
    if (s.codeUnitAt(i) != s.codeUnitAt(0)) {
      return false;
    }
  }
  return true;
}
