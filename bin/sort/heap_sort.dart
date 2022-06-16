
import 'sort_algorithm.dart';
import 'sort_utils.dart';

 class Heap with SortUtils implements SortAlgorithm{

        List _heap;

        Heap(this._heap) {
            this._heap = _heap;
        }

        void heapSubtree(int rootIndex, int lastChild) {
            int leftIndex = rootIndex * 2 + 1;
            int rightIndex = rootIndex * 2 + 2;
            var root = _heap[rootIndex];
            if (rightIndex <= lastChild) { // if has right and left children
                var left = _heap[leftIndex];
                var right = _heap[rightIndex];
                if (less<num>(left, right) && less<num>(left, root)) {
                    swap(_heap, leftIndex, rootIndex);
                    heapSubtree(leftIndex, lastChild);
                } else if (less<num>(right, root)) {
                    swap(_heap, rightIndex, rootIndex);
                    heapSubtree(rightIndex, lastChild);
                }
            } else if (leftIndex <= lastChild) { // if no right child, but has left child
                var left = _heap[leftIndex];
                if (less<num>(left, root)) {
                    swap(_heap, leftIndex, rootIndex);
                    heapSubtree(leftIndex, lastChild);
                }
            }
        }

        void makeMinHeap(int root) {
            int leftIndex = root * 2 + 1;
            int rightIndex = root * 2 + 2;
            bool hasLeftChild = leftIndex < _heap.length;
            bool hasRightChild = rightIndex < _heap.length;
            if (hasRightChild) { // if has left and right
                makeMinHeap(leftIndex);
                makeMinHeap(rightIndex);
                heapSubtree(root, _heap.length - 1);
            } else if (hasLeftChild) {
                heapSubtree(root, _heap.length - 1);
            }
        }
        getRoot(int size) {
            swap(_heap, 0, size);
            heapSubtree(0, size - 1);
            return _heap[size]; // return old root
        }
        
          @override
          sort<T extends Comparable<T>>(List<T> unsorted) {
            // TODO: implement sort
            throw UnimplementedError();
          }
    }

class HeapSort with SortUtils implements SortAlgorithm  {

   

    @override
    sort <T extends Comparable<T>>(List<T> unsorted) {
        return sort(unsorted);
    }

    @override
    List<int>sort1<T extends Comparable<T>>(List<T> unsorted) {
        int size = unsorted.length;

      
        Heap heap = Heap(unsorted);

        heap.makeMinHeap(0); // make min heap using index 0 as root.
        List<int> sorted = [];
        while (size > 0) {
            int min = heap.getRoot(--size);
            sorted.add(min);
        }       

        return sorted;
    }
}

void main(List<String> args) {
        List<int> heap = [4, 23, 6, 78, 1, 54, 231, 9, 12];
        HeapSort heapSort = HeapSort();
        print(heapSort.sort1<num>(heap));
    }


// void main() {

//   var a = "SORTEXAMPLE".split('');
  
//   print('Printing list of string unsorted');
//   HeapSort.show(a);
  
//   HeapSort.sort(a);
  
//   print('Printing list of string sorted');
//   HeapSort.show(a);
  
// }
// class HeapSort {

//   static void sort(List<Comparable> pq) { 
    
//     int N = pq.length;
//     for (int k = (N/2).toInt(); k >= 1; k--) {
//       _sink(pq, k, N);
//     }
    
//     while (N > 1) {
//       _exch(pq, 1, N--);
//       _sink(pq, 1, N);
//     }
//   }
// //Вспомогательные функции для восстановления инварианта кучи.
//   static void _sink(List<Comparable> pq, int k, int N) {
//     while (2*k <= N) {
//       int j = 2*k;
//       if (j < N && _lessWithComparable(pq, j, j+1)) {
//         j++;
//       }
      
//       if (!_lessWithComparable(pq, k, j)) {
//         break;
//       }
      
//       _exch(pq, k, j);
//       k = j;
//     }
//   }
  
//   //
//  //Вспомогательные функции для сравнений и свопов.
//   //Индексы "отключены по одному" для поддержки индексации на основе 1.
//   static bool _lessWithComparable(List<Comparable> pq, int i, int j) {
//     return pq[i-1].compareTo(pq[j-1]) < 0;
//   }
  
//   static void _exch(List pq, int i, int j) {
//     var swap = pq[i-1];
//     pq[i-1] = pq[j-1];
//     pq[j-1] = swap;
//   }
  
//   // is v < w ?
//   static bool _less(Comparable v, Comparable w) {
//     return (v.compareTo(w) < 0);
//   }
  
//   // Проверьте, отсортирован ли массив - полезно для отладки
//   static bool _isSorted(List<Comparable> a) { 
//     for(int i=1; i<a.length; i++) {
//       if (_less(a[i], a[i-1])) {
//         return false;
//       }
//     }
    
//     return true; 
//   }
  
//   // печать в стандартный вывод
//   static show(List<Comparable> a) {
//     for (int i = 0; i < a.length; i++) {
//       print(a[i]);
//     }
//   }
// }