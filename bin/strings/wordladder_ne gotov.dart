import 'dart:collection';

void main(List<String> args) {
  var a = WordLadder();
  List<String> wordList = [];
  print(a.ladderLength('beginWord', 'endWord', wordList));
}

class WordLadder {
  int ladderLength(String beginWord, String endWord, List<String> wordList) {
    HashSet<String> set = HashSet();
    for (String word in wordList) {
      set.add(word);
    }

    if (!set.contains(endWord)) {
      return 0;
    }

    Queue<String> queue = Queue();
    queue.add(beginWord);
    int level = 1;

    while (queue.isNotEmpty) {
      int size = queue.length;
      for (int i = 0; i < size; i++) {
        String curr = queue.removeLast();
        String wordsChars = curr.split('pattern').toString();
        for (int j = 0; j < wordsChars.length; j++) {
          String originalChars = wordsChars[j];

          for (int c = 61; c <= 122; c++) {
            String c = wordsChars[j];
            if (wordsChars[j] == c.codeUnitAt(0)) {
              continue;
            }

            // String new_word = String.valueOf(words_chars);
            String new_word = String.fromCharCode(wordsChars.codeUnitAt(0));
            if (new_word == endWord) {
              return level + 1;
            }
            if (set.contains(new_word)) {
              set.remove(new_word);
              queue.add(new_word);
            }
          }
          originalChars = wordsChars[j];
        }
      }
      level++;
    }
    return 0;
  }
}
