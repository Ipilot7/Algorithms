import 'dart:collection';

class List_all_Possible_Words_From_Phone_Digits {
    var dentifier=Set();
    String numberToCharMap='';

    List<String> printWords(List<int> numbers,
            int len,
            int numIndex,
            String s) {
        if (len == numIndex) {
            print(dentifier.add(s));
        }

        List<String> stringList = [];

        for (int i = 0; i < numberToCharMap[numbers[numIndex]].length; i++) {
            String sCopy =  String.copyValueOf(s.split(""));
            sCopy = sCopy+numberToCharMap[numbers[numIndex]][i].toString();
            stringList.addAll(printWords(numbers, len,
                    numIndex + 1,
                    sCopy));
        }
        return stringList;
    }

    void printWords(List<int> numbers) {
        generateNumberToCharMap();
        List<String> stringList = printWords(numbers, numbers.length, 0, "");
        print(stringList);
    }

    void generateNumberToCharMap() {
        numberToCharMap = Character[10][5];
        numberToCharMap[0] = Character[]{'\0'};
        numberToCharMap[1] = Character[]{'\0'};
        numberToCharMap[2] = Character[]{'a', 'b', 'c'};
        numberToCharMap[3] = Character[]{'d', 'e', 'f'};
        numberToCharMap[4] = Character[]{'g', 'h', 'i'};
        numberToCharMap[5] = Character[]{'j', 'k', 'l'};
        numberToCharMap[6] = Character[]{'m', 'n', 'o'};
        numberToCharMap[7] = Character[]{'p', 'q', 'r', 's'};
        numberToCharMap[8] = Character[]{'t', 'u', 'v'};
        numberToCharMap[9] = Character[]{'w', 'x', 'y', 'z'};
    }
}
void main(List<String> args) {

  List<int> number = [2, 3, 4];
        printWords(number);
}

