import 'dart:io';

class HowManyTimesRotated {
  int rotated(List<int> a) {
    int low = 0;
    int high = a.length - 1;
    int mid = 0; // low + (high-low)/2 = (low + high)/2

    while (low <= high) {
      mid = low + (high - low) ~/ 2;

      if (a[mid] < a[mid - 1] && a[mid] < a[mid + 1]) {
        break;
      } else if (a[mid] > a[mid - 1] && a[mid] < a[mid + 1]) {
        high = mid + 1;
      } else if (a[mid] > a[mid - 1] && a[mid] > a[mid + 1]) {
        low = mid - 1;
      }
    }

    return mid;
  }
}

void main(List<String> args) {
  HowManyTimesRotated howManyTimesRotated = HowManyTimesRotated();

  List<int> s = [1, 2, 3, 4, 3, 2, 5, 7, 8];

  print("The array has been rotated  ${howManyTimesRotated.rotated(s)}  times");
}
