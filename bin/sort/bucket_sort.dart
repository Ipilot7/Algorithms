import 'dart:math';

void main(List<String> args) {
  Random random = Random();

  List<int> arr = List.filled(10, 0);
  //переполняем с рандомными числами от -50 до 49
  for (int i = 0; i < arr.length - 1; ++i) {
    arr[i] = random.nextInt(49) - 50;
  }

  BucketSort().bucketSort(arr);
  print(arr);
}

class BucketSort {
  bucketSort(List<int> arr) {
    /* get max value of arr */

    int max = arr.reduce((value, element) => value > element ? value : element);

    /* get min value of arr */
    int min = arr.reduce((value, element) => value < element ? value : element);

    /* number of buckets */
    int numberOfBuckets = max - min + 1;

    List<List<int>> buckets = [];

    /* init buckets */
    for (int i = 0; i < numberOfBuckets; ++i) {
      List<int> list = [];
      buckets.add(list);
    }

    /* store elements to buckets */
    for (var value in arr) {
      int hashs = hash(value, min, numberOfBuckets);
      buckets[hashs].add(value);
    }

    /* sort individual bucket */
    for (List<int> bucket in buckets) {
      bucket.sort();
    }

    /* concatenate buckets to origin array */
    int index = 0;
    for (List<int> bucket in buckets) {
      for (int value in bucket) {
        arr[index++] = value;
      }
    }
  }

  int hash(int elem, int min, int numberOfBucket) {
    return ((elem - min) / numberOfBucket).toInt();
  }
}

