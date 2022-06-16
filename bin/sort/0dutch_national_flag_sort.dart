import 'sort_algorithm.dart';
import 'sort_utils.dart';

void main(List<String> args) {
  DutchNationalFlagSort dutch = DutchNationalFlagSort();
  List<int> arr = [4, 23, 6, 78, 1, 26, 11, 23, 0];
  print(dutch.sort<num>(arr));
}

class DutchNationalFlagSort with SortUtils implements SortAlgorithm {
  @override
  sort<T extends Comparable<T>>(List<T> unsorted) {
    return dutch_national_flag_sort(
        unsorted, unsorted[(unsorted.length / 2).floor()]);
  }

  sort1<T extends Comparable<T>>(List<T> unsorted, T intendedMiddle) {
    return dutch_national_flag_sort(unsorted, intendedMiddle);
  }

  dutch_national_flag_sort<T extends Comparable<T>>(
      List<T> arr, T intendedMiddle) {
    int i = 0,j = 0, k = arr.length - 1;

    while (j <= k) {
      if (0 > arr[j].compareTo(intendedMiddle)) {
        swap(arr, i, j);
        j++;
        i++;
      } else if (0 < arr[j].compareTo(intendedMiddle)) {
        swap(arr, j, k);
        k--;
      } else {
        j++;
      }
    }
    return arr;
  }
}
