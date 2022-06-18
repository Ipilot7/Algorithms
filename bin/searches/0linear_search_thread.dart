import 'dart:io';
import 'dart:math';

class LinearSearchThread {
  Random random=Random();
   void main(List<String> args) {
        List<int> list = List.filled(200, 0);
        for (int j = 0; j < list.length; j++) {
            list[j] = random.nextInt(list.length) * 100;
        }
        for (int y in list) {
           print("$y  ");
        }
      
      print("Enter number to search for: ");
        
        int x = int.parse(stdin.readLineSync()!);
        Searcher t = new Searcher(list, 0, 50, x);
        Searcher t1 = new Searcher(list, 50, 100, x);
        Searcher t2 = new Searcher(list, 100, 150, x);
        Searcher t3 = new Searcher(list, 150, 200, x);
        t.start();
        t1.start();
        t2.start();
        t3.start();
        try {
            t.join();
            t1.join();
            t2.join();
            t3.join();
        } catch (e) {
        }
        bool found = t.getResult() || t1.getResult() || t2.getResult() || t3.getResult();
        print("Found = $found");
    }
}

class Searcher extends Thread {
    final int[] _arr;
    final int _left, _right;
    final int _x;
    bool _found;

    Searcher(List<int> arr, int left, int right, int x) {
        this._arr = _arr;
        this._left = _left;
        this._right = _right;
        this.__x = _x;
    }

    @override
    void run() {
        int k = _left;
        _found = false;
        while (k < _right && !_found) {
            if (_arr[k++] == _x) {
                _found = true;
            }
        }
    }

    bool getResult() {
        return found;
    }
}
