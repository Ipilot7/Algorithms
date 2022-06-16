import 'sort_algorithm.dart';
import 'sort_utils.dart';

class SwapSort with SortUtils implements SortAlgorithm {

    @override
    sort<T extends Comparable<T>>(List<T> array) {
        int length = array.length;
        int index = 0;

        while (index < length - 1) {
            int amountSmallerElements = this.getSmallerElementCount(array, index);

            if (amountSmallerElements > 0 && index != amountSmallerElements) {
                T element = array[index];
                array[index] = array[amountSmallerElements];
                array[amountSmallerElements] = element;
            } else {
                index++;
            }
        }

        return array;
    }

    int getSmallerElementCount<T extends Comparable<T>>(List<T> array, int index) {
        int counter = 0;
        for (int i = 0; i < array.length; i++) {
            if (less(array[i], array[index])) {
                counter++;
            }
        }

        return counter;
    }
}

void main(List<String> args) {
        SwapSort swapSort=SwapSort();
        List<int> a = [3, 7, 45, 1, 33, 5, 2, 9];
        print("unsorted: ");
        print(a);

        swapSort.sort<num>(a);
        print("sorted: ");
        print(a);
  
        List<String> b = ["banana", "berry", "orange", "grape", "peach", "cherry", "apple", "pineapple"];
        print("unsorted: ");
        print(b);

        swapSort.sort(b);
        print("sorted: ");
        print(b);
    }