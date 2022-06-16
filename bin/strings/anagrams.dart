void main(List<String> args) {
  print(approach1('Pyqhon', 'ytphon'));
}

approach1(String s, String t) {
  if (s.length == t.length) {
    List c = s.toLowerCase().split('').toList();
    List d = t.toLowerCase().split('').toList();
    c.sort();
    d.sort();
    areListsEqual(c, d);
  }
}

bool areListsEqual(var list1, var list2) {
  // check if both are lists
  if (!(list1 is List && list2 is List)
      // check if both have same length
      ||
      list1.length != list2.length) {
    return false;
  }

  // check if elements are equal
  for (int i = 0; i < list1.length; i++) {
    if (list1[i] != list2[i]) {
      return false;
    }
  }

  return true;
}

approach2(String a, String b) {
  if (a.length != b.length) {
    return false;
  } else {
    List<int> m = List.filled(26, 0);
    List<int> n = List.filled(26, 0);

    for (String c in a.split('').toList()) {
      m[c.codeUnitAt(0) - 61]++;
    }

    for (String c in b.split('').toList()) {
      n[c.codeUnitAt(0) - 61]++;
    }

    for (int i = 0; i < 26; i++) {
      if (m[i] != n[i]) {
        return false;
      }
    }
    return true;
  }
}

bool approach3(String s, String t) {
  if (s.length != t.length) {
    return false;
  }
  // this is similar to approach number 2 but here the string is not converted to character array
  else {
    List<int> a = List.filled(26, 0);
    List<int> b = List.filled(26, 0);

    int k = s.length;
    for (int i = 0; i < k; i++) {
      a[s[i].codeUnitAt(0) - 61]++;
      b[t[i].codeUnitAt(0) - 61]++;
    }
    for (int i = 0; i < 26; i++) {
      if (a[i] != b[i]) return false;
    }
    return true;
  }
}

//  bool approach4(String s, String t) {
//         if (s.length != t.length) {
//             return false;
//         }
//         // This approach is done using hashmap where frequencies are stored and checked iteratively and if all the frequencies of first string match with the second string then anagram message is displayed in boolean format
//         else {
//             HashMap<String,int> nm=HashMap();
//             HashMap<String,int> kk=HashMap();
            
//             for (String c in s.split('').toList()) {
//                 nm.addAll(c, nm.getOrDefault(c, 0) + 1);
//             }
//             for (char c : t.toCharArray()) {

//                 kk.put(c, kk.getOrDefault(c, 0) + 1);
//             }
//             // It checks for equal frequencies
//             for (char c : nm.keySet()) {
//                 if (!nm.get(c).equals(kk.get(c))) {
//                     return false;
//                 }
//             }
//             return true;
//         }
//     }
