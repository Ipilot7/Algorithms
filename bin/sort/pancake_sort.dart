 import 'sort_algorithm.dart';
import 'sort_utils.dart';

 void main(List<String> args) {
        PancakeSort pancakeSort = PancakeSort();
        List<int> arr = [10, 9, 8, 7, 6, 15, 14, 7, 4, 3, 8, 6, 3, 1, 2, -2, -5, -8, -3, -1, 13, 12, 11, 5, 4, 3, 2, 1];
        
        print("After sorting:");
        pancakeSort.sort<num>(arr);
        print(arr);
    }

class PancakeSort with SortUtils implements SortAlgorithm {

    @override
    sort<T extends Comparable<T>> (List<T> array) {
        int size = array.length;

        for (int i = 0; i < size; i++) {
            T max = array[0];
            int index = 0;
            for (int j = 0; j < size - i; j++) {
                if (less(max, array[j])) {
                    max = array[j];
                    index = j;
                }
            }
            flip(array, index, array.length - 1 - i);
        }
        return array;
    }
}
