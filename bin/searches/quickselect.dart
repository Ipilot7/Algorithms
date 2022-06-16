import '../sort/sort_utils.dart';

mixin QuickSelect {
  select<T extends Comparable<T>>(List<T> list, int n) {
    requireNonNull(list, "The list of elements must not be null.");

    if (list.length == 0) {
      String msg = "The list of elements must not be empty.";
      throw Exception(msg);
    }

    if (n < 0) {
      String msg = "The index must not be negative.";
      throw Exception(msg);
    }

    if (n >= list.length) {
      String msg = "The index must be less than the number of elements.";
      throw Exception(msg);
    }

    int index = selectIndex(list, n);
    return list[index];
  }

  int selectIndex<T extends Comparable<T>>(List<T> list, int n) {
    return selectIndex1(list, 0, list.length - 1, n);
  }

  int selectIndex1<T extends Comparable<T>>(
      List<T> list, int left, int right, int n) {
    while (true) {
      if (left == right) return left;
      int pivotIndex = pivot(list, left, right);
      pivotIndex = partition(list, left, right, pivotIndex, n);
      if (n == pivotIndex) {
        return n;
      } else if (n < pivotIndex) {
        right = pivotIndex - 1;
      } else {
        left = pivotIndex + 1;
      }
    }
  }

  int partition<T extends Comparable<T>>(
      List<T> list, int left, int right, int pivotIndex, int n) {
    T pivotValue = list[pivotIndex];
    swap(list, pivotIndex, right);
    int storeIndex = left;

    for (int i = left; i < right; i++) {
      if (list[i].compareTo(pivotValue) < 0) {
        swap(list, storeIndex, i);
        storeIndex++;
      }
    }

    int storeIndexEq = storeIndex;

    for (int i = storeIndex; i < right; i++) {
      if (list[i].compareTo(pivotValue) == 0) {
        swap(list, storeIndexEq, i);
        storeIndexEq++;
      }
    }

    swap(list, right, storeIndexEq);

    return (n < storeIndex) ? storeIndex : n;
  }

  int pivot<T extends Comparable<T>>(List<T> list, int left, int right) {
    if (right - left < 5) {
      return partition5(list, left, right);
    }

    for (int i = left; i < right; i += 5) {
      int subRight = i + 4;
      if (subRight > right) {
        subRight = right;
      }
      int median5 = partition5(list, i, subRight);
      int rightIndex = left + (i - left) ~/ 5;
      swap(list, median5, rightIndex);
    }

    int mid = (right - left) ~/ 10 + left + 1;
    int rightIndex = left + (right - left) ~/ 5;
    return selectIndex1(list, left, rightIndex, mid);
  }

  int partition5<T extends Comparable<T>>(List<T> list, int left, int right) {
    List<T> ts = list.sublist(left, right);
    ts.sort();
    return (left + right) >>> 1;
  }
}

requireNonNull<T>(T obj, String message) {
  if (obj == null) throw Exception("$obj : $message");
  return obj;
}

 bool swap<T>(List<T> array, int idx, int idy) {
    T swap = array[idx];
    array[idx] = array[idy];
    array[idy] = swap;
    return true;
  }