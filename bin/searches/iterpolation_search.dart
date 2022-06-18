import 'binarysearch.dart';
import 'dart:math';

class InterpolationSearch {
  int find<num>(List<int> array, int key) {
    // Find indexes of two corners
    int start = 0, end = (array.length - 1);

    // Since array is sorted, an element present
    // in array must be in range defined by corner
    while (start <= end && key >= array[start] && key <= array[end]) {
      // Probing the position with keeping
      // uniform distribution in mind.
      int pos = start +
          (((end - start) ~/ (array[end] - array[start])) *
              (key - array[start]));

      // Condition of target found
      if (array[pos] == key) {
        return pos;
      }

      // If key is larger, key is in upper part
      if (array[pos] < key) {
        start = pos + 1;
      } // If key is smaller, x is in lower part
      else {
        end = pos - 1;
      }
    }
    return -1;
  }

  // Driver method
  
}
void main(List<String> args) {
    BinarySearch binarySearch = BinarySearch();
    Random r = Random();

    List<int> integers = [1,2,3,4,5,6,7,8,9,10];

    // the element that should be found

    InterpolationSearch search = InterpolationSearch();
    int atIndex = search.find(integers, 8);

    print(
        "Found ${integers[atIndex]} at index $atIndex. An array length ${integers.length}");

    int toCheck = binarySearch.find<num>(integers, 7);
    print(
        "Found by system method at an index: $toCheck. Is equal: ${toCheck == atIndex}");
  }