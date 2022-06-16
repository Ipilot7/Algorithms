import 'dart:math';

void main(List<String> args) {
  OddEvenSort oddEvenSort = OddEvenSort();

  List<int> arr = List.filled(100, 0);

  Random random = Random();

  // Print out unsorted elements
  for (int i = 0; i < arr.length; ++i) {
    arr[i] = random.nextInt(100) - 50;
    print(arr[i]);
  }
  print("--------------");

  oddEvenSort.oddEvenSort(arr);

  //Print Sorted elements
  for (int i = 0; i < arr.length - 1; ++i) {
    print(arr[i]);
    arr[i] <= arr[i + 1];
  }
}

class OddEvenSort {
  void oddEvenSort(List<int> arr) {
    bool sorted = false;
    while (!sorted) {
      sorted = true;

      for (int i = 1; i < arr.length - 1; i += 2) {
        if (arr[i] > arr[i + 1]) {
          swap(arr, i, i + 1);
          sorted = false;
        }
      }

      for (int i = 0; i < arr.length - 1; i += 2) {
        if (arr[i] > arr[i + 1]) {
          swap(arr, i, i + 1);
          sorted = false;
        }
      }
    }
  }

  void swap(List<int> arr, int i, int j) {
    int temp = arr[i];
    arr[i] = arr[j];
    arr[j] = temp;
  }
}
