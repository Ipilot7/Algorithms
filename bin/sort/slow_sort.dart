import 'sort_algorithm.dart';
import 'sort_utils.dart';

class SlowSort with SortUtils implements SortAlgorithm {
  @override
  sort<T extends Comparable<T>>(List<T> unsortedArray) {
    sort1(unsortedArray, 0, unsortedArray.length - 1);
  }

  sort1<T extends Comparable<T>>(List<T> array, int i, int j) {
    if (i.compareTo(j) >= 0) {
      return;}
      int m = (i + j) ~/ 2;
      sort1(array, i, m);
      sort1(array, m + 1, j);
    if (less(array[j], array[m])) {
      T temp = array[j];
      array[j] = array[m];
      array[m] = temp;
    }
    sort1(array, i, j - 1);
  }
}

void main(List<String> args) {
  SlowSort slowSort = SlowSort();

  List<int> integerArray = [8, 84, 53, 953, 64, 2, 202, 98];
  print(integerArray);

  slowSort.sort<num>(integerArray);
  print(integerArray);

  List<String> stringArray = ["g", "d", "a", "b", "f", "c", "e"];
  print(stringArray);

  slowSort.sort(stringArray);
  print(stringArray);
}
