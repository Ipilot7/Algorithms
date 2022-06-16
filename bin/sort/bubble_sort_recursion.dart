import 'sort_algorithm.dart';
import 'sort_utils.dart';
import 'dart:math';

void main(List<String> args) {
        
        BubbleSortRecursion bubbleSortRecursion = BubbleSortRecursion();
        Random random = Random();
                
        /* generate 10 random numbers from -50 to 49 */
        List<int> array = List.generate(10, (_) => random.nextInt(49)-50);
        
        print(bubbleSortRecursion.sort<num>(array));
}
 
 class BubbleSortRecursion with SortUtils implements SortAlgorithm {

    @override
    sort<T extends Comparable<T>>(List<T> unsorted) {
        bubbleSort(unsorted, unsorted.length);
        return unsorted;
    }
    
    void bubbleSort<T extends Comparable<T>> (List<T> unsorted, int len) {
        bool swapped = false;
        /* flag to check if array is sorted or not */
        for (int i = 0; i < len - 1; ++i) {
            if (greater(unsorted[i], unsorted[i + 1])) {
                swap(unsorted, i, i + 1);
                swapped = true;
            }
        }
        if (swapped) {
            bubbleSort(unsorted, len - 1);
        }
    }
}
