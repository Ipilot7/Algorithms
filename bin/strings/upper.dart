import 'utils.dart';

// В uppercase
toUpperCaseInMy(String str) {
  List values = str.split('').toList();
  for (int i = 0; i < str.length; i++) {
    if (isLetter(str[i].codeUnitAt(0)) && isUpperCase(str[i].codeUnitAt(0))) 
    {
      values[i] = values[i].toString().toUpperCase();
    }
  }
  return values.join();
}
