
import 'sort_algorithm.dart';
import 'sort_utils.dart';

void main(List<String> args) {
        InsertionSort sort=InsertionSort();
        List<int> integers = [4, 23, 6, 78, 1, 54, 231, 9, 12];
        sort.sort<num>(integers);
        print(integers);
        /* [1, 4, 6, 9, 12, 23, 54, 78, 231] */

        List<String> strings = ["c", "a", "e", "b", "d"];
        sort.sort(strings);
        print(strings);
        /* [a, b, c, d, e] */
    }

class InsertionSort with SortUtils implements SortAlgorithm {

    @override
    sort<T extends Comparable<T>>(List<T> array) {
        for (int i = 1; i < array.length; i++) {
            T insertValue = array[i];
            int j;
            for (j = i - 1; j >= 0 && less(insertValue, array[j]); j--) {
                array[j + 1] = array[j];
            }
            if (j != i - 1) {
                array[j + 1] = insertValue;
            }
        }
        return array;
    }
}
