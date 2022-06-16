import 'dart:io';

void main(List<String> args) {
  Solution s = Solution();
  String str = "";
  print("Enter the string: ");
  str = stdin.readLineSync()!;
  print("Longest substring is : ${s.longestPalindrome(str)}");
}

class Solution {
  String longestPalindrome(String s) {
    if (s.isEmpty) {
      return "";
    }

    int n = s.length;
    String maxStr = "";

    for (int i = 0; i < n; i++) {
      for (int j = i; j < n; j++) {
        if (_isValid(s, i, j) == true) {
          if (j - i + 1 > maxStr.length) {
            // update maxStr
            maxStr = s.substring(i, j + 1);
          }
        }
      }
    }
    return maxStr;
  }

  bool _isValid(String s, int lo, int hi) {
    int n = hi - lo + 1;
    for (int i = 0; i < n / 2; i++) {
      if (s.codeUnitAt(lo+i) != s.codeUnitAt(hi - i)) {
        return false;
      }
    }
    return true;
  }
}
