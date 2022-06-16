//Alphabetical 
//Проверяе на упорядочен ли строка как в алфавитном последовательности

void main(List<String> args) {
 Alphabetical().alphaBetical('adcd');
}

class Alphabetical{
bool checkToCodeUnit(int codeUnit) =>
    (codeUnit >= 65 && codeUnit <= 90 || codeUnit >= 97 && codeUnit <= 122);

alphaBetical(String str) {
  str = str.toLowerCase();

  for (int i = 0; i < str.length - 1; i++) {
    int codeUnit = str[i].codeUnitAt(0);
    if (!checkToCodeUnit(codeUnit) || !(codeUnit <= str[i + 1].codeUnitAt(0))) {
      return print(false);
    }
  }
  return print(true);
}

}