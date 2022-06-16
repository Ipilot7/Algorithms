import 'dart:collection';

import 'package:test/expect.dart';

class HorspoolSearch {
  HashMap<String, int> shiftValues = HashMap(); // таблица неправильных символов
  int patternLength = 0;
  int comparisons = 0; // общее количество сравнений в текущем/последнем поиске

  int findFirst(String pattern, String text) {
    return firstOccurrence(pattern, text, true);
  }

  int findFirstInsensitive(String pattern, String text) {
    return firstOccurrence(pattern, text, false);
  }

  int getLastComparisons() {
    return comparisons;
  }

  int firstOccurrence(String pattern, String text, bool caseSensitive) {
    shiftValues = calcShiftValues(pattern); // создайте таблицу плохих символов
    comparisons = 0; // сброс сравнений

    int textIndex = pattern.length -1; 
    // выровнять шаблон по началу текста и получить индекс последнего символа

    // пока шаблон не выходит за пределы текста
    while (textIndex < text.length) {
     // попробуйте сопоставить шаблон с текущей частью текста, начиная с последнего символа
      int i = pattern.length - 1;
      while (i >= 0) {
        comparisons++;
        String patternChar = pattern[i];
        String textChar = text[(textIndex + i) - (pattern.length - 1)];
        if (!charEquals(patternChar, textChar, caseSensitive)) {
          // плохой характер, сменный шаблон
          textIndex += getShiftValue(text[textIndex]);
          break;
        }
        i--;
      }

      // проверка на полное совпадение
      if (i == -1) {
        return (textIndex - pattern.length + 1).toInt();
      }
    }

    // текст исчерпан, возврат невозможен
    return -1;
  }

  bool charEquals(String c1, String c2, bool caseSensitive) {
    if (caseSensitive) {
      return c1 == c2;
    }
    return (c1).toLowerCase == (c2).toLowerCase;
  }

  HashMap<String, int> calcShiftValues(String pattern) {
    patternLength = pattern.length;
    HashMap<String, int> table = HashMap();

    for (int i = pattern.length - 2; i >= 0; i--) {
    // length - 2 - это индекс предпоследнего символа
      String c = pattern[i];
      int finalI = i;
      table.putIfAbsent(c, () => pattern.length - 1 - finalI);
    }

    return table;
  }

  int getShiftValue(String c) {
    var a = shiftValues[c];
    if (shiftValues[c] != null) {
      return a!;
    } else {
      return patternLength;
    }
  }
}

void main(List<String> args) {
  HorspoolSearch horspoolSearch = HorspoolSearch();

String b='Baxtiyor';
  print(horspoolSearch.findFirstInsensitive(b, 'Baxtiyor Botiraliyev'));
}
