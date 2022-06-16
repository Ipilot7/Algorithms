import 'dart:collection';

class LongestNonRepeativeSubstring {
  HashMap<String, int> map = HashMap();

  int ofLongestSubstring(String s) {
    int max = 0, start = 0, i = 0;

    while (i < s.length) {
      String temp = s[i];

      // adding key to map if not present
      if (!map.containsKey(temp)) {
        map.putIfAbsent(temp, () => 0);
      }

      // checking if the first v{alue is the dublicate value
      else if (s[start] == temp) {
        start++;
      }

      // checking if the previous value is dublicate value
      else if (s[i - 1] == temp) {
        if (max < sizes()) {
          max = sizes();
          map = HashMap();
          start = i;
          i--;
        }
      }

      // last possible place where dublicate value can be is between start and i
      else {
        if (max < sizes()) max = sizes();
        while (s[start] != temp) {
          map.remove(s[start]);
          start++;
        }
        start++;
      }

      i++;
    }
    if (max < sizes()) max = sizes();
    return max;
  }

  int sizes() => map.length;
}
