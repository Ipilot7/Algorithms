
import 'sort_algorithm.dart';
import 'sort_utils.dart';

class MergeSort with SortUtils implements SortAlgorithm {
 /**
     * Реализует универсальный алгоритм сортировки слиянием.
     *
     * @param несортированный массив, который должен быть отсортирован.
     * @param <T> Сопоставимый класс.
     * @возвращает отсортированный массив.
     */
  @override
  List<T> sort<T extends Comparable<T>>(List<T> unsorted) {
    doSort(unsorted, 0, unsorted.length - 1);
    return unsorted;
  }

/**
     * @param - массив, подлежащий сортировке.
     * @param оставил первый индекс массива.
     * @param - последний индекс массива.
     */
  void doSort<T extends Comparable<T>>(List<T> arr, int left, int right) {
    if (left < right) {
      int mid = (left + right) >>> 1;
      doSort(arr, left, mid);
      doSort(arr, mid + 1, right);
      merge(arr, left, mid, right);
    }
  }

 /**
* Объединяет две части массива.
*
* @param - массив, подлежащий объединению.
* @param оставил первый индекс массива.
* @param - средний индекс массива.
* @param справа последний индекс массива объединяет две части массива в
порядке возрастания.
*/
  void merge<T extends Comparable<T>>(
      List<T> arr, int left, int mid, int right) {
    int length = right - left + 1;
    List<T> temp = List.filled(length, arr[0]);
    int i = left;
    int j = mid + 1;
    int k = 0;

    while (i <= mid && j <= right) {
      if (arr[i].compareTo(arr[j]) <= 0) {
        temp[k++] = arr[i++];
      } else {
        temp[k++] = arr[j++];
      }
    }

    while (i <= mid) {
      temp[k++] = arr[i++];
    }

    while (j <= right) {
      temp[k++] = arr[j++];
    }
    List.copyRange(arr, left, temp, 0, length);
  }
}

void main() {
  MergeSort mergeSort = MergeSort();

  List<int> arr = [4, 23, 6, 78, 1, 54, 231, 9, 12];
  List<String> stringArray = ["c", "a", "e", "b", "d"];

  print(mergeSort.sort<num>(arr));
  print(mergeSort.sort(stringArray));
}