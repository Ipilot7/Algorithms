import 'sort_algorithm.dart';
import 'sort_utils.dart';
import 'dart:math';

void main(List<String> args) {
  BogoSort bogoSort = BogoSort();

  List<int> integers = [4, 23, 6, 78, 1, 54, 231, 9, 12];
  List<String> strings = ["c", "a", "e", "b", "d"];

  print(bogoSort.sort<num>(integers));
  print(bogoSort.sort(strings));
}

class BogoSort with SortUtils implements SortAlgorithm {
  final Random random = Random();

  bool isSorted<T extends Comparable<T>>(List<T> array) {
    for (int i = 0; i < array.length - 1; i++) {
      if (less(array[i + 1], array[i])) {
        return false;
      }
    }
    return true;
  }

  // Randomly shuffles the array
  void nextPermutation(List array) {
    int length = array.length;

    for (int i = 0; i < array.length; i++) {
      int randomIndex = i + random.nextInt(length - i);
      swap(array, randomIndex, i);
    }
  }

  sort<T extends Comparable<T>>(array) {
    while (!isSorted(array)) {
      nextPermutation(array);
    }
    return array;
  }
}
