import 'sort_algorithm.dart';
import 'sort_utils.dart';

 //Реализация алгоритма гребенчатой сортировки

 void main(List<String> args) {
     CombSort ob = CombSort();
        List<int> arr = [8, 4, 1, 56, 3, -44, -1, 0, 36, 34, 8, 12, -66, -78, 23, -6, 28, 0];
        ob.sort<num>(arr);

        print("sorted array");
        print(arr);
}

class CombSort with SortUtils implements SortAlgorithm {
  
  int _nextGap(int gap) {
    
    gap = ((gap * 10) / 13).toInt();
    return (gap < 1) ? 1 : gap;
  }

  @override
  sort<T extends Comparable<T>>(List<T> arr) {
    int size = arr.length;

    int gap = size;

    bool swapped = true;

    while (gap != 1 || swapped) {
      
      gap = _nextGap(gap);

      swapped = false;

      for (int i = 0; i < size - gap; i++) {
        if (less(arr[i + gap], arr[i])) {
          
          swapped = swap(arr, i, i + gap);
        }
      }
    }
    return arr;
  }
}
