import 'sort_algorithm.dart';
import 'sort_utils.dart';

class StoogeSort with SortUtils implements SortAlgorithm {

    @override
    sort<T extends Comparable<T>>(List<T> unsortedArray) {
        sort1(unsortedArray, 0, unsortedArray.length);
        return unsortedArray;
    }

    sort1<T extends Comparable<T>>(List<T> unsortedArray, int start, int end) {
        if (less(unsortedArray[end - 1], unsortedArray[start])) {
            T temp = unsortedArray[start];
            unsortedArray[start] = unsortedArray[end - 1];
            unsortedArray[end - 1] = temp;
        }

        int len = end - start;
        if (len > 2) {
            int third = len ~/ 3;
            sort1(unsortedArray, start, end - third);
            sort1(unsortedArray, start + third, end);
            sort1(unsortedArray, start, end - third);
        }
        return unsortedArray;
    }
}
 void main(List<String> args) {
        StoogeSort stoogeSort = StoogeSort();

        List<int> integerArray = [8, 84, 53, 953, 64, 2, 202];
        print(integerArray);

        stoogeSort.sort<num>(integerArray);
        print(integerArray);

        List<String> stringArray = ["g", "d", "a", "b", "f", "c", "e"];
        print(stringArray);

        stoogeSort.sort(stringArray);
        print(stringArray);
    }
