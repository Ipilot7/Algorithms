void main(List<String> args) {
  var per = PermuteString();
  String str = "ABC";
  int len = str.length;
  print("All the permutations of the string are: ");
  per.generatePermutation(str, 0, len);
}

class PermuteString {
  //Функция для замены символов в позиции I на символы в позиции j
  String swapString(String a, int i, int j) {
    List<String> b = a.split('').toList();
    String ch;
    ch = b[i];
    b[i] = b[j];
    b[j] = ch;
    return b.join();
  }

  //Функция для генерации различных перестановок строки
  void generatePermutation(String str, int start, int end) {
    //Выводит перестановки
    if (start == end - 1) {
      print(str);
    } else {
      for (int i = start; i < end; i++) {
        //Замена строки путем исправления символа
        str = swapString(str, start, i);
        //Рекурсивно вызывающая функция генерирует перестановку() для остальных символов
        generatePermutation(str, start + 1, end);
        //Возврат назад и повторная замена символов.
        str = swapString(str, start, i);
      }
    }
  }
}
