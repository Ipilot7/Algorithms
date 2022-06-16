import 'dart:math';

void main(List<String> args) {
  TimSort sort = TimSort.tree();

  sort.test();
}

class TimSort {
  List<int> array = [];
  int arrayLength = 0;
  int run = 32;

  TimSort(List<int> array) {
    this.array = array;
    this.arrayLength = array.length;
  }

  TimSort.two(int arrayLength) {
    Random rand = Random();

    this.arrayLength = arrayLength;
    this.array = List.filled(this.arrayLength, 0);

    for (int i = 0; i < this.arrayLength; i++) {
      int random_number = rand.nextInt(1000);
      this.array[i] = random_number;
    }
  }

  void change_run(int run) {
    this.run = run;
  }

  TimSort.tree() {
    this.arrayLength = 100;
    this.array = List.filled(this.arrayLength, 0);

    Random rand = Random();
    for (int i = 0; i < this.arrayLength; i++) {
      int random_number = rand.nextInt(1000);
      this.array[i] = random_number;
    }
  }
  void insertion_sort(List<int> array, int start_idx, int end_idx) {
    for (int i = start_idx; i <= end_idx; i++) {
      int current_element = array[i];
      int j = i - 1;
      while (j >= start_idx && array[j] > current_element) {
        array[j + 1] = array[j];
        j--;
      }
      array[j + 1] = current_element;
    }
  }

  void merge_runs(List<int> array, int start, int mid, int end) {
    int first_array_size = mid - start + 1, second_array_size = end - mid;
    List<int> array1 = List.filled(first_array_size, 0),
        array2 = List.filled(second_array_size, 0);
    int i = 0, j = 0, k = 0;

    for (i = 0; i < first_array_size; i++) {
      array1[i] = array[start + i];
    }
    for (i = 0; i < second_array_size; i++) {
      array2[i] = array[mid + 1 + i];
    }

    i = 0;
    j = 0;
    k = start;

    while (i < first_array_size && j < second_array_size) {
      if (array1[i] <= array2[j]) {
        array[k] = array1[i];
        i++;
      } else {
        array[k] = array2[j];
        j++;
      }
      k++;
    }

    while (i < first_array_size) {
      array[k] = array1[i];
      k++;
      i++;
    }

    while (j < second_array_size) {
      array[k] = array2[j];
      k++;
      j++;
    }
  }

  void algorithm() {
    print("Before sorting the array: ");
    this.showArrayElements();

    for (int i = 0; i < this.arrayLength; i += this.run) {
      this.insertion_sort(
          this.array, i, [i + this.run, (this.arrayLength - 1)].reduce(min));
    }

    for (int split = this.run; split < this.arrayLength; split = 2 * split) {
      for (int start_idx = 0;
          start_idx < this.arrayLength;
          start_idx += 2 * split) {
        int mid = start_idx + split - 1;
        int end_idx =
            [(start_idx + 2 * split - 1), (this.arrayLength - 1)].reduce(min);

        this.merge_runs(this.array, start_idx, mid, end_idx);
      }
    }

    print("After sorting the array: ");
    this.showArrayElements();
  }

  void showArrayElements() {
    for (int i = 0; i < this.array.length; i++) {
      print(this.array[i]);
    }
  }

  void test() {
    List<int> array = [4, 1, 3, 17, 12, 11, 8];
    var sorterObj3 = TimSort(array);
    var sorterObj2 = TimSort.two(50);
    var sorterObj1 = TimSort.tree();

    sorterObj1.algorithm();
    // sorterObj2.algorithm();
    // sorterObj3.algorithm();

    for (int i = 0; i < sorterObj1.arrayLength - 1; i++) {
      (sorterObj1.array[i] <= sorterObj1.array[i + 1]);
      print("Array is not sorted");
    }

    for (int i = 0; i < sorterObj2.arrayLength - 1; i++) {
      (sorterObj2.array[i] <= sorterObj2.array[i + 1]);
      print("Array is not sorted");
    }

    for (int i = 0; i < sorterObj3.arrayLength - 1; i++) {
      (sorterObj3.array[i] <= sorterObj3.array[i + 1]);
      print("Array is not sorted");
    }
  }
}
