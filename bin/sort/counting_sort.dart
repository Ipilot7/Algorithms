// import 'dart:async';

// import 'sort_algorithm.dart';
// import 'sort_utils.dart';
// import 'package:collection/collection.dart';

// class CountingSort with SortUtils implements SortAlgorithm {}

//     @override
//     sort<T extends Comparable<T>>(List<T> list) {

//         Map<T, int> frequency = Map();

//         List sortedArray = List.filled(list.length, 0);

//         list.forEach(v -> frequency.put(v, frequency.getOrDefault(v, 0) + 1));

//         // Filling the sortedArray
//         for (Map. ( element) in frequency.entrySet()) {
//             for (int j = 0; j < element.getValue(); j++) {
//                 sortedArray.add(element.getKey());
//             }
//         }

//         return sortedArray;
//     }
//      streamSort<T extends Comparable<T>>(List<T> list) {
//         return list.Stream()
//                 .collect(toMap(k -> k, v -> 1, (v1, v2) -> v1 + v2, TreeMap::new))
//                 .entrySet()
//                 .stream()
//                 .flatMap(entry -> IntStream.rangeClosed(1, entry.getValue()).mapToObj(t -> entry.getKey()))
//                 .collect(toList());
//      }
// }

// Java implementation of Counting Sort
class CountingSort {
  void sort(List<int> arr) {
    int n = arr.length;

    // The output character array that will have sorted arr
    List<int> output = List.filled(n, 0);

    // Create a count array to store count of individual
    // characters and initialize count array as 0
    List<int> count = List.filled(256, 0);
    for (int i = 0; i < 256; ++i) count[i] = 0;

    // store count of each character
    for (int i = 0; i < n; ++i) ++count[arr[i]];

    // Change count[i] so that count[i] now contains actual
    // position of this character in output array
    for (int i = 1; i <= 255; ++i) count[i] += count[i - 1];

    // Build the output character array
    // To make it stable we are operating in reverse order.
    for (int i = n - 1; i >= 0; i--) {
      output[count[arr[i]] - 1] = arr[i];
      --count[arr[i]];
    }

    // Copy the output array to arr, so that arr now
    // contains sorted characters
    for (int i = 0; i < n; ++i) arr[i] = output[i];
  }

  // Driver method
 
}

 void main(List<String> args) {
    CountingSort ob = new CountingSort(); 
    List<int>arr = [2, 4, 3, 4, 5, 6, 8, 5, 34, 2, 6, 78, 8, 5, 4];
      ob.sort(arr);

    print("Sorted character array is ");
    for (int i = 0; i < arr.length; ++i) print(arr[i]);
  }
