void main(List<String> args) {
  var reverse=ReverseString();
  print(reverse.reverse('abc123'));
  print(reverse.reverse2('abc123'));
  }

class ReverseString {

  String reverse(String str) => str.split('').toList().reversed.toString();
  
  // second way to reverses the string str and returns it
    String reverse2(String str) {

        if (str.isEmpty) {
            return str;
        }

        List value = str.split('');
        for (int i = 0, j = str.length - 1; i < j; i++, j--) {
            String temp = value[i];
            value[i] = value[j];
            value[j] = temp;
        }
        return value.join();
    }
}
