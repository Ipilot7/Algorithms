import 'utils.dart';

// В lowercase
toLowerCaseInMy(String str) {
  List values = str.split('').toList();
  for (int i = 0; i < str.length; i++) {
    if (isLetter(str[i].codeUnitAt(0)) && isUpperCase(str[i].codeUnitAt(0))) 
    {
      values[i] = values[i].toString().toLowerCase();
    }
  }
  return values.join();
  
}
