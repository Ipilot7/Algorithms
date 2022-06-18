import 'dart:math';
import '../devutils/searches/search_algorithm.dart';

void main(List<String> args) {
  LinearSearch linearSearch = LinearSearch();
  // just generate data
  Random r = Random();

  List<int> integers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  // the element that should be found

  int atIndex = linearSearch.find<num>(integers, 9);
  print(atIndex);
}

class LinearSearch implements SearchAlgorithm {
  @override
  int find<T extends Comparable<T>>(List<T> array, T value) {
    for (int i = 0; i < array.length; i++) {
      if (array[i].compareTo(value) == 0) {
        return i;
      }
    }
    return -1;
  }
}
