List<int> mergeSort(List<int> array) {
  // Остановить рекурсию, если массив содержит только один элемент
  if (array.length <= 1) {
    return array;
  }

 // разделение в середине массива
  int splitIndex = array.length ~/ 2;

// рекурсивно вызываем сортировку слиянием по левому и правому массивам
  List<int> leftArray = mergeSort(array.sublist(0, splitIndex));
  List<int> rightArray = mergeSort(array.sublist(splitIndex));

  return merge(leftArray, rightArray);
}

List<int> merge(left_array, right_array) {
  List<int> result = [];
  int? i = 0;
  int? j = 0;

 // // Поиск наименьшего элемента в левом и правом массивах
  // массив и вставьте его в результат
  // После цикла только один массив имеет оставшиеся элементы
  while (i! < left_array.length && j! < right_array.length) {
    if (left_array[i] <= right_array[j]) {
      result.add(left_array[i]);
      i++;
    } else {
      result.add(right_array[j]);
      j++;
    }
  }
// Вставить оставшиеся элементы левого массива в результат
  // до тех пор, пока есть оставшиеся элементы
  while (i! < left_array.length) {
    result.add(left_array[i]);
    i++;
  }

// Вставить оставшиеся элементы правого массива в результат
  // до тех пор, пока есть оставшиеся элементы
  while (j! < right_array.length) {
    result.add(right_array[j]);
    j++;
  }

  return result;
}

void main(List<String> args) {
  List<int> arr = [4, 23, 6, 78, 1, 54, 231, 9, 12];

  print(mergeSort(arr));

}
