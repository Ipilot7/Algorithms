
import 'sort_algorithm.dart';
import 'sort_utils.dart';

class SimpleSort with SortUtils implements SortAlgorithm {

    @override
    sort<T extends Comparable<T>>(List<T> array) {
        final int length = array.length;

        for (int i = 0; i < length; i++) {
            for (int j = i + 1; j < length; j++) {
                if (less(array[j], array[i])) {
                    T element = array[j];
                    array[j] = array[i];
                    array[i] = element;
                }
            }
        }
        return array;
    }
}
void main(List<String> args) {
  SimpleSort simpleSort=SimpleSort();
  List<int> a = [3, 7, 45, 1, 33, 5, 2, 9];
        print("unsorted: ");
        print(a);

        simpleSort.sort<num>(a);
        print("sorted: ");
        print(a);
        
        List<String> b = ["banana", "berry", "orange", "grape", "peach", "cherry", "apple", "pineapple"];
        print("unsorted: ");
        print(b);
    
        simpleSort.sort(b);
        print("sorted: ");
        print(b);
}
