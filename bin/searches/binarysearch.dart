import 'dart:math';

import '../devutils/searches/search_algorithm.dart';

class BinarySearch implements SearchAlgorithm {
  @override
  find<T extends Comparable<T>>(List<T> array, T key) {
    return search(array, key, 0, array.length);
  }

  int search<T extends Comparable<T>>(
      List<T> array, T key, int left, int right) {
    if (right < left) {
      return -1; // this means that the key not found
    }
    // find median
    int median = (left + right) >>> 1;
    int comp = key.compareTo(array[median]);

    if (comp == 0) {
      return median;
    } else if (comp < 0) {
      return search(array, key, left, median - 1);
    } else {
      return search(array, key, median + 1, right);
    }
  }
}

void main(List<String> args) {
  List<int> l=[1,4,3,2,5,4,6,5,4,6,8];

  BinarySearch search = BinarySearch();

  print(search.find<num>(l,0 ));
}
