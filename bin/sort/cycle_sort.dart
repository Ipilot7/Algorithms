
import 'sort_algorithm.dart';
import 'sort_utils.dart';

void main(List<String> args) {
  List<int> arr = [4, 23, 6, 78, 1, 26, 11, 23, 0, -6, 3, 54, 231, 9, 12];
        CycleSort cycleSort = new CycleSort();
        cycleSort.sort<num>(arr);

        print("After sort : ");
        print(arr);
}

class CycleSort with SortUtils implements SortAlgorithm{

    @override
    sort<T extends Comparable<T>>(List<T> arr) {
        int n = arr.length;

        for (int j = 0; j <= n - 2; j++) {
            
            T item = arr[j];

            int pos = j;
            for (int i = j + 1; i < n; i++) {
                if (less(arr[i], item)) {
                    pos++;
                }
            }

            // Если элемент уже находится в правильном положении
            if (pos == j) {
                continue;
            }

            // игнорировать все повторяющиеся элементы
            while (item.compareTo(arr[pos]) == 0) {
                pos += 1;
            }

           // установите элемент в нужное положение
            if (pos != j) {
                item = replace(arr, pos, item);
            }

            // Повернуть оставшуюся часть цикла
            while (pos != j) {
                pos = j;

                // Найти позицию, в которую мы помещаем элемент
                for (int i = j + 1; i < n; i++) {
                    if (less(arr[i], item)) {
                        pos += 1;
                    }
                }

               // игнорировать все повторяющиеся элементы
                while (item.compareTo(arr[pos]) == 0) {
                    pos += 1;
                }

                // установите элемент в нужное положение
                if (item != arr[pos]) {
                    item = replace(arr, pos, item);
                }
            }
        }

        return arr;
    }

    replace<T extends Comparable<T>> (List<T> arr, int pos, T item) {
        T temp = item;
        item = arr[pos];
        arr[pos] = temp;
        return item;
    }
}
