void main(List<String> args) {
  var v = zigZagPattern();
  print(v.encode('123456789', 5));
}

class zigZagPattern {
  String encode(String s, int numRows) {
    if (numRows < 2 || s.length < numRows) return s;

    int start = 0, index = 0, height = 1, depth = numRows;
    List<String> zigZagedArray = List.filled(s.length, 'fill');

    while (depth != 0) {
      int pointer = start,
          heightSpace = 2 + ((height - 2) * 2),
          depthSpace = 2 + ((depth - 2) * 2);
      bool boolean = true;

      while (pointer < s.length) {
        zigZagedArray[index++] = s[pointer];

        if (heightSpace == 0)
          pointer += depthSpace;
        else if (depthSpace == 0)
          pointer += heightSpace;
        else if (boolean) {
          pointer += depthSpace;
          boolean = false;
        } else {
          pointer += heightSpace;
          boolean = true;
        }
      }
      height++;
      depth--;
      start++;
    }
    return zigZagedArray.join();
  }
}
