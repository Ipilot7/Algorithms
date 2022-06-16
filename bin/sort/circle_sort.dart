import 'sort_algorithm.dart';
import 'sort_utils.dart';

void main(List<String> args) {
   CircleSort CSort = CircleSort();

        List<int> arr = [4, 23, 6, 78, 1, 54, 231, 9, 12];
        print(CSort.sort<num>(arr));
        for (int i = 0; i < arr.length - 1; ++i) {
          arr[i] <= arr[i + 1];
        }

        List<String> stringArray = ["c", "a", "e", "b", "d"];
        print(CSort.sort(stringArray));
        for (int i = 0; i < stringArray.length - 1; ++i) {
            arr[i].compareTo(arr[i + 1]) <= 0;
        }
}

class CircleSort with SortUtils implements SortAlgorithm {

    @override
    sort<T extends Comparable<T>>(List<T>array) {
        int n = array.length;
        while (doSort(array, 0, n - 1));
        return array;
    }

   /* Этот метод реализует рекурсивную версию циклической сортировки
    * @param array Массив, подлежащий сортировке
    * @param - левая граница сортируемой в данный момент детали
    * @param правая граница сортируемой в данный момент детали
    */
    bool doSort<T extends Comparable<T>> (List<T> array, int left, int right) {
        bool swapped = false;

        if (left == right) {
            return false;
        }

        int low = left;
        int high = right;

        while (low < high) {
            if (array[low].compareTo(array[high]) > 0) {
                swap(array, low, high);
                swapped = true;
            }
            low++;
            high--;
        }

        if (low == high && array[low].compareTo(array[high + 1]) > 0) {
            swap(array, low, high + 1);
            swapped = true;
        }

        int mid = (left + (right - left) / 2).toInt();
        bool leftHalf = doSort(array, left, mid);
        bool rightHalf = doSort(array, mid + 1, right);

        return swapped || leftHalf || rightHalf;
    }
}
