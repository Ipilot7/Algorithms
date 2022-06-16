import 'sort_algorithm.dart';
import 'sort_utils.dart';

void main(List args) {
  BubbleSort bubbleSort = BubbleSort();

  List<int> integers = [4, 23, 6, 78, 1, 54, 231, 9, 12];
  print(bubbleSort.sort<num>(integers));
  //[1, 4, 6, 9, 12, 23, 54, 78, 231]

  List<String> strings = ["c", "a", "e", "b", "d"];
  print(bubbleSort.sort(strings));
  /* output: [a, b, c, d, e] */
}

class BubbleSort with SortUtils implements SortAlgorithm {
  @override
  sort<T extends Comparable<T>>(List<T> array) {
    for (int i = 1, size = array.length; i < size; ++i) {
      bool swapped = false;
      for (int j = 0; j < size - i; ++j) {
        if (greater<T>(array[j], array[j + 1])) {
          swap(array, j, j + 1);
          swapped = true;
        }
      }
      if (!swapped) {
        break;
      }
    }
    return array;
  }
}
