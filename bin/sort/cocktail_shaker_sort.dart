import 'sort_algorithm.dart';
import 'sort_utils.dart';

void main(List<String> args) {
  
        CocktailShakerSort shakerSort = CocktailShakerSort();
        
        List<int> integers = [4, 23, 6, 78, 1, 54, 231, 9, 12];
        // Output => 1 4 6 9 12 23 54 78 231
        print(shakerSort.sort<num>(integers));

        // String Input
        List<String> strings = ["c", "a", "e", "b", "d"];
        print(shakerSort.sort(strings));
}

class CocktailShakerSort with SortUtils implements SortAlgorithm {
   /**
     * Этот метод реализует общую сортировку шейкера для коктейлей
     *
     * @param array Сортируемый массив Сортирует массив в порядке возрастания
     */
    @override
    sort<T extends Comparable<T>>(List<T> array) {

        int length = array.length;
        int left = 0;
        int right = length - 1;
        int swappedLeft, swappedRight;
        while (left < right) {
            // front
            swappedRight = 0;
            for (int i = left; i < right; i++) {
                if (less(array[i + 1], array[i])) {
                    swap(array, i, i + 1);
                    swappedRight = i;
                }
            }
            // back
            right = swappedRight;
            swappedLeft = length - 1;
            for (int j = right; j > left; j--) {
                if (less(array[j], array[j - 1])) {
                    swap(array, j - 1, j);
                    swappedLeft = j;
                }
            }
            left = swappedLeft;
        }
        return array;
    }
}
