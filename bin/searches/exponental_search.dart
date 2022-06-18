import 'dart:math';

import '../devutils/searches/search_algorithm.dart';
import 'binarysearch.dart';

class ExponentialSearch with BinarySearch implements SearchAlgorithm {
  BinarySearch binarySearch = BinarySearch();

  @override
  int find<T extends Comparable<T>>(List<T> array, T key) {
    if (array[0] == key) {
      return 0;
    }
    if (array[array.length - 1] == key) {
      return array.length;
    }

    int range = 1;

    while (range < array.length && array[range].compareTo(key) <= -1) {
      range = range * 2;
    }

    return Array.binarySearch(
        array, range / 2, min(range, array.length), key);
  }
}

void main(List<String> args) {
  Random r = Random.secure();

  List<int> integers = [1,2,3,2,1,2,32,4,5,6,5,4,3];

  ExponentialSearch search = new ExponentialSearch();
  int atIndex = search.find<num>(integers, 9);

  print("Found ${integers[atIndex]} at index $atIndex. An array length ${integers.length}");
}
