void main(List<String> args) {
  Rotation rotation = Rotation();
  print(rotation.rotation('Baxtiyor', 3));
  // rotation.rotation2('Baxtiyor'.split('').toList(), 3);
}

class Rotation {
  //  Переместить символы {@code n} перед заданной строкой в конец
  //  строки временная сложность: O(n) пространственная сложность: O(n)

  String rotation(String text, int n) {
    return text.substring(n) + text.substring(0, n);
  }
  //  Переместить символы {@code n} перед заданным массивом символов в конец
  // массива временная сложность: O(n) пространственная сложность: O(1)

  void rotation2(List<String> values, int n) {
    reverse(values, 0, n - 1);
    reverse(values, n, values.length - 1);
    reverse(values, 0, values.length - 1);

    print(values.join());
  }

  //Обратный символьный массив
  void reverse(List<String> values, int from, int to) {
    while (from < to) {
      String temp = values[from];
      values[from] = values[to];
      values[to] = temp;
      from++;
      to--;
    }
  }
}
