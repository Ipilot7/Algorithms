import 'sort_algorithm.dart';
import 'sort_utils.dart';

class ShellSort with SortUtils implements SortAlgorithm {

    @override
    sort<T extends Comparable<T>>(List<T> array) {
        int length = array.length;
        int gap = 1;

        while (gap < length / 3) {
            gap = 3 * gap + 1;
        }

        for (int i = gap; gap > 0; gap ~/= 3) {
            for (int i = gap; i < length; i++) {
                int j;
                T temp = array[i];
                for (j = i; j >= gap && less(temp, array[j - gap]); j -= gap) {
                    array[j] = array[j - gap];
                }
                array[j] = temp;
            }
        }
        return array;
    }
}

    void main(List<String> args) {
        ShellSort sort = ShellSort();
        List<int> toSort = [4, 23, 6, 78, 1, 54, 231, 9, 12];

        
        sort.sort<num>(toSort);
        for (int i = 0; i < toSort.length - 1; ++i) {
            toSort[i] <= toSort[i + 1];
        }
        print(toSort);
    }