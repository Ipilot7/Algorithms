bool hasVowels(String input) {
  return countVowels(input) > 0;
}

// --------------------------------------------
int countVowels(String input) {
  List<String> vovels = ['a', 'e', 'i', 'o', 'u'];

  if (input.isEmpty) {
    return 0;
  }
  int cnt = 0;

  List<String> s = input.split('').toList();

  for (String elem in s) {
    if (vovels.contains(elem)) {
      cnt++;
    }
  }
  return cnt;
}
