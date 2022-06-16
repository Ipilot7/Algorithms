import '../searches/quickselect.dart';
import 'sort_algorithm.dart';
import 'sort_utils.dart';

class WiggleSort with SortUtils, QuickSelect implements SortAlgorithm {
  @override
  sort<T extends Comparable<T>>(List<T> unsorted) {
    return wiggleSort(unsorted);
  }

  int mapIndex(int index, int n) {
    return ((2 * index + 1) % (n | 1));
  }

  void triColorSort<T extends Comparable<T>>(List<T> sortThis, T median) {
    int n = sortThis.length;
    int i = 0;
    int j = 0;
    int k = n - 1;
    while (j <= k) {
      if (0 < sortThis[mapIndex(j, n)].compareTo(median)) {
        swap(sortThis, mapIndex(j, n), mapIndex(i, n));
        i++;
        j++;
      } else if (0 > sortThis[mapIndex(j, n)].compareTo(median)) {
        swap(sortThis, mapIndex(j, n), mapIndex(k, n));
        k--;
      } else {
        j++;
      }
    }
  }

  wiggleSort<T extends Comparable<T>>(List<T> sortThis) {
    // find the median using quickSelect (if the result isn't in the array, use the next greater value)
   T median = select(sortThis, (sortThis.length / 2.0).floor());

    int numMedians=0;

    for (T sortThi in sortThis) {
      if (0 == sortThi.compareTo(median)) {
        numMedians++;
      }
    }

    if (sortThis.length % 2 == 1 && numMedians == (sortThis.length / 2.0).ceil()) {
      T smallestValue = select(sortThis, 0);
      if (!(0 == smallestValue.compareTo(median))) {
        throw Exception(
            "For odd Arrays if the median appears ceil(n/2) times, the median has to be the smallest values in the array");
      }
    }
    if (numMedians > (sortThis.length / 2.0).ceil()) {
      throw Exception(
          "No more than half the number of values may be the same.");
    }

    triColorSort(sortThis, median);
    return sortThis;
  }
}

void main(List<String> args) {
  WiggleSort wiggleSort = WiggleSort();
  List<int> n = [1, 3, 2, 5, 4, 3, 6, 7, 8, 9, 7, 6, 5, 6, 7];
  print(wiggleSort.sort<num>(n));
}
