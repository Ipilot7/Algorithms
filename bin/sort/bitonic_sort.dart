void main(List<String> args) {
  List<int> a = [3, 7, 4, 8, 6, 2, 1, 5];
  int up = 1;
  BitonicSort ob = BitonicSort();
  ob.sort(a, a.length, up);
  print("\nSorted array");
  ob.printArray(a);
}

class BitonicSort {
  /* Параметр dir указывает направление сортировки,
ВОСХОДЯЩИЙ или НИСХОДЯЩИЙ; если (a[i] > a[j]) согласен
с направлением, то a [i] и a[j] являются
взаимозаменяемыми. */
  void compAndSwap(List<int> a, int i, int j, int dir) {
    if ((a[i] > a[j] && dir == 1) || (a[i] < a[j] && dir == 0)) {
      // Swapping elements
      int temp = a[i];
      a[i] = a[j];
      a[j] = temp;
    }
  }

  /* Он рекурсивно сортирует последовательность битонов в
порядке возрастания, если dir = 1, и в порядке убывания в противном случае
(означает dir=0). Последовательность, подлежащая сортировке, начинается с
нижней позиции индекса, параметр cnt - это количество
элементов, подлежащих сортировке.*/

  void bitonicMerge(List<int> a, int low, int cnt, int dir) {
    if (cnt > 1) {
      int k = cnt ~/ 2;
      for (int i = low; i < low + k; i++) {
        compAndSwap(a, i, i + k, dir);
      }
      bitonicMerge(a, low, k, dir);
      bitonicMerge(a, low + k, k, dir);
    }
  }

  /* Это упорядочивает две его половины в противоположных
порядках сортировки, и функция сначала создает битоническую последовательность
рекурсивно, а затем вызывает битоническое слияние, чтобы сделать их в
том же порядке */

  void bitonicSort(List<int> a, int low, int cnt, int dir) {
    if (cnt > 1) {
      int k = cnt ~/ 2;

      // сортировка в порядке возрастания, так как dir здесь равен 1
      bitonicSort(a, low, k, 1);

      // сортировка в порядке убывания, так как dir здесь равен 0
      bitonicSort(a, low + k, k, 0);

      // Объединит всю последовательность в порядке возрастания
      // так как dir=1.
      bitonicMerge(a, low, cnt, dir);
    }
  }

  /*Вызывающий элемент bitonic Sort для сортировки всего массива
длиной N в порядке ВОЗРАСТАНИЯ */

  void sort(List<int> a, int N, int up) {
    bitonicSort(a, 0, N, up);
  }

  /*Служебная функция для печати массива размера n */

  void printArray(List<int> arr) {
    int n = arr.length;
    for (int i = 0; i < n; ++i) {
      print('${arr[i]}  ');
    }
    print(' \n');
  }
}
